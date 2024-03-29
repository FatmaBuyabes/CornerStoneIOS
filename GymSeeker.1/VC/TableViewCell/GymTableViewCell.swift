import UIKit
import SnapKit

class GymTableViewCell: UITableViewCell {

    let gymNameLabel = UILabel()
    let gymLocationLabel = UILabel()
    let gymWorkingHoursLabel = UILabel()
    let genderLabel = UILabel()
    let gymImage = UIImageView()
    let favButton = UIButton(type: .custom)

    var isFavorited: Bool = false {
        didSet {
            let imageName = isFavorited ? "heart.fill" : "heart"
            favButton.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        configureButton()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.backgroundColor = .clear  // Set contentView's background color to clear
        
        gymNameLabel.font = UIFont.boldSystemFont(ofSize: 24) // Increased font size to 24
        gymNameLabel.textColor = .black
        
        gymLocationLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        gymLocationLabel.textColor = .darkGray
        
        gymWorkingHoursLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        gymWorkingHoursLabel.textColor = .darkGray
        
        gymImage.contentMode = .scaleAspectFit
        gymImage.clipsToBounds = true
        gymImage.image = UIImage(named: "spark")
        
        genderLabel.font = UIFont.boldSystemFont(ofSize: 20)
        genderLabel.textColor = .darkGray
        
        favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favButton.tintColor = .red
        favButton.sizeToFit()
        
        contentView.addSubview(gymImage)
        contentView.addSubview(gymNameLabel)
        contentView.addSubview(gymLocationLabel)
        contentView.addSubview(gymWorkingHoursLabel)
        contentView.addSubview(favButton)
        contentView.addSubview(genderLabel)
        gymImage.contentMode = .scaleAspectFit
        gymImage.clipsToBounds = true
        gymImage.image = UIImage(named: "logo") // Set a default image
    }

    func setupConstraints() {
        gymImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalTo(contentView.snp.top).offset(40) // Adjust the top offset as needed
        }
        
        gymNameLabel.snp.makeConstraints { make in
            make.top.equalTo(gymImage.snp.bottom).offset(10) // Adjust the top offset as needed
            make.leading.equalToSuperview().inset(16) // Adjust the leading inset as needed
        }
        
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(gymNameLabel.snp.bottom).offset(5) // Place gender label below gym name label with a vertical offset
            make.leading.equalTo(gymNameLabel) // Align gender label with gym name label horizontally
        }
        
        gymLocationLabel.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp.bottom).offset(5) // Place gym location label below gender label with a vertical offset
            make.leading.trailing.equalTo(gymNameLabel) // Align gym location label with gym name label horizontally
        }
        
        gymWorkingHoursLabel.snp.makeConstraints { make in
            make.top.equalTo(gymLocationLabel.snp.bottom).offset(5)
            make.leading.trailing.equalTo(gymNameLabel)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-10)
        }
        
        favButton.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing).offset(-10) // Place the button in the trailing corner with a 10pt inset
            make.bottom.equalTo(contentView.snp.bottom).offset(-10) // Place the button in the bottom corner with a 10pt inset
            make.width.height.equalTo(32) // Set a fixed width and height for the button
        }
    }





    
    
    func configure(with gym: Gym) {
        gymNameLabel.text = gym.name
        gymLocationLabel.text = gym.location
        gymWorkingHoursLabel.text = gym.workingHours
        genderLabel.text = gym.gender
//        gymImage.image = UIImage(named: gym.image)
        
    }

    func configureButton() {
        favButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
    }
    
    @objc func favoriteButtonTapped() {
        isFavorited.toggle()
        // Here you can perform additional actions when the button is tapped
    }
}
