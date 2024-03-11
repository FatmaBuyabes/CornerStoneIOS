//
//  NetworkManager.swift
//  GymSeeker.1
//
//  Created by Fatma Buyabes on 10/03/2024.
//

import Foundation
import Alamofire
class NetworkManager{
    
    private let baseUrl = "https://coded-bank-api.eapi.joincoded.com/" //change url

    static let shared = NetworkManager()
    
    func signup(user: User, completion: @escaping (Result<TokenResponse, Error>) -> Void) {
        let url = baseUrl + "signup"
        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default).responseDecodable(of: TokenResponse.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let afError):
                completion(.failure(afError as Error))
            }
        }
    }
    
    func signin(user: User, completion: @escaping (Result<TokenResponse, Error>) -> Void) {
        let url = baseUrl + "signin"
        
        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default).responseDecodable(of: TokenResponse.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let afError):
                completion(.failure(afError as Error))
            }
        }
    }
    
    func fetchUserDetails(token: String, completion: @escaping (Result<UserDetails, Error>) -> Void) {
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        
        AF.request(baseUrl + "account", headers: headers).responseDecodable(of: UserDetails.self) { response in
            switch response.result {
            case .success(let userDetails):
                completion(.success(userDetails))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
