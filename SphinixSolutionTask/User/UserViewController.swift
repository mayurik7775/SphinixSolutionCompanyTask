//
//  UserViewController.swift
//  SphinixSolutionTask
//
//  Created by Mac on 06/04/23.
//

import UIKit
import SDWebImage

class UserViewController: UIViewController {

    @IBOutlet weak var userTabelView: UITableView!
    var users = [User]()
   // let secondVC : UserSecondViewController = UserSecondViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        userTabelView.delegate = self
        userTabelView.dataSource = self
        registerXIB()
        fetchingAPI()
    }
    func registerXIB(){
        let uiNib = UINib(nibName: "UserTableViewCell", bundle: nil)
        self.userTabelView.register(uiNib, forCellReuseIdentifier: "UserTableViewCell")
    }
    func fetchingAPI(){
        let urlString = "https://dummyjson.com/users"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){ data , response , error in
            print(String(data: data!, encoding: .utf8))
            print(response)
            let jsonDecoder = JSONDecoder()
    let root : Data = try! jsonDecoder.decode(Data.self, from: data!)
            self.users = root.users
            DispatchQueue.main.async {
        self.userTabelView.reloadData()
            }
        }.resume()
    }
}
extension UserViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UserTableViewCell = self.userTabelView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        cell.firstnamelbl.text = "Name : \(users[indexPath.row].firstName)" + " " + users[indexPath.row].lastName
        cell.agelbl.text = "Age : \(users[indexPath.row].age)"
        cell.layer.borderWidth = 5
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = .init(genericCMYKCyan: 2, magenta: 2, yellow: 2, black: 5, alpha: 2)
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "UserSecondViewController") as! UserSecondViewController
        secondVC.user = users[indexPath.row]
        navigationController?.pushViewController(secondVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
