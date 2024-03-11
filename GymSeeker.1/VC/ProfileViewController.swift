//
//  pViewController.swift
//  GymSeeker.1
//
//  Created by maha on 11/03/2024.
//


import UIKit
import SnapKit
import Kingfisher

class ProfileViewController: UIViewController {
    
    var user: User?
    var token: String?
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 90
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Profile"
        view.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        
        // Add UI elements to the view
        view.addSubview(profileImageView)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        view.addSubview(genderLabel)
        view.addSubview(phoneLabel)
        
        // Setup UI and layout
        setupViews()
        setupLayout()
    }
    
    private func setupViews() {
        // Configure profile image view
        profileImageView.image = UIImage(named: "profile")
        
        // Set text for labels
        usernameLabel.text = user?.username ?? "Maha "
        emailLabel.text = user?.email ?? "mahaa@gmail.com"
        
    }
    
    private func setupLayout() {
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.width.height.equalTo(180)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileImageView.snp.bottom).offset(30)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(usernameLabel.snp.bottom).offset(15)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailLabel.snp.bottom).offset(15)
        }
        
        phoneLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(genderLabel.snp.bottom).offset(15)
        }
    }
    
    func showuserDetails(for user: User) {
        self.user = user
        // Update UI elements with user details
        setupViews()
    }
}

#if canImport(SwiftUI) && DEBUG
struct ExampleViewControllerPreview: PreviewProvider {
    static var previews: some View {
        GenericViewControllerRepresentable(ProfileViewController())
    }
}
#endif

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct GenericViewControllerRepresentable<ViewController: UIViewController>: UIViewControllerRepresentable {
    
    let viewController: ViewController
    
    init(_ builder: @autoclosure @escaping () -> ViewController) {
        self.viewController = builder()
    }
    
    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}
#endif
