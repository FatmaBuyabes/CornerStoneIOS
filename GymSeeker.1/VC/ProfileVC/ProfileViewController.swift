import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    var bg = UIImageView()
    let usernameLabel = UILabel()
    let phoneLabel = UILabel()
    let emailLabel = UILabel()
    let genderLabel = UILabel()
    let img = UIImageView()
    let emailSymbol = UIImageView(image: UIImage(systemName: "at"))
    let phoneSymbol = UIImageView(image: UIImage(systemName: "phone"))
    let genderSymbol = UIImageView(image: UIImage(systemName: "person"))

    
    
    let informationContainerView = UIView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never

        setupBackground()
        setupSubviews()
        setupAutoLayout()
        setupUI()
        
        // Add right bar button item
        let editButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(editProfile))
        editButton.tintColor = .white
        navigationItem.rightBarButtonItem = editButton
    }
    
    func setupBackground() {
        bg.image = UIImage(named: "b1")
        view.addSubview(bg)
        bg.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5) // Set background image to cover half of the screen
        }
    }
    
    func setupSubviews() {
        view.addSubview(img)
        view.addSubview(informationContainerView)
        
        informationContainerView.addSubview(usernameLabel)
        informationContainerView.addSubview(emailLabel)
        informationContainerView.addSubview(phoneLabel)
        informationContainerView.addSubview(genderLabel)
        informationContainerView.addSubview(emailSymbol)
        informationContainerView.addSubview(phoneSymbol)
        informationContainerView.addSubview(genderSymbol)
    }
    
    func setupUI() {
        usernameLabel.textColor = .white
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 30)
        usernameLabel.text = "Haya"
        
        emailLabel.font = UIFont.systemFont(ofSize: 25)
        emailLabel.textColor = .darkGray
        emailLabel.text = "Haya@gmail.com"
        
        phoneLabel.font = UIFont.systemFont(ofSize: 25)
        phoneLabel.textColor = .darkGray
        phoneLabel.text = "98765432"
        
        genderLabel.font = UIFont.systemFont(ofSize: 25)
        genderLabel.textColor = .darkGray
        genderLabel.text = "Female"
        
        img.layer.cornerRadius = 75
        img.clipsToBounds = true
        img.image = UIImage(systemName: "person.crop.circle.fill")
        
        informationContainerView.backgroundColor = .white // Semi-transparent white background
        img.tintColor = .white
        // Set symbol colors
        emailSymbol.tintColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        phoneSymbol.tintColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        genderSymbol.tintColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    }
    
    func setupAutoLayout() {
        img.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(img)
            make.top.equalTo(img.snp.bottom).offset(20) // Position the username label under the image profile
        }
        
        informationContainerView.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(20) // Position the container below the username label
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        // Update other constraints accordingly
        
        // Increase symbol size
        let symbolSize: CGFloat = 30
        let labelSpacing: CGFloat = 40 // Increased spacing between labels
        
        emailSymbol.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(usernameLabel.snp.bottom).offset(60) // Adjusted spacing
            make.width.height.equalTo(symbolSize) // Set symbol size
        }
        
        emailLabel.snp.makeConstraints { make in
            make.leading.equalTo(emailSymbol.snp.trailing).offset(10)
            make.top.equalTo(emailSymbol)
        }
        
        phoneSymbol.snp.makeConstraints { make in
            make.leading.equalTo(emailSymbol)
            make.top.equalTo(emailLabel.snp.bottom).offset(labelSpacing) // Adjusted spacing
            make.width.height.equalTo(symbolSize) // Set symbol size
        }
        
        phoneLabel.snp.makeConstraints { make in
            make.leading.equalTo(emailLabel)
            make.top.equalTo(phoneSymbol)
        }
        
        genderSymbol.snp.makeConstraints { make in
            make.leading.equalTo(emailSymbol)
            make.top.equalTo(phoneLabel.snp.bottom).offset(labelSpacing) // Adjusted spacing
            make.width.height.equalTo(symbolSize) // Set symbol size
        }
        
        genderLabel.snp.makeConstraints { make in
            make.leading.equalTo(emailLabel)
            make.top.equalTo(genderSymbol)
        }
    }


    
    @objc func editProfile() {
        // Navigate to the edit profile screen
        let editVc = EditProfileViewController()
        navigationController?.pushViewController(editVc, animated: true)
    }
}
