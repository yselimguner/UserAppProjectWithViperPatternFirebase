//
//  UserDetailProtocols.swift
//  UsersApp
//
//  Created by Yavuz Güner on 25.07.2022.
//

import Foundation

protocol ViewToPresenterUserDetailProtocol {
    var userDetailInteracor:PresenterToInteractorUserDetailProtocol? {get set}
    
    func update(user_id:String,user_name:String,user_phone:String)
}

protocol PresenterToInteractorUserDetailProtocol {
    func userUpdate(user_id:String,user_name:String,user_phone:String)
}

protocol PresenterToRouterUserDetailProtocol {
    static func createModule(ref:UserDetailVC)
}
