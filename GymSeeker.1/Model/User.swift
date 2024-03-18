//
//  User.swift
//  GymSeeker.1
//
//  Created by Fatma Buyabes on 10/03/2024.
//

import Foundation
struct User: Codable {
    let username: String
    let email: String?
    let phoneNumber: String?
    let gender: String?
    let password: String
    let token: String?
    //id from back??
}

