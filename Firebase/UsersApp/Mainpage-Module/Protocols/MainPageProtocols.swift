//
//  MainPageProtocols.swift
//  UsersApp
//
//  Created by Yavuz Güner on 25.07.2022.
//

import Foundation

protocol ViewToPresenterMainPageProtocol {
    var mainPageInteractor : PresenterToInteractorMainPageProtocol? {get set}
    var mainPageView : PresenterToViewMainPageProtocol? {get set}
    
    func loadAllUsers()
    func search(searchWord : String)
    func delete(user_id : String)
}

protocol PresenterToInteractorMainPageProtocol {
    //Tüm kişileri al, kişi araması yap, kişi sil. 3 işlem yapacağız Interactorda.

    var mainPagePresenter:InteractorToPresenterMainPageProtocol? {get set} //Presentera veri gönderme işlemini bununla sağlamış olacağız.
    
    func takeAllUsers()
    func searchUser(searchWord : String)
    func deleteUser(user_id : String)
}

protocol InteractorToPresenterMainPageProtocol {
    func sendDataToPresenter(usersList:Array<Users>)
}

protocol PresenterToViewMainPageProtocol {
    func sendDataToView(usersList:Array<Users>)

}

protocol PresenterToRouterMainPageProtocol {
    static func createModule(ref:MainPageVC)
}
