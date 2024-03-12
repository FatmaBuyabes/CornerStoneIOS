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
//        setupViews()
//        setupConstraints()
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
        
        
        gymNameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        gymNameLabel.textColor = .black
        
        gymLocationLabel.font = .systemFont(ofSize: 14, weight: .regular)
        gymLocationLabel.textColor = .darkGray
        
        gymWorkingHoursLabel.font = .systemFont(ofSize: 14, weight: .regular)
        gymWorkingHoursLabel.textColor = .darkGray
        
        gymImage.contentMode = .scaleAspectFit
        
        favImage.contentMode = .scaleAspectFit
    }
    
    private func setupConstraints() {
        
        gymImage.snp.makeConstraints { make in
                    make.leading.equalToSuperview().offset(16)
                    make.centerY.equalToSuperview()
                    make.width.height.equalTo(100)
                }
        gymNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)  // 16 points from the leading edge of the cell
            make.centerY.equalToSuperview()  // Vertically centered
            make.width.height.equalTo(40)  // 40x40 points
        }
        
        gymLocationLabel.snp.makeConstraints { make in
            make.leading.equalTo(gymImage.snp.trailing).offset(16)  // 16 points from the trailing edge of the image view
            make.top.equalToSuperview().offset(16)  // 16 points from the top edge of the cell
            make.trailing.lessThanOrEqualToSuperview().offset(-16)  // At least 16 points from the trailing edge of the cell
        }
        
        gymWorkingHoursLabel.snp.makeConstraints { make in
            make.leading.equalTo(gymLocationLabel.snp.leading)  // Aligned with the leading edge of the account number label
            make.top.equalTo(gymNameLabel.snp.bottom).offset(8)  // 8 points below the account number label
            make.trailing.lessThanOrEqualToSuperview().offset(-16)  // At least 16 points from the trailing edge of the cell
            make.bottom.lessThanOrEqualToSuperview().offset(-16)  // At least 16 points from the bottom edge of the cell
        }
        favImage.snp.makeConstraints { make in
            make.leading.equalTo(gymImage.snp.trailing).offset(16)
        }
    }
    
    
    
    
    
    
    
}
