//
//  NetworkManager.swift
//  GymSeeker.1
//
//  Created by Fatma Buyabes on 10/03/2024.
//

import Foundation
import Alamofire
class NetworkManager{
    
    private let baseUrlAuth = "http://localhost:8080/api/v1/auth/"
    private let baseUrlBook = "http://localhost:8080/api/v1/book/"
    private let baseUrlGym = "http://localhost:8080/api/v1/gym/"
    

    static let shared = NetworkManager()
    
    func signup(user: User, completion: @escaping (Result<TokenResponse, Error>) -> Void) {
        let url = baseUrlAuth + "signup"
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
        let url = baseUrlAuth + "login"
        
        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default).responseDecodable(of: TokenResponse.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
                
            case .failure(let afError):
                completion(.failure(afError as Error))
            }
        }
    }
    
    func fetchGymDetails(gymId: String, token: String, completion: @escaping (Result<Gym, Error>) -> Void) {
            let url = baseUrlBook + "get-gym-details?id=\(gymId)"
            let headers: HTTPHeaders = ["Authorization": token]
            
            AF.request(url, method: .get, headers: headers).validate().responseDecodable(of: Gym.self) { response in
                switch response.result {
                case .success(let gym):
                    completion(.success(gym))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }

    
    // Endpoint localhost:8080/api/v1/gym/get_all_gyms
    
    
    func fetchAllGym(token: String, completion: @escaping (Result<[Gym], Error>) -> Void) {
        let url = baseUrlGym + "get_all_gyms"
            let headers: HTTPHeaders = ["Authorization": token]
            AF.request(url, method: .get, headers: headers).responseDecodable(of: [Gym].self) { response in
                switch response.result {
                case .success(let gym):
                    // EXTRA LINE FOR DEBUGGING
                                     if let data = response.data, let str = String(data: data, encoding: .utf8) {
                                         print("Raw response: \(str)")
                                     }
                    completion(.success(gym))
                    
                case .failure(let error):
            
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
        }
    
    func bookingCreate(token: String,gymId: Int, completion: @escaping (Result<TokenResponse, Error>) -> Void) {
        let url = baseUrlBook + "create/\(gymId)"
        AF.request(url, method: .post, parameters: token, encoder: JSONParameterEncoder.default).responseDecodable(of: TokenResponse.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let afError):
                completion(.failure(afError as Error))
            }
        }
    }
    
    
    
//    func fetchUserDetails(token: String, completion: @escaping (Result<UserDetails, Error>) -> Void) {
//        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
//        
//        AF.request(baseUrl + "account", headers: headers).responseDecodable(of: UserDetails.self) { response in
//            switch response.result {
//            case .success(let userDetails):
//                completion(.success(userDetails))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
}
