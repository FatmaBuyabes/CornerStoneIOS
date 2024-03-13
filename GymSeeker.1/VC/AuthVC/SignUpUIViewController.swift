//
//  SignUpUIViewController.swift
//  GymSeeker.1
//
//  Created by Fatma Buyabes on 10/03/2024.
//

import Foundation
import UIKit

class SignUpUIViewController: UIViewController {

    // MARK: - Properties

    var usernameTextField: UITextField!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var genderSegmentedControl: UISegmentedControl!
    var phoneTextField: UITextField!
    var signUpButton: UIButton!
    let usernameLabel = UILabel()
    let phoneLabel = UILabel()
    let emailLabel = UILabel()
    let passwordLabel = UILabel()
    let genderLabel = UILabel()
    


    // MARK: - View Lifecycle

    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        title = "Sign Up"
        setupUI()
        setupConstraints()
        
    }

    // MARK: - UI Setup

    func setupUI() {
            // Username Text Field
        // Username Label
        usernameLabel.text = "Username"
        view.addSubview(usernameLabel)

        // Username Text Field
        usernameTextField = UITextField()
        usernameTextField.placeholder = "Enter username"
        usernameTextField.borderStyle = .roundedRect
        view.addSubview(usernameTextField)

        // Email Label
        
        emailLabel.text = "Email"
        view.addSubview(emailLabel)

        // Email Text Field
        emailTextField = UITextField()
        emailTextField.placeholder = "Enter email"
        emailTextField.borderStyle = .roundedRect
        view.addSubview(emailTextField)

        // Password Label
        
        passwordLabel.text = "Password"
        view.addSubview(passwordLabel)

        // Password Text Field
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Enter password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)

        // Gender Label
        
        genderLabel.text = "Gender"
        view.addSubview(genderLabel)

        // Gender Segmented Control
        genderSegmentedControl = UISegmentedControl(items: ["Female", "Male"])
        genderSegmentedControl.selectedSegmentIndex = 0 // Default to Female
        view.addSubview(genderSegmentedControl)

        // Phone Label
        
        phoneLabel.text = "Phone Number"
        view.addSubview(phoneLabel)

        // Phone Text Field
        phoneTextField = UITextField()
        phoneTextField.placeholder = "Enter phone number"
        phoneTextField.borderStyle = .roundedRect
        phoneTextField.keyboardType = .numberPad
        phoneTextField.delegate = self
        phoneTextField.addTarget(self, action: #selector(phoneTextFieldDidChange(_:)), for: .editingChanged) // Add target for text change event
        view.addSubview(phoneTextField)

        // Sign Up Button
        signUpButton = UIButton(type: .system)
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = .orange
        signUpButton.layer.cornerRadius = 8
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        view.addSubview(signUpButton)
    }

        // MARK: - Constraints Setup

    func setupConstraints() {
        
        usernameLabel.snp.makeConstraints { make in
               make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
               make.leading.equalTo(view).offset(20)
           }
           usernameTextField.snp.makeConstraints { make in
               make.top.equalTo(usernameLabel.snp.bottom).offset(8)
               make.leading.trailing.equalToSuperview().inset(20)
           }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.leading.equalTo(view).offset(20)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.equalTo(view).offset(20)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneTextField.snp.bottom).offset(20)
            make.leading.equalTo(view).offset(20)
        }

        // Constraints for genderSegmentedControl
        genderSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.equalTo(view).offset(20)
        }
        phoneTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        // Example constraints for sign-up button
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(genderSegmentedControl.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
            
        }
        
    }
        
    
    // MARK: - Button Action

    @objc func signUpButtonTapped() {
        guard let username = usernameTextField.text, !username.isEmpty else {
            presentAlertWithTitle(title: "Error", message: "Username is required")
            return
        }

        guard let email = emailTextField.text, !email.isEmpty else {
            presentAlertWithTitle(title: "Error", message: "Email is required")
            return
        }

        guard let password = passwordTextField.text, !password.isEmpty else {
            presentAlertWithTitle(title: "Error", message: "Password is required")
            return
        }

        let genderIndex = genderSegmentedControl.selectedSegmentIndex
        let gender = genderIndex == 0 ? "Female" : "Male" // Map segmented control index to gender string

        // Optionally validate other fields like phone number here

        let user = User(username: username, email: email, phoneNumber: phoneTextField.text, gender: gender, password: password)

        NetworkManager.shared.signup(user: user) { [weak self] result in
            switch result {
            case .success(let tokenResponse):
                print("Signup successful. Token: \(tokenResponse.token)")
                // Optionally perform any action upon successful signup, like navigating to the main screen
                DispatchQueue.main.async {
                    // Example: Navigate to the main screen
                    let mainVC = MainViewController()
                    mainVC.token = tokenResponse.token
                    mainVC.user = user
                    self?.navigationController?.pushViewController(mainVC, animated: true)
                }
            case .failure(let error):
                print("Signup failed. Error: \(error.localizedDescription)")
                // Optionally handle failure, such as displaying an error message
                DispatchQueue.main.async {
                    self?.presentAlertWithTitle(title: "Error", message: "Sign up failed. Please try again.")
                }
            }
        }
    }


        // MARK: - Helper Methods

        private func presentAlertWithTitle(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
extension SignUpUIViewController: UITextFieldDelegate {
    ///phone only numbers func
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
        
        
        
    }
    ///  for the phone number  of digit func 
    @objc func phoneTextFieldDidChange(_ textField: UITextField) {
            guard let text = textField.text else { return }
            if text.count > 8 { // If more than 8 digits, truncate the text
                let index = text.index(text.startIndex, offsetBy: 8)
                textField.text = String(text.prefix(upTo: index))
            }
        }
}

