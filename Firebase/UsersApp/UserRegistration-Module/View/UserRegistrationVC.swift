//
//  UserRegistrationVC.swift
//  UsersApp
//
//  Created by Yavuz Güner on 24.07.2022.
//

import UIKit

class UserRegistrationVC: UIViewController {

    @IBOutlet weak var textFieldUserPhone: UITextField!
    @IBOutlet weak var textFieldUserName: UITextField!
    
    var userRegistrationPresenterObject : ViewToPresenterUserRegistrationProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserRegistrationRouter.createModule(ref: self)
        
    }
    
    @IBAction func buttonSaveClicked(_ sender: Any) {
        if let uN = textFieldUserName.text, let uP = textFieldUserPhone.text {
            userRegistrationPresenterObject?.Add(user_name: uN, user_phone: uP)
        }
        dismissView()
    }
    
    func dismissView() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    

}
