//
//  PolicyViewController.swift
//  GymSeeker.1
//
//  Created by Fatma Buyabes on 11/03/2024.
//

import UIKit
import SnapKit
class PolicyViewController: UIViewController {
    
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let label4 = UILabel()
    let label5 = UILabel()
    let oneimageview = UIImageView(image: UIImage(systemName: "1.square"))
    let twoimageview = UIImageView(image: UIImage(systemName: "2.square"))
    let threeimageview = UIImageView(image: UIImage(systemName: "3.square"))
    let fourimageview = UIImageView(image: UIImage(systemName: "4.square"))
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Instructions"
        view.backgroundColor = .white
        label1.text = "Privacy Policy: We value your privacy. Our policy outlines how we collect, use, and protect your personal information."
        
        label2.text = "Terms of Service: By using our app, you agree to abide by our terms, including acceptable use, intellectual property rights, and dispute resolution."
        
        label3.text = "CCommunity Guidelines: Our community guidelines ensure a safe and respectful environment for all users. They cover prohibited content, behavior, and reporting procedures."
        
        label4.text = "CCommunity Guidelines: Our community guidelines ensure a safe and respectful environment for all users. They cover prohibited content, behavior, and reporting procedures."
        setUpLabels()
        setUpUi()
        setUpAutoLayout()
        
        
        
    }
    
    
    func setUpLabels(){
        view.addSubview(oneimageview)
        view.addSubview(twoimageview)
        view.addSubview(threeimageview)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        
        
    }
    
    func setUpUi(){
        
        label1.textColor = .darkGray
        label1.numberOfLines = 4 // Allow multiple lines
        label1.lineBreakMode = .byWordWrapping
        label1.font = UIFont.boldSystemFont(ofSize: 16)
        
        label2.textColor = .darkGray
        label2.numberOfLines = 4 // Allow multiple lines
        label2.lineBreakMode = .byWordWrapping
        label2.font = UIFont.boldSystemFont(ofSize: 16)
        
        label3.textColor = .darkGray
        label3.numberOfLines = 4 // Allow multiple lines
        label3.lineBreakMode = .byWordWrapping
        label3.font = UIFont.boldSystemFont(ofSize: 16)
        
        label4.textColor = .darkGray
        label4.numberOfLines = 4 // Allow multiple lines
        label4.lineBreakMode = .byWordWrapping
        label4.font = UIFont.boldSystemFont(ofSize: 16)
        
        oneimageview.tintColor = .darkGray
        twoimageview.tintColor = .darkGray
        threeimageview.tintColor = .darkGray
        fourimageview.tintColor = .darkGray
    }
    
    func setUpAutoLayout(){
        
        oneimageview.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.width.height.equalTo(30)
        }
        
        label1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(30)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-20)
            
            
            
        }
        twoimageview.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalTo(label2).offset(-30)
            make.width.height.equalTo(30)
        }
        label2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label1.snp.bottom).offset(100)
            make.left.equalTo(label1.snp.left)
            make.right.equalTo(label1.snp.right)
            
            
        }
        threeimageview.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalTo(label3).offset(-30)
            make.width.height.equalTo(30)
        }
        label3.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label2.snp.bottom).offset(100)
            make.left.equalTo(label1.snp.left)
            make.right.equalTo(label1.snp.right)
            make.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
            
            
        }
        fourimageview.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalTo(label4).offset(-30)
            make.width.height.equalTo(30)
        }
        label4.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label3.snp.bottom).offset(100)
            make.left.equalTo(label1.snp.left)
            make.right.equalTo(label1.snp.right)
            make.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
            
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
