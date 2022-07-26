//
//  UserRegistrationProtocols.swift
//  UsersApp
//
//  Created by Yavuz Güner on 25.07.2022.
//

import Foundation

protocol ViewToPresenterUserRegistrationProtocol {
    var userRegistrationInteracor:PresenterToInteractorUserRegistrationProtocol? {get set}
    
    func Add(user_name:String,user_phone:String)
}

protocol PresenterToInteractorUserRegistrationProtocol {
    func userAdd(user_name:String,user_phone:String)
}

protocol PresenterToRouterUserRegistrationProtocol {
    static func createModule(ref:UserRegistrationVC)
}
