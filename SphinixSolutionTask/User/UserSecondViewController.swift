//
//  UserSecondViewController.swift
//  SphinixSolutionTask
//
//  Created by Mac on 06/04/23.
//

import UIKit
import SDWebImage

class UserSecondViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var firstnamelbl: UILabel!
    @IBOutlet weak var agelbl: UILabel!
    @IBOutlet weak var emaillbl: UILabel!
    @IBOutlet weak var phonelbl: UILabel!
    @IBOutlet weak var birthdatelbl: UILabel!
    @IBOutlet weak var genderlbl: UILabel!
    
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstnamelbl.text = user!.firstName + " " + user!.maidenName + " " + user!.lastName
        agelbl.text = "Age : \(user!.age)"
        emaillbl.text = "Email : \(user!.email)"
        phonelbl.text = "Phone : \(user!.phone)"
        birthdatelbl.text = "BirthDate : \(user!.birthDate)"
        genderlbl.text = "Gender : \(user!.gender)"
        let urlstring = (user!.image)
        let url = URL(string: urlstring)
        img.sd_setImage(with: url)
        
    }

    @IBAction func addbtn(_ sender: Any) {
        let alertController = UIAlertController(title: "Add to Cart", message: "Are you sure you want to Cart?", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
              let successAlertController = UIAlertController(title: "", message: "Addedd Successfully", preferredStyle: .alert)
              let dismissAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
              successAlertController.addAction(dismissAction)
              self.present(successAlertController, animated: true, completion: nil)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)

          }
    }

