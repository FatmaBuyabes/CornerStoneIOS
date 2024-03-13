import UIKit
import SnapKit

class PolicyViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let titleLabel = UILabel()
    let policiesStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        
        setUpScrollView()
        setUpTitleLabel()
        setUpPoliciesStackView()
        setUpPolicies()
        setUpConstraints()
    }
    
    func setUpScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.showsVerticalScrollIndicator = false
    }
    
    func setUpTitleLabel() {
        titleLabel.text = "Privacy & Terms"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        contentView.addSubview(titleLabel)
    }
    
    func setUpPoliciesStackView() {
        policiesStackView.axis = .vertical
        policiesStackView.spacing = 20
        contentView.addSubview(policiesStackView)
    }
    
    func setUpPolicies() {
        let policies = [
            "Privacy Policy: We value your privacy. Our policy outlines how we collect, use, and protect your personal information.",
            "Terms of Service: By using our app, you agree to abide by our terms, including acceptable use, intellectual property rights, and dispute resolution.",
            "Community Guidelines: Our community guidelines ensure a safe and respectful environment for all users. They cover prohibited content, behavior, and reporting procedures.",
            "Account Creation: Users are responsible for maintaining the confidentiality of their account credentials and sharing their login information with others."
        ]
        
        for (index, policy) in policies.enumerated() {
            let policyView = PolicyView(number: index + 1, text: policy)
            policiesStackView.addArrangedSubview(policyView)
        }
    }
    
    func setUpConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.width.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        policiesStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.lessThanOrEqualToSuperview().offset(-20)
        }
    }
}

class PolicyView: UIView {
    
    let numberLabel = UILabel()
    let policyLabel = UILabel()
    
    init(number: Int, text: String) {
        super.init(frame: .zero)
        
        numberLabel.text = "\(number)."
        numberLabel.font = UIFont.boldSystemFont(ofSize: 18)
        addSubview(numberLabel)
        
        policyLabel.text = text
        policyLabel.numberOfLines = 0
        policyLabel.font = UIFont.systemFont(ofSize: 16)
        addSubview(policyLabel)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        numberLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        
        policyLabel.snp.makeConstraints { make in
            make.top.equalTo(numberLabel)
            make.leading.equalTo(numberLabel.snp.trailing).offset(10)
            make.trailing.bottom.lessThanOrEqualToSuperview()
        }
    }
}
