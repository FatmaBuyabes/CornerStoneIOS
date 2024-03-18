import UIKit
import SnapKit

class BookingTableViewCell: UITableViewCell {
    
    let gymNameLabel = UILabel()
    let dateLabel = UILabel()
    let gymImage = UIImageView()
    let priceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        contentView.addSubview(gymImage)
        contentView.addSubview(gymNameLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(priceLabel)
        
        gymNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        gymNameLabel.textColor = .black
        
        dateLabel.font = UIFont.systemFont(ofSize: 16)
        dateLabel.textColor = .darkGray
        
        priceLabel.font = UIFont.systemFont(ofSize: 16)
        priceLabel.textColor = .darkGray
        
        gymImage.contentMode = .scaleAspectFill
        gymImage.image = UIImage(named: "Spark")
        gymImage.layer.cornerRadius = 20
        gymImage.clipsToBounds = true
        gymImage.layer.borderWidth = 1
        gymImage.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    func setupConstraints() {
        gymImage.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(80)
        }
        
        gymNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(gymImage.snp.trailing).offset(10)
            make.top.equalTo(contentView.snp.top).offset(10)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(gymNameLabel)
            make.top.equalTo(gymNameLabel.snp.bottom).offset(5)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(gymNameLabel)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
    }
    
    func configure(with booking: BookingDetails) {
        gymNameLabel.text = booking.name
        dateLabel.text = "Date: \(booking.date)"
        priceLabel.text = "Location: \(booking.location)"
        // Set placeholder image or load gym image from URL
        
    }
    
}
