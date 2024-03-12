//
//  BookingTableViewCell.swift
//  GymSeeker.1
//
//  Created by Fatma Buyabes on 11/03/2024.
//

import UIKit

class BookingTableViewCell: UITableViewCell {

    let gymNameLabel = UILabel()
    let gymImg = UIImageView()
    let price = UILabel()
    let dateLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        gymNameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        gymNameLabel.textColor = .black  // Customize as needed

        dateLabel.font = .systemFont(ofSize: 14, weight: .regular)
        dateLabel.textColor = .darkGray  // Customize as needed
        
        price.font = .systemFont(ofSize: 14, weight: .regular)
        price.textColor = .darkGray  // Customize as needed

        gymImg.contentMode = .scaleAspectFit
        
        contentView.addSubview(gymNameLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(gymImg)
        contentView.addSubview(price)
    }

    private func setupConstraints() {
        gymImg.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(16)  // 16 points from the leading edge of the cell
                make.centerY.equalToSuperview()  // Vertically centered
                make.width.height.equalTo(40)  // 40x40 points
            }

            gymNameLabel.snp.makeConstraints { make in
                make.leading.equalTo(gymImg.snp.trailing).offset(16)  // 16 points from the trailing edge of the image view
                make.top.equalToSuperview().offset(16)  // 16 points from the top edge of the cell
                make.trailing.lessThanOrEqualToSuperview().offset(-16)  // At least 16 points from the trailing edge of the cell
            }

        price.snp.makeConstraints { make in
                make.leading.equalTo(gymNameLabel.snp.leading)  // Aligned with the leading edge of the account number label
                make.top.equalTo(gymNameLabel.snp.bottom).offset(8)  // 8 points below the account number label
                make.trailing.lessThanOrEqualToSuperview().offset(-16)  // At least 16 points from the trailing edge of the cell
                make.bottom.lessThanOrEqualToSuperview().offset(-16)  // At least 16 points from the bottom edge of the cell
            }
        dateLabel.snp.makeConstraints { make in
                make.leading.equalTo(price.snp.leading)
                make.top.equalTo(price.snp.bottom).offset(8)
                make.trailing.lessThanOrEqualToSuperview().offset(-16)
                make.bottom.lessThanOrEqualToSuperview().offset(-16)
            }
        
    }

}
