//
//  DetailsViewController.swift
//  GymSeeker.1
//
//  Created by maha on 11/03/2024.
//

import UIKit
import SnapKit

class DetailScreenViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gym")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pl") //
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Gym Name: platium "
        return label
    }()
    
    lazy var hoursLabel: UILabel = {
        let label = UILabel()
        label.text = "Working Hours: 8:00AM : 8:00PM " //
        return label
    }()
    
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender: Female"
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Location: Sabah Alsalem "
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("One day/Pass 10KD", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(imageView)
        view.addSubview(secondImageView) // Add the second image view
        view.addSubview(nameLabel)
        view.addSubview(hoursLabel)
        view.addSubview(genderLabel)
        view.addSubview(locationLabel)
        view.addSubview(button)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.width.equalTo(289)
            make.height.equalTo(289)
        }
        
        secondImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(-40)
            make.width.equalTo(500)
            make.height.equalTo(200)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(secondImageView.snp.bottom).offset(37)
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
            make.trailing.equalToSuperview().offset(-20) // Align to the right
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.width.equalTo(190)
            make.height.equalTo(40)
        }
    }
    
    @objc func buttonTapped() {
        print("Button tapped")
    }
}


