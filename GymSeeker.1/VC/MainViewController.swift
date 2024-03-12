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
        imageView.image = UIImage(named: "gym") // Replace "gym" with the name of your image asset
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

        let createAccountButton = UIButton()
        createAccountButton.setTitle("Sign Up", for: .normal)
        createAccountButton.setTitleColor(.white, for: .normal)
        createAccountButton.backgroundColor = .gray // Set background color
        createAccountButton.layer.cornerRadius = 9 // Optional: Add corner radius for rounded appearance
        createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        createAccountContainerView.addSubview(createAccountButton)

        let signInButton = UIButton()
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.backgroundColor = .gray // Set background color
        signInButton.layer.cornerRadius = 9 // Optional: Add corner radius for rounded appearance
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        signInContainerView.addSubview(signInButton)

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
            make.height.equalTo(50)
        }

        signInContainerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(createAccountContainerView.snp.bottom).offset(20) // Add spacing between createAccountContainerView and signInContainerView
            make.width.equalToSuperview().offset(-40)
            make.height.equalTo(50)
        }

        createAccountButton.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
        }

        signInButton.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
        }

        bottomImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20) // Adjust the vertical position as needed
            make.width.equalTo(900) // Set the width of the image view
            make.height.equalTo(160) // Set the height of the image view
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
