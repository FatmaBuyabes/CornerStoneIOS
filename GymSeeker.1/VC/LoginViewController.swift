//
//  LoginViewController.swift
//  GymSeeker.1
//
//  Created by Fatma Buyabes on 10/03/2024.
//

import UIKit
import Eureka

class LoginViewController: FormViewController {
    var users: [User] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Log In"
            setupForm()
            

        }

        func setupForm(){

            form +++ Section("")
            form +++ Section("")
            form +++ Section("Login")
            <<< TextRow() { row in
                row.title = "Username"
                row.placeholder = "Enter username"
                row.tag = tag.username.rawValue
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange

                row.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.titleLabel?.textColor = .red
                    }

                }
            }


            <<< PasswordRow() { row in
                row.title = "Password"
                row.placeholder = "Enter a password"
                row.tag = tag.password.rawValue
                row.add(rule: RuleRequired())
                //row.validationOptions = .validatesOnChange

                row.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.titleLabel?.textColor = .red
                    }

                }
            }
            

            form +++ Section("")
            form +++ Section("")
            <<< ButtonRow(){ row in
                row.title = "Log In"
                row.onCellSelection{ cell, row in
                    print("Button Cell Tapped")
                    self.SignUpAction()

                }
            }
        }
    
    @objc func SignUpAction(){

            let errors = form.validate()

            guard errors.isEmpty else {
                print(errors)
                print("SOMETHING IS MISSING")

                presentAlertWithTitle(title: "🚨", message: "fill the empty row ")
                return
            }

            let usernameRow: TextRow? = form.rowBy(tag: tag.username.rawValue)
            let passwordRow: PasswordRow? = form.rowBy(tag: tag.password.rawValue)
        
        
            // Converting data to String,Int, and etc
            let password = passwordRow?.value ?? ""
            let username = usernameRow?.value ?? ""


        
            let user = User(username: username, email: nil, phoneNumber: nil, gender: nil, password: password)
        
        NetworkManager.shared.signin(user: user) { result in
            switch result{
            case .success(let tokenResponse):
                let mainVC = MainViewController()
                mainVC.token = tokenResponse.token
                mainVC.user = user
                self.navigationController?.pushViewController(mainVC, animated: true)
                print(tokenResponse.token)
                print("Sign in successful")
            case .failure(let error):
                print("sign in failed")
                print(error.localizedDescription)
            }
        }

        }
        private func presentAlertWithTitle(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    
        

    
    enum tag: String{
        case username
        case password
        case email
        case phone
        case gender
    }

}
