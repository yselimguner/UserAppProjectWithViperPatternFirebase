//
//  UserRegistrationRouter.swift
//  UsersApp
//
//  Created by Yavuz Güner on 25.07.2022.
//

import Foundation

class UserRegistrationRouter : PresenterToRouterUserRegistrationProtocol {
    static func createModule(ref: UserRegistrationVC) {
        ref.userRegistrationPresenterObject = UserRegistrationPresenter()
        ref.userRegistrationPresenterObject?.userRegistrationInteracor = UserRegistrationInteractor()
    }
}
