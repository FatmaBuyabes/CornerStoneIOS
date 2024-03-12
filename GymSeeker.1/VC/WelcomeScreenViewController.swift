//
//  WelcomeScreenViewController.swift
//  GymSeeker.1
//
//  Created by Fatma Buyabes on 10/03/2024.
//

import UIKit
import SnapKit

class WelcomeScreenViewController: UIViewController {
    let loginButton = UIButton()
    let signupButton = UIButton()
    let image = UIImageView()
    let welcomeLabel = UILabel()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        
        image.image = UIImage(named: "gym")
        view.addSubview(loginButton)
        view.addSubview(signupButton)
        view.addSubview(image)
        view.addSubview(welcomeLabel)
        setUpUI()
        setUpLayout()
        //setupNavigationBar()
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
    

    }
    
    func setUpUI(){
        
        image.contentMode = .scaleAspectFit
        
        loginButton.setTitle("Login", for: .normal)
            loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            loginButton.layer.cornerRadius = 25
            loginButton.layer.borderWidth = 2
            loginButton.layer.borderColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            loginButton.tintColor = .white
            loginButton.backgroundColor = UIColor.orange
            loginButton.setImage(UIImage(systemName: "lock.open.fill"), for: .normal)
            loginButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)

            // Set up signup button
            signupButton.setTitle("Sign Up", for: .normal)
            signupButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            signupButton.layer.cornerRadius = 25
            signupButton.layer.borderWidth = 2
            signupButton.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            signupButton.tintColor = .darkGray
            signupButton.backgroundColor = .white
            signupButton.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
            signupButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
            signupButton.setTitleColor(.darkGray, for: .normal)

           
            loginButton.layer.shadowColor = UIColor.black.cgColor
            loginButton.layer.shadowOpacity = 0.5
            loginButton.layer.shadowOffset = CGSize(width: 0, height: 3)
            loginButton.layer.shadowRadius = 3

            signupButton.layer.shadowColor = UIColor.black.cgColor
            signupButton.layer.shadowOpacity = 0.5
            signupButton.layer.shadowOffset = CGSize(width: 0, height: 3)
            signupButton.layer.shadowRadius = 3
        
            welcomeLabel.text = "Welcome !!"
            welcomeLabel.font = UIFont.boldSystemFont(ofSize: 21)
            welcomeLabel.textColor = .black
    
    }
    
    
    func setUpLayout(){
        
        image.snp.makeConstraints { make in
            make.width.equalTo(400)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-250)


        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-90)
                
            }
        
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview() // Center horizontally
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        signupButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(loginButton.snp.bottom).offset(40)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
    }
    
    
    
    func setUpNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    

    //MARK: Nav to Sign in
    @objc func loginTapped(){
        let loginVC = LoginUiViewController() /// will change it later
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }
    
    //MARK: Nav to Sign Up
    @objc func signupTapped(){
        let signupVC = SignUpUIViewController() /// will change it later
        self.navigationController?.pushViewController(signupVC, animated: true)
        
    }

}

