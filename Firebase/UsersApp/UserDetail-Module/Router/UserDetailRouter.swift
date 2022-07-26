//
//  UserDetailRouter.swift
//  UsersApp
//
//  Created by Yavuz Güner on 25.07.2022.
//

import Foundation

class UserDetailRouter : PresenterToRouterUserDetailProtocol {
    static func createModule(ref: UserDetailVC) {
        ref.userDetailPresenterObject = UserDetailPresenter()
        ref.userDetailPresenterObject?.userDetailInteracor = UserDetailInteractor()
    }
}
