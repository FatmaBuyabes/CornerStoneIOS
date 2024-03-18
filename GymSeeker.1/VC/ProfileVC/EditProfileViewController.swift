import UIKit
import Eureka

class EditProfileViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section(header: "Edit Profile", footer: "") // Add a title to the form
            <<< TextRow() {
                $0.title = "Username"
                $0.placeholder = "Enter username"
                $0.add(rule: RuleRequired()) // Add a rule to check if the field is empty
                $0.validationOptions = .validatesOnChangeAfterBlurred // Validate when changed and blurred
                $0.add(rule: RuleRequired())
                $0.validationOptions = .validatesOnChange
                
                $0.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.titleLabel?.textColor = .red
                    }
                    
                }
            }
            <<< EmailRow() {
                $0.title = "Email"
                $0.placeholder = "Enter email"
                $0.add(rule: RuleRequired()) // Add a rule to check if the field is empty
                $0.validationOptions = .validatesOnChangeAfterBlurred // Validate when changed and blurred
                $0.add(rule: RuleRequired())
                $0.validationOptions = .validatesOnChange
                $0.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.titleLabel?.textColor = .red
                    }
                    
                }
            }
            <<< PasswordRow() {
                $0.title = "Password"
                $0.placeholder = "Enter password"
                $0.add(rule: RuleRequired()) // Add a rule to check if the field is empty
                $0.validationOptions = .validatesOnChangeAfterBlurred // Validate when changed and blurred
                $0.add(rule: RuleRequired())
                $0.validationOptions = .validatesOnChange
                $0.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.titleLabel?.textColor = .red
                    }
                    
                }
            }
            <<< ActionSheetRow<String>() {
                $0.title = "Gender"
                $0.selectorTitle = "Select your gender"
                $0.options = ["Female", "Male"]
                $0.value = " " // Default value
                $0.add(rule: RuleRequired()) // Add a rule to check if the field is empty
                $0.validationOptions = .validatesOnChangeAfterBlurred // Validate when changed and blurred
            }
            <<< PhoneRow("phoneNumber") {
                $0.title = "Phone Number"
                $0.placeholder = "Enter phone number"
                $0.add(rule: RuleExactLength(exactLength: 8)) // Limit to 8 characters
                $0.validationOptions = .validatesOnChangeAfterBlurred // Validate when changed and blurred
                $0.add(rule: RuleRequired())
                $0.validationOptions = .validatesOnChange
                $0.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.titleLabel?.textColor = .red
                    }
                    
                }
            }
            
            +++ Section()
            <<< ButtonRow() {
                $0.title = "Edit profile"
            }.onCellSelection { _, _ in
                self.signUpButtonTapped()
            }
    }
    

    
    private func presentAlertWithTitle(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    @objc func signUpButtonTapped() {
       
    }
    
    }



