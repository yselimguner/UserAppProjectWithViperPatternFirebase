//
//  MainPageInteractor.swift
//  UsersApp
//
//  Created by Yavuz Güner on 25.07.2022.
//

import Foundation
import Firebase

class MainPageInteractor:PresenterToInteractorMainPageProtocol{
    var mainPagePresenter: InteractorToPresenterMainPageProtocol?
    
    var refUsers = Database.database().reference().child("users")
    
    func takeAllUsers() {
        refUsers.observe(.value, with: {snapshot in
            var userList = [Users]()
            
            if let comingData = snapshot.value as? [String:AnyObject] {
                for piece in comingData {
                    if let d = piece.value as? NSDictionary {
                        let user_id = piece.key
                        let user_name = d["user_name"] as? String ?? ""
                        let user_phone = d["user_phone"] as? String ?? ""
                        
                        let user = Users(user_id: user_id, user_name: user_name, user_phone: user_phone)
                        userList.append(user)
                    }
                }
            }
            self.mainPagePresenter?.sendDataToPresenter(usersList: userList)
        })
    }
    
    func searchUser(searchWord: String) {
        refUsers.observe(.value, with: {snapshot in
            var userList = [Users]()
            
            if let comingData = snapshot.value as? [String:AnyObject] {
                for piece in comingData {
                    if let d = piece.value as? NSDictionary {
                        let user_id = piece.key
                        let user_name = d["user_name"] as? String ?? ""
                        let user_phone = d["user_phone"] as? String ?? ""
                        
                        if user_name.lowercased().contains((searchWord).lowercased()) {
                            let user = Users(user_id: user_id, user_name: user_name, user_phone: user_phone)
                            userList.append(user)
                        }
                    }
                }
            }
            self.mainPagePresenter?.sendDataToPresenter(usersList: userList)
        })
    }
    
    func deleteUser(user_id: String) {
        refUsers.child(user_id).removeValue()
    }
    
    
    
    
}
