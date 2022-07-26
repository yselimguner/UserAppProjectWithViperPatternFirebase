//
//  UserRegistrationPresenter.swift
//  UsersApp
//
//  Created by Yavuz Güner on 25.07.2022.
//

import Foundation

class UserRegistrationPresenter:ViewToPresenterUserRegistrationProtocol {
    var userRegistrationInteracor: PresenterToInteractorUserRegistrationProtocol?
    
    func Add(user_name: String, user_phone: String) {
        userRegistrationInteracor?.userAdd(user_name: user_name, user_phone: user_phone)
    }
    
    
}
