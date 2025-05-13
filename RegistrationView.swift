//
//  RegistrationView.swift
//  changeMakers
//
//  Created by Alumno on 13/05/25.
//


// Professional RegistrationView.swift

import SwiftUI
import PhotosUI

struct RegistrationView: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var imagePickerSource: PhotoPicker.SourceType = .photoLibrary
    @State private var shirtSize: String = "M"
    @State private var pantsSize: String = "M"
    @State private var shoeSize: String = "8"
    @State private var isRegistered = false
    @State private var showAlert = false
    @State private var showImageSourceSheet = false

    private let clothingSizes = ["XS", "S", "M", "L", "XL", "XXL"]
    private let shoeSizes = ["6", "7", "8", "9", "10", "11"]

    var body: some View {
        VStack {
            RegistrationHeader()
            
            NavigationView {
                ScrollView {
                    VStack(spacing: 24) {
                        
                        // MARK: - Profile Photo
                        VStack(spacing: 12) {
                            Text("Foto de perfil")
                                .font(.headline)
                                .foregroundColor(.liverpoolPink)
                            
                            Button(action: { showImageSourceSheet = true }) {
                                if let image = selectedImage {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120, height: 120)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.liverpoolPink, lineWidth: 3))
                                } else {
                                    ZStack {
                                        Circle()
                                            .fill(Color(.systemGray6))
                                            .frame(width: 120, height: 120)
                                        Image(systemName: "camera.fill")
                                            .font(.system(size: 40))
                                            .foregroundColor(.liverpoolPink)
                                    }
                                }
                            }
                            .confirmationDialog("Selecciona una opción", isPresented: $showImageSourceSheet) {
                                Button("Tomar foto") {
                                    imagePickerSource = .camera
                                    isShowingImagePicker = true
                                }
                                Button("Elegir de galería") {
                                    imagePickerSource = .photoLibrary
                                    isShowingImagePicker = true
                                }
                                Button("Cancelar", role: .cancel) {}
                            }
                            .sheet(isPresented: $isShowingImagePicker) {
                                PhotoPicker(sourceType: imagePickerSource, image: $selectedImage)
                            }
                        }

                        // MARK: - Personal Info
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Información Personal")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.liverpoolPink)

                            CustomInputField(placeholder: "Nombre completo", text: $fullName)
                            CustomInputField(placeholder: "Correo electrónico", text: $email, keyboardType: .emailAddress)
                        }
                        .padding(.horizontal, 32)

                        // MARK: - Sizes
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Selecciona tus tallas")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.liverpoolPink)
                                .padding(.horizontal)

                            SizeSegmentedPicker(title: "Camisa", options: clothingSizes, selection: $shirtSize)
                            SizeSegmentedPicker(title: "Pantalón", options: clothingSizes, selection: $pantsSize)
                            SizeSegmentedPicker(title: "Zapatos", options: shoeSizes, selection: $shoeSize)
                        }
                        .padding(.horizontal)

                        // MARK: - Register Button
                        Button(action: register) {
                            Text(isRegistered ? "¡Registrado!" : "Registrar ahora")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(canSubmit ? Color.liverpoolPink : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                        .disabled(!canSubmit).padding(.horizontal,39)

                        if isRegistered {
                            Text("🎉 ¡Bienvenido, \(fullName)! Tu registro fue exitoso.")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.green)
                        }
                    }
                    .padding(.vertical)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Faltan datos"),
                    message: Text("Completa tu nombre, correo y agrega una foto de perfil para continuar."),
                    dismissButton: .default(Text("Entendido"))
                )
            }
        }
    }

    private var canSubmit: Bool {
        !fullName.isEmpty && !email.isEmpty && selectedImage != nil
    }

    private func register() {
        guard canSubmit else {
            showAlert = true
            return
        }
        withAnimation {
            isRegistered = true
        }
        // Aquí podrías guardar los datos o llamar a una API
    }
}

struct CustomInputField: View {
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        TextField(placeholder, text: $text)
            .padding().bold()
            .keyboardType(keyboardType)
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.16)))
    }
}


// MARK: - PhotoPicker
struct PhotoPicker: UIViewControllerRepresentable {
    enum SourceType { case photoLibrary, camera }
    var sourceType: SourceType
    @Binding var image: UIImage?
    @Environment(\.presentationMode) private var presentationMode

    func makeUIViewController(context: Context) -> UIViewController {
        switch sourceType {
        case .photoLibrary:
            var config = PHPickerConfiguration()
            config.filter = .images
            config.selectionLimit = 1
            let picker = PHPickerViewController(configuration: config)
            picker.delegate = context.coordinator
            return picker
        case .camera:
            let picker = UIImagePickerController()
            picker.delegate = context.coordinator
            picker.sourceType = .camera
            return picker
        }
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    class Coordinator: NSObject, PHPickerViewControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: PhotoPicker
        init(_ parent: PhotoPicker) { self.parent = parent }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.presentationMode.wrappedValue.dismiss()
            guard let provider = results.first?.itemProvider,
                  provider.canLoadObject(ofClass: UIImage.self) else { return }
            provider.loadObject(ofClass: UIImage.self) { object, _ in
                DispatchQueue.main.async { self.parent.image = object as? UIImage }
            }
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.presentationMode.wrappedValue.dismiss()
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

// MARK: - SizeSegmentedPicker
struct SizeSegmentedPicker: View {
    let title: String
    let options: [String]
    @Binding var selection: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            Picker("\(title)", selection: $selection) {
                ForEach(options, id: \.self) { size in Text(size) }
            }
            .pickerStyle(.segmented)
            .tint(.pink)
        }
        .padding(.horizontal)
    }
}

struct RegistrationHeader: View {
    
    var body: some View{
        ZStack {
            VStack {
                HStack(spacing: 12) {
                    Spacer()
                    Text("Usuario")
                        .font(.title2)
                        .foregroundColor(Color.white)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top)

                Spacer(minLength: 0)
            }
        }
        .background(Color.liverpoolPink)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 12)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
