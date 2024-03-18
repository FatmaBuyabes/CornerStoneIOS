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
    var token: String?
    var user: User?
    var gym: Gym?
    
    // MARK: - Properties
        var imageView: UIImageView! // Add this line
        var imageView2: UIImageView!
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
        //setUpNavigationBar()
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
        loginButton.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        loginButton.layer.cornerRadius = 25
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowRadius = 4
        
        imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        
//        imageView2 = UIImageView()
//        imageView2.image = UIImage(named: "gym2") // Set your image name here
//        imageView2.contentMode = .fit
//        imageView2.clipsToBounds = true
//        view.addSubview(imageView2)
    }
    func setUpLayout() {
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-50) // Adjust the top spacing as needed
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(imageView.snp.width)
        }

        // Username Label
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(-20) // Reduce the spacing here
            make.leading.equalToSuperview().offset(50)
        }

        // Username Text Field
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(50) // Adjust the leading constraint
            make.trailing.equalToSuperview().offset(-80) // Adjust the trailing constraint
            make.height.equalTo(40)
        }

        // Password Label
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(50)
        }

        // Password Text Field
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(8)
            make.leading.trailing.height.equalTo(usernameTextField)
        }

        // Login Button
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.trailing.equalTo(usernameTextField)
            make.height.equalTo(50)
        }

        // Sign Up Label
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
//        imageView2.snp.makeConstraints { make in
//                    make.bottom.equalToSuperview().offset(40) // Adjust the bottom spacing as needed
//                    make.centerX.equalToSuperview()
//                    make.width.equalToSuperview().multipliedBy(0.8) // Adjust the width as needed
//                    make.height.equalTo(imageView2.snp.width) // Maintain aspect ratio
//                }
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
        
        let user = User(username: username, email: nil,  phoneNumber: nil, gender: nil, password: password, token: nil)
        
        print("Username \(username)")
        print("password \(password)")

        NetworkManager.shared.signin(user: user) { result in
            switch result {
            case .success(let tokenResponse):
                print("Login successful")
                
                //Safeyah
                //                    let gymVC = GymListTableViewController()
                //                    gymVC.token = tokenResponse.token // Pass the token to GymListTableViewController
                //                    gymVC.user = user
                let TabBarVC = TabBarViewController()
                TabBarVC.user = user
                
                //MARK: USER DEFAULT
                let userDefault = UserDefaults.standard
                userDefault.set(tokenResponse.token, forKey: "AuthToken")
                
                ////                    TabBarVC.token = tokenResponse.token // You can also pass the token to other view controllers if needed
                self.navigationController?.pushViewController(TabBarVC, animated: true)

            case .failure(let error):
                
                print("Login failed: \(error.localizedDescription)")
                self.presentAlertWithTitle(title: "Error", message: "Invalid username or password")
            }
        }
    }
    
//    func setUpNavigationBar(){
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        navigationController?.navigationBar.scrollEdgeAppearance = appearance
//    }
    
    
    
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
        navigationItem.rightBarButtonItem?.tintColor = UIColor.darkGray
        
    }
    
    @objc func navIns(){
        let policyVC = PolicyViewController()
        policyVC.modalPresentationStyle = .popover
        self.present(policyVC, animated: true)
        
    }
    

}
