//
//  UserRegistrationInteractor.swift
//  UsersApp
//
//  Created by Yavuz Güner on 25.07.2022.
//

import Foundation
import Firebase

class UserRegistrationInteractor:PresenterToInteractorUserRegistrationProtocol {
    var refUsers = Database.database().reference().child("users")

    func userAdd(user_name: String, user_phone: String) {
        let newUser  = ["user_id":"", "user_name":user_name, "user_phone":user_phone]
        refUsers.childByAutoId().setValue(newUser)
    }
}
