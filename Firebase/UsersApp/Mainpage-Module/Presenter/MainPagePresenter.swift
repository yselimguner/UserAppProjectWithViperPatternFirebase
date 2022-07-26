//
//  MainPagePresenter.swift
//  UsersApp
//
//  Created by Yavuz Güner on 25.07.2022.
//

import Foundation

class MainPagePresenter:ViewToPresenterMainPageProtocol {
    var mainPageInteractor: PresenterToInteractorMainPageProtocol?
    
    var mainPageView: PresenterToViewMainPageProtocol?
    
    func loadAllUsers() {
        mainPageInteractor?.takeAllUsers()
    }
    
    func search(searchWord: String) {
        mainPageInteractor?.searchUser(searchWord: searchWord)
    }
    
    func delete(user_id: String) {
        mainPageInteractor?.deleteUser(user_id: user_id)
    }
}

extension MainPagePresenter : InteractorToPresenterMainPageProtocol {
    func sendDataToPresenter(usersList: Array<Users>) {
        mainPageView?.sendDataToView(usersList: usersList)
    }
}
