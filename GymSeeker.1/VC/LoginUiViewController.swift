//
//  LoginUiViewController.swift
//  GymSeeker.1
//
//  Created by Fatma Buyabes on 10/03/2024.
//

import UIKit
import Foundation
import SnapKit

class LoginUiViewController: UIViewController {

    // MARK: - Properties
    var backgroundImageView: UIImageView!
    var usernameTextField: UITextField!
    var passwordTextField: UITextField!
    var blurEffectView: UIVisualEffectView!
    var loginButton: UIButton!
    var usernameLabel: UILabel!
    var passwordLabel: UILabel!
    let signUpLabel = UILabel()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Log In"
        setupUI()
        setUpLayout()
        setUpNavigationBar()
        setupNavBar()
        
        //setupBackground()
    }

    // MARK: - UI Setup

    func setupUI() {
            signUpLabel.text = "Don't have an account? Sign up"
            signUpLabel.textColor = .gray
            signUpLabel.textAlignment = .center
            signUpLabel.font = UIFont.systemFont(ofSize: 14)
            view.addSubview(signUpLabel)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(signUpLabelTapped))
            signUpLabel.isUserInteractionEnabled = true
            signUpLabel.addGestureRecognizer(tapGestureRecognizer)
        
                usernameTextField = UITextField()
                usernameTextField.placeholder = "Username"
                usernameTextField.borderStyle = .roundedRect
                usernameTextField.backgroundColor = .white // White background color
                usernameTextField.textColor = .black // Black text color
                view.addSubview(usernameTextField)
                
                passwordTextField = UITextField()
                passwordTextField.placeholder = "Password"
                passwordTextField.isSecureTextEntry = true
                passwordTextField.borderStyle = .roundedRect
                passwordTextField.backgroundColor = .white
                passwordTextField.textColor = .black
                view.addSubview(passwordTextField)
        
                usernameLabel = UILabel()
                usernameLabel.text = "Username"
                usernameLabel.textColor = .black
                view.addSubview(usernameLabel)
                
                passwordLabel = UILabel()
                passwordLabel.text = "Password"
                passwordLabel.textColor = .black
                view.addSubview(passwordLabel)
        
                
                loginButton = UIButton(type: .system)
                loginButton.setTitle("Log In", for: .normal)
                loginButton.setTitleColor(.white, for: .normal)
                loginButton.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.9)
                loginButton.layer.cornerRadius = 8
                loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
                loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
                view.addSubview(loginButton)
    }
    func setUpLayout(){
                usernameLabel.snp.makeConstraints { make in
                   make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
                   make.leading.equalToSuperview().offset(30)
               }

               
               usernameTextField.snp.makeConstraints { make in
                   make.top.equalTo(usernameLabel.snp.bottom).offset(8)
                   make.leading.equalToSuperview().offset(30)
                   make.trailing.equalToSuperview().offset(-30)
                   make.height.equalTo(40)
               }

               
               passwordLabel.snp.makeConstraints { make in
                   make.top.equalTo(usernameTextField.snp.bottom).offset(20)
                   make.leading.equalToSuperview().offset(30)
               }

               
               passwordTextField.snp.makeConstraints { make in
                   make.top.equalTo(passwordLabel.snp.bottom).offset(8)
                   make.leading.trailing.height.equalTo(usernameTextField)
               }
               
                loginButton.snp.makeConstraints { make in
                    make.top.equalTo(passwordTextField.snp.bottom).offset(20)
                    make.leading.trailing.equalTo(usernameTextField)
                    make.height.equalTo(50)
                }
                
                signUpLabel.snp.makeConstraints { make in
                make.top.equalTo(loginButton.snp.bottom).offset(20)
                make.centerX.equalToSuperview()
            }
               
    }
    @objc func signUpLabelTapped() {
        // Navigate to the sign-up screen
        let signUpVC = SignUpUIViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }

    

    // MARK: - Button Action

    @objc func loginButtonTapped() {
        guard let username = usernameTextField.text, !username.isEmpty else {
            presentAlertWithTitle(title: "Error", message: "Username is required")
            return
        }

        guard let password = passwordTextField.text, !password.isEmpty else {
            presentAlertWithTitle(title: "Error", message: "Password is required")
            return
        }

        let user = User(username: username, email: nil,  phoneNumber: nil, gender: nil, password: password)

        NetworkManager.shared.signin(user: user) { result in
            switch result {
            case .success(let tokenResponse):
                                print("Login successful")
                // MARK: Navigate to the main screen
                let mainVC = MainViewController()
                mainVC.token = tokenResponse.token
                mainVC.user = user
                self.navigationController?.pushViewController(mainVC, animated: true)
            case .failure(let error):
                // Authentication failed, display error message
                print("Login failed: \(error.localizedDescription)")
                self.presentAlertWithTitle(title: "Error", message: "Invalid username or password")
            }
        }
    }
    
    func setUpNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }



    // MARK: - Helper Methods

    private func presentAlertWithTitle(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "info.circle.fill"),
            style: .plain,
            target: self,
            action: #selector(navIns)
        )
        navigationItem.rightBarButtonItem?.tintColor = UIColor.red
        
    }
    
    @objc func navIns(){
        let policyVC = PolicyViewController()
        policyVC.modalPresentationStyle = .popover
        self.present(policyVC, animated: true)
        
    }
    
//    func setupBackground() {
//            // Background Image
//            backgroundImageView = UIImageView(image: UIImage(named: "background_image")) // Replace "background_image" with your actual image name
//            backgroundImageView.contentMode = .scaleAspectFill
//            view.addSubview(backgroundImageView)
//            backgroundImageView.snp.makeConstraints { make in
//                make.edges.equalToSuperview()
//            }
//
//            // Blur Effect View
//            let blurEffect = UIBlurEffect(style: .regular) // Change the style to adjust the blur effect
//            blurEffectView = UIVisualEffectView(effect: blurEffect)
//            view.addSubview(blurEffectView)
//            blurEffectView.snp.makeConstraints { make in
//                make.edges.equalToSuperview()
//            }
//        }
}
