//
//  ProfileVC.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 24.06.25.
//

import UIKit

class ProfileVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private let vm = ProfileVM()
    
    private let backgroundGlow = BackgroundGlow()
    private let photosPicker = ProfilePhotoPicker()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        if let image = vm.loadImageForDocuments(fileName: "profile_photo.jpg"){
            photosPicker.setImage(image)
        }
    }
    
    private func setupUI(){
        setupGradientBackground()
        setupProfilePhotosPicker()
    }
    
    private func setupGradientBackground() {
        view.addSubview(backgroundGlow)
        backgroundGlow.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundGlow.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundGlow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundGlow.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundGlow.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        view.sendSubviewToBack(backgroundGlow)
    }
    
    private func setupProfilePhotosPicker(){
        view.addSubview(photosPicker)
        photosPicker.translatesAutoresizingMaskIntoConstraints = false
        photosPicker.delegate = self
        
        NSLayoutConstraint.activate([
            photosPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photosPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            photosPicker.widthAnchor.constraint(equalToConstant: 125),
            photosPicker.heightAnchor.constraint(equalToConstant: 125)
        ])
    }
    
    func presentedPhotoPicker(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let selectedImage = info[.editedImage] as? UIImage {
            let fileName = "profile_photo.jpg"
            if let _ = vm.saveImageToDocuments(image: selectedImage, fileName: fileName){
                photosPicker.setImage(selectedImage)
            }
        }
    }
}


extension ProfileVC: ProfilePhotoPickerDelegate {

    
    func didTapPickerPhoto() {
        presentedPhotoPicker()
    }
}
