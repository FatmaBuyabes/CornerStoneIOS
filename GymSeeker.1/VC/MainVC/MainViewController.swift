//
//  mViewController.swift
//  GymSeeker.1
//
//  Created by maha on 12/03/2024.
//

import UIKit
import SnapKit
import Eureka

class MainViewController: UIViewController {
    var user: User?
    var token: String?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        // label.text = " WELCOME TO GYM SEEKER 💪🏼 "
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()

    private let bankLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "app_logo") // Replace "gym" with the name of your image asset
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let createAccountContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()

    private let signInContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()

    private let bottomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gym2") // Replace "your_image_name_here" with the name of your image asset
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        view.addSubview(titleLabel)
        view.addSubview(bankLogoImageView)
        view.addSubview(createAccountContainerView)
        view.addSubview(signInContainerView)
        view.addSubview(bottomImageView) // Add bottomImageView

        let buttonHeight: CGFloat = 60 // Define button height
        let cornerRadius: CGFloat = 20 // Define corner radius

        let createAccountButton = UIButton()
        createAccountButton.setTitle("Sign Up", for: .normal)
        createAccountButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        createAccountButton.layer.cornerRadius = 25
        //createAccountButton.layer.borderWidth = 2
        //createAccountButton.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        createAccountButton.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        createAccountButton.tintColor = .white
        createAccountButton.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        createAccountButton.layer.shadowColor = UIColor.black.cgColor
        createAccountButton.layer.shadowOpacity = 0.5
        createAccountButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        createAccountButton.layer.shadowRadius = 3
        createAccountButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        createAccountButton.setTitleColor(.white, for: .normal)
        createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        createAccountContainerView.addSubview(createAccountButton)

let signInButton = UIButton()
     signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
       signInContainerView.addSubview(signInButton)
        signInButton.setTitle("Login", for: .normal)
        signInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        signInButton.layer.cornerRadius = 25
        //signInButton.layer.borderWidth = 2
        //signInButton.layer.borderColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        signInButton.tintColor = .white
        signInButton.layer.shadowColor = UIColor.black.cgColor
        signInButton.layer.shadowOpacity = 0.5
        signInButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        signInButton.layer.shadowRadius = 3
        signInButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        signInButton.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        signInButton.setImage(UIImage(systemName: "lock.open.fill"), for: .normal)
        signInButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.6) // Adjust vertical position
            make.leading.trailing.equalToSuperview()
        }

        bankLogoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(-250)
            make.width.equalTo(500)
            make.height.equalTo(500)
        }

        createAccountContainerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview() // Center vertically
            make.width.equalToSuperview().offset(-40)
            make.height.equalTo(buttonHeight) // Set button height
        }

        signInContainerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(createAccountContainerView.snp.bottom).offset(20) // Add spacing between createAccountContainerView and signInContainerView
            make.width.equalToSuperview().offset(-40)
            make.height.equalTo(buttonHeight) // Set button height
        }

        createAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
                        make.centerY.equalToSuperview()
                        make.width.equalTo(230)
                        make.height.equalTo(50)       
        }

        signInButton.snp.makeConstraints { make in

            make.centerX.equalToSuperview()
                        make.centerY.equalToSuperview()
                        make.width.equalTo(230)
                        make.height.equalTo(50)
        }

        bottomImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
            make.width.equalTo(900)
            make.height.equalTo(160)
        }
    }

    @objc private func createAccountButtonTapped() {
        let accountCreationVC = SignUpUIViewController()
        navigationController?.pushViewController(accountCreationVC, animated: true)
    }

    @objc private func signInButtonTapped() {
        let signInVC = LoginUiViewController()
        navigationController?.pushViewController(signInVC, animated: true)
    }
}
