//
//  ViewController.swift
//  UsersApp
//
//  Created by Yavuz Güner on 24.07.2022.
//

import UIKit
import Firebase

class MainPageVC: UIViewController {
    
    //var ref:DatabaseReference?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var userList = [Users]()
    
    var mainPagePresenterObject : ViewToPresenterMainPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        MainPageRouter.createModule(ref: self)
        
        //ref = Database.database().reference()
        //veriEkle()
        
    }
    
    /*
    func veriEkle(){
        let yeniKisi = Users(user_id: "", user_name: "Osman", user_phone: "123425")
        let dic : [String:Any] = ["user_name":yeniKisi.user_name!, "user_phone":yeniKisi.user_phone!, "user_id":yeniKisi.user_id!]
        let newRef = ref?.child("users").childByAutoId()
        newRef?.setValue(dic)
    }
     */

    override func viewWillAppear(_ animated: Bool) {
        mainPagePresenterObject?.loadAllUsers()
    }

}

extension MainPageVC : PresenterToViewMainPageProtocol {
    func sendDataToView(usersList: Array<Users>) {
        self.userList = usersList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension MainPageVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            //Bunu yazmamdaki amacım şu. arama yaptıktan sonra listenin tekrar geri gelmesi için.
            mainPagePresenterObject?.loadAllUsers()
        }else {
            mainPagePresenterObject?.search(searchWord: searchText)
        }
    }
}

extension MainPageVC : UITableViewDelegate,UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = userList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! TableViewCell
        cell.userInfoLabel.text = "\(user.user_name!) - \(user.user_phone!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = userList[indexPath.row]
        performSegue(withIdentifier: "toUserDetailVC", sender: user)
        tableView.deselectRow(at: indexPath, animated: true) //Geri döndüğümüzde üzerinde seçili kalan koyu rengi atarız.
    }
    //Sayfalar arası geçişte verileri dinlemek için kullanıyoruz.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUserDetailVC" {
            let user = sender as? Users
            let toVC = segue.destination as! UserDetailVC
            toVC.user = user
        }
    }
    
    //Swipe işlemi
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let user = userList[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (contextualAction,view,bool) in
            let alert = UIAlertController(title: "Delete Action", message: "Do you want to delete \(user.user_name!) ?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ action in
                
            }
            let yesAction = UIAlertAction(title: "Yes", style: .destructive) {action in
                self.mainPagePresenterObject?.delete(user_id: user.user_id!)
            }
            alert.addAction(cancelAction)
            alert.addAction(yesAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])

    }
    
}
