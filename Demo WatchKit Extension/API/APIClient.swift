//
//  APIClient.swift
//  Demo WatchKit Extension
//
//  Created by Bas van Kuijck on 26/09/2019.
//  Copyright © 2019 Djim Oomes. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIClient {
    static let instance = APIClient()

    private init() {
        
    }

    func getUser(handler: @escaping (Result<User, APIError>) -> Void) {
        AF.request("https://reqres.in/api/users/2")
            .validate()
            .responseData { [unowned self] response in
                let result = self._parse(response: response, to: User.self)
                handler(result)
        }
    }

    func getUsers(handler: @escaping (Result<[User], APIError>) -> Void) {
        AF.request("https://reqres.in/api/users")
            .validate()
            .responseData { [unowned self] response in
                let result = self._parse(response: response, to: [User].self)
                handler(result)
        }
    }
    
    func getGameData(handler: @escaping (Result<GameDetail, APIError>)-> Void){
        AF.request("http://localhost:3000/api/gameDetails")
        .validate()
            .responseData{[unowned self] response in
                let result = self._parse(response: response, to: GameDetail.self)
                handler(result)
        }
    }
    
    func getSpecialEvents(handler: @escaping (Result<[SpecialEvent], APIError>)-> Void){
        AF.request("http://localhost:3000/api/gameDetails")
        .validate()
            .responseData{[unowned self] response in
                let result = self._parseTwo(response: response, to: [SpecialEvent].self)
                handler(result)
        }
    }
    
//    func getGameEvents(handler: @escaping (Result<GameDetail, APIError>)-> Void){
//        let gameDetails = GameDetail()
//
//        let parameters: [String: Any] = [
//            "oldPoints": gameDetails.points,
//            "time": gameDetails.time
//        ]
//        AF.request("http://localhost:3000/api/updateEvent", method: .post, parameters: parameters)
//        .validate()
//            .responseData{[unowned self] response in
//                let result = self._parse(response: response, to: GameDetail.self)
//                handler(result)
//        }
//    }
    
    private func _parse<T: Decodable>(response: AFDataResponse<Data>, to: T.Type) -> Result<T, APIError> {
        if let error = response.error {
            return .failure(.underlying(error))
        }

        if let data = response.data {
            let json = JSON(data)
            do {
                let user = try json["data"].map(to: T.self)
                //let user = try json.map(to: T.self)
                return .success(user)
            } catch let error {
                return .failure(.underlying(error))
            }
        } else {
            return .failure(.unknown)
        }
    }
    
    private func _parseTwo<T: Decodable>(response: AFDataResponse<Data>, to: T.Type) -> Result<T, APIError> {
        if let error = response.error {
            return .failure(.underlying(error))
        }

        if let data = response.data {
            let json = JSON(data)
            debugPrint(json["data"]["event"])
            do {
                let user = try json["data"]["event"].map(to: T.self)
                //let user = try json.map(to: T.self)
                return .success(user)
            } catch let error {
                return .failure(.underlying(error))
            }
        } else {
            return .failure(.unknown)
        }
    }
}
