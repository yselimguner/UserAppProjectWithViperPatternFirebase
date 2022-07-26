//
//  UserDetailInteractor.swift
//  UsersApp
//
//  Created by Yavuz Güner on 25.07.2022.
//

import Foundation
import Firebase

class UserDetailInteractor : PresenterToInteractorUserDetailProtocol {
    var refUsers = Database.database().reference().child("users")

    
    
    func userUpdate(user_id: String, user_name: String, user_phone: String) {
        let updatedUser  = ["user_name":user_name, "user_phone":user_phone]
        refUsers.child(user_id).updateChildValues(updatedUser)
    }
  
    
    
}
