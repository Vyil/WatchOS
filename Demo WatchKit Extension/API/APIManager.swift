//
//  APIManager.swift
//  Demo WatchKit Extension
//
//  Created by Djim Oomes on 27/09/2019.
//  Copyright © 2019 Djim Oomes. All rights reserved.
//

import Foundation
import Combine

class APIManager : ObservableObject {
    
    let objectWillChange = PassthroughSubject<APIManager,Never>()
    
    var users = [User](){
        willSet{
            DispatchQueue.main.async {
                self.objectWillChange.send(self)
            }
        }
    }
    
    var gameDetail: GameDetail = GameDetail() {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send(self)
            }
        }
    }
    
    var events = [SpecialEvent](){
        willSet{
            DispatchQueue.main.async {
                self.objectWillChange.send(self)
            }
        }
    }
    
    init(){
//        APIClient.instance.getUsers { result in
//            switch result {
//            case .success(let users):
//                print("Users:")
//                DispatchQueue.main.async {
//                    self.users = users
//                }
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        }
        
        let timer = Timer(timeInterval: 15, repeats: true) { [weak self] _ in
            self?._getGameData()
        }
        
        RunLoop.main.add(timer, forMode: .common)
        _getGameData()
        
        let timerTwo = Timer(timeInterval: 15, repeats: true) { [weak self] _ in
            self?._getSpecialEvents()
            
        }
        
        RunLoop.main.add(timerTwo, forMode: .common)
        _getSpecialEvents()
        
    }
    
    private func _getGameData() {
        APIClient.instance.getGameData{ result in
            switch result {
            case .success(let gameData):
                DispatchQueue.main.async {
                    self.gameDetail = gameData
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    private func _getSpecialEvents(){
        APIClient.instance.getSpecialEvents { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.events = data
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
//    private func _getGameEvents() {
//        APIClient.instance.getGameEvents{ result in
//            switch result {
//            case .success(let gameData):
//                debugPrint(gameData)
//                DispatchQueue.main.async {
//                    self.gameDetail = gameData
//                }
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        }
//    }
    
}
