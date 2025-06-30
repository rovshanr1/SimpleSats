//
//  ProfileVC.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 24.06.25.
//

import UIKit

class ProfileVC: UIViewController {
    //ViewModels
    private let vm = ProfileVM()
    
    //ScrollView
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    //Properties
    private let backgroundGlow = BackgroundGlow()
    private let photosPicker = ProfilePhotoPicker()
    
    //CustomTextFields
    private let nameTextField = CustomTextField(type: .name, placeholder: "please enter your name")
    private let emailTextField = CustomTextField(type: .email, placeholder: "plesae enter your email")
    private let passwordTextField = CustomTextField(type: .password, placeholder: "please enter yout password")
    
    //Custom UIButtons
    private let settingButton = SettingsButton(frame: .zero)
    private let informationButton = InformationButton(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupUI()
        hideKeyboard()
        observeKeyboardAdjustments(for: scrollView)
        if let image = vm.loadImageForDocuments(fileName: "profile_photo.jpg"){
            photosPicker.setImage(image)
        }
    }
    
    private func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.keyboardDismissMode = .interactive
        
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupUI(){
        setupGradientBackground()
        setupProfilePhotosPicker()
        setupNameTextField()
        setEmailTextField()
        setPasswordTextFild()
        setSettingButton()
        setupInformationButton()
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
        contentView.addSubview(photosPicker)
        photosPicker.translatesAutoresizingMaskIntoConstraints = false
        photosPicker.delegate = self
        
        NSLayoutConstraint.activate([
            photosPicker.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photosPicker.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
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
    
    private func setupNameTextField() {
        let lable = UILabel()
        lable.text = "Name"
        lable.textColor = .white
        lable.font = .semiBoldLivvic(selfSize: 16)
        
        contentView.addSubview(lable)
        contentView.addSubview(nameTextField)
        lable.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lable.topAnchor.constraint(equalTo: photosPicker.bottomAnchor, constant: 30),
            lable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            
            nameTextField.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 4),
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            nameTextField.heightAnchor.constraint(equalToConstant: 54),
        ])
    }
    
    private func setEmailTextField(){
        let lable = UILabel()
        lable.text = "E-Mail"
        lable.textColor = .white
        lable.font = .semiBoldLivvic(selfSize: 16)
        
        contentView.addSubview(lable)
        contentView.addSubview(emailTextField)
        lable.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lable.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 22 ),
            lable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            
            emailTextField.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 4),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            emailTextField.heightAnchor.constraint(equalToConstant: 54)
            
        ])
        
    }
    
    private func setPasswordTextFild(){
        let lable = UILabel()
        lable.text = "Password"
        lable.textColor = .white
        lable.font = .semiBoldLivvic(selfSize: 16)
        
        contentView.addSubview(lable)
        contentView.addSubview(passwordTextField)
        lable.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lable.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 22 ),
            lable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            
            passwordTextField.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 4),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            passwordTextField.heightAnchor.constraint(equalToConstant: 54),

            
        ])
    }
    
    private func setSettingButton(){
        settingButton.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
        contentView.addSubview(settingButton)
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
            settingButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 42),
            settingButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -42),
            settingButton.heightAnchor.constraint(equalToConstant: 36),
        ])
        
    }
    
    @objc private func settingButtonTapped(){
        let settingVC = SettingVC()
        navigationController?.pushViewController(settingVC, animated: true)
    }
    
    private func setupInformationButton(){
        informationButton.addTarget(self, action: #selector(informationButtonTapped), for: .touchUpInside)
        contentView.addSubview(informationButton)
        informationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            informationButton.topAnchor.constraint(equalTo: settingButton.bottomAnchor,constant: 24),
            informationButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 42),
            informationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -42),
            informationButton.heightAnchor.constraint(equalToConstant: 36),
            informationButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
    }
    
    @objc private func informationButtonTapped(){
        let informationVC = InformationVC()
        navigationController?.pushViewController(informationVC, animated: true)
    }
    
}


extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
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
