//
//  UserDetailVC.swift
//  UsersApp
//
//  Created by Yavuz Güner on 24.07.2022.
//

import UIKit

class UserDetailVC: UIViewController {

    @IBOutlet weak var textFieldUserPhone: UITextField!
    @IBOutlet weak var textFieldUserName: UITextField!
    
    var user:Users?
    
    var userDetailPresenterObject:ViewToPresenterUserDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let u = user {
            textFieldUserName.text = u.user_name
            textFieldUserPhone.text = u.user_phone
        }

        UserDetailRouter.createModule(ref: self)
    }
    
    @IBAction func buttonUpdateClicked(_ sender: Any) {
        if let uN = textFieldUserName.text, let uP = textFieldUserPhone.text, let u = user {
            userDetailPresenterObject?.update(user_id: u.user_id!, user_name: uN, user_phone: uP)
        }
        dismissView()
    }
    
    func dismissView() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    

}
