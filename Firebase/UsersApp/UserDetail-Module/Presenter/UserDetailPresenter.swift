//
//  UserDetailPresenter.swift
//  UsersApp
//
//  Created by Yavuz Güner on 25.07.2022.
//

import Foundation

class UserDetailPresenter:ViewToPresenterUserDetailProtocol {
    var userDetailInteracor: PresenterToInteractorUserDetailProtocol?
    
    func update(user_id: String, user_name: String, user_phone: String) {
        userDetailInteracor?.userUpdate(user_id: user_id, user_name: user_name, user_phone: user_phone)
    }
    
    
}
