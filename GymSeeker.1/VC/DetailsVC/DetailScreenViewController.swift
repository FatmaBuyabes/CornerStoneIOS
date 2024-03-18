import UIKit
import SnapKit

class DetailScreenViewController: UIViewController {
    
    var gym: Gym?
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Spark")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 0
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Spark"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        return label
    }()
    
    let hoursLabel: UILabel = {
        let label = UILabel()
        label.text = "Working Hours: 8:00 AM - 8:00 PM"
        label.font = UIFont.systemFont(ofSize: 18) // Reduced font size for better readability
        label.textColor = .darkGray
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender: Female"
        label.font = UIFont.systemFont(ofSize: 18) // Reduced font size for better readability
        label.textColor = .darkGray
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Location: Sabah Alsalem"
        label.font = UIFont.systemFont(ofSize: 18) // Reduced font size for better readability
        label.textColor = .darkGray
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("One Day Pass/10KD", for: .normal)
        button.backgroundColor =  #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 4
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // Increased font size for better visibility
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    let gradientLayer: CAGradientLayer = {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
            gradientLayer.locations = [0.5, 1.0]
            return gradientLayer
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
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                make.height.equalTo(200)
                }

        secondImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom)
            make.height.equalTo(120)
        }

        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(secondImageView.snp.bottom).offset(20)
        }
        
        hoursLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(hoursLabel.snp.bottom).offset(10)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(genderLabel.snp.bottom).offset(10)
        }
        
        button.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(locationLabel.snp.bottom).offset(30)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    func addGradientOverlay() {
            imageView.layer.addSublayer(gradientLayer)
            gradientLayer.frame = imageView.bounds
        }

    @objc func buttonTapped() {
        let alert = UIAlertController(title: "Confirmation", message: "Are you sure you want to book this gym?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { _ in
            // Place the logic for handling the button action here
            print("Booking confirmed")
        }))
        present(alert, animated: true, completion: nil)
    }
    
}
