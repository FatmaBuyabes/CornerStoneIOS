//
//  GymTableViewCell.swift
//  GymSeeker.1
//
//  Created by Fatma Buyabes on 11/03/2024.
//

import UIKit

class GymTableViewCell: UITableViewCell {

    let gymNameLabel = UILabel()
    let gymLocationLabel = UILabel()
    let gymWorkingHoursLabel = UILabel()
    let gymImage = UIImageView()
    let favImage = UIImageView(image: UIImage(named: "heart"))
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code will go here
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(gymNameLabel)
        contentView.addSubview(gymLocationLabel)
        contentView.addSubview(gymWorkingHoursLabel)
        contentView.addSubview(gymImage)
        contentView.addSubview(favImage)
        
        
//        gymName.font = .systemFont(ofSize: 16, weight: .medium)
//        gymName.textColor = .black  // Customize as needed
//
//        locationLabel.font = .systemFont(ofSize: 14, weight: .regular)
//        locationLabel.textColor = .darkGray  // Customize as needed
//        gymImageView.contentMode = .scaleAspectFit

        
    }

    private func setupConstraints() {
        // Use Auto Layout or a library like SnapKit to layout the components
    }
    




}
