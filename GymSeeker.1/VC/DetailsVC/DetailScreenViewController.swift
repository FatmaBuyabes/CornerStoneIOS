//
//  DetailsViewController.swift
//  GymSeeker.1
//
//  Created by maha on 11/03/2024.
//
import UIKit
import SnapKit

class DetailScreenViewController: UIViewController {
    
    var gym: Gym?
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gym")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    lazy var secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pl")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 0
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Gym Name: Platinum Fitness"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var hoursLabel: UILabel = {
        let label = UILabel()
        label.text = "Working Hours: 8:00 AM - 8:00 PM"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender: Female"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Location: Sabah Alsalem"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("One Day/Pass 10 KD", for: .normal)
        button.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(imageView)
        view.addSubview(secondImageView)
        view.addSubview(nameLabel)
        view.addSubview(hoursLabel)
        view.addSubview(genderLabel)
        view.addSubview(locationLabel)
        view.addSubview(button)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20) // Leading constraint
            make.trailing.equalToSuperview().offset(-20) // Trailing constraint
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(4)
            make.height.equalTo(140)
        }

        secondImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(-30)
            make.trailing.equalToSuperview().offset(30)
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.height.equalTo(200)
        }

        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(secondImageView.snp.bottom).offset(14)
        }
        
        hoursLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(hoursLabel.snp.bottom).offset(10)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(genderLabel.snp.bottom).offset(10)
        }
        
        button.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-19)
            make.top.equalTo(locationLabel.snp.bottom).offset(35)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }
    
    @objc func buttonTapped() {
        print("Button tapped")
    }
}

#if canImport(SwiftUI) && DEBUG
struct ExampleViewControllerPreview: PreviewProvider {
    static var previews: some View {
        GenericViewControllerRepresentable(DetailScreenViewController())
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