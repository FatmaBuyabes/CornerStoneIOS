//
//  BookingTableViewCell.swift
//  GymSeeker.1
//
//  Created by Fatma Buyabes on 11/03/2024.
//

import UIKit

class BookingTableViewCell: UITableViewCell {

    let gymNameLabel = UILabel()
    let dateLabel = UILabel()
    let gymImage = UIImageView()
    let price = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code will go here
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Configure UI components here
    }

    private func setupConstraints() {
        // Use Auto Layout or a library like SnapKit to layout the components
    }
    

}
