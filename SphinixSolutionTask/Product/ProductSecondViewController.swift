//
//  ProductSecondViewController.swift
//  SphinixSolutionTask
//
//  Created by Mac on 06/04/23.
//

import UIKit
import SDWebImage

class ProductSecondViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var idlabel: UILabel!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var pricelabel: UILabel!
    @IBOutlet weak var brandlabel: UILabel!
    @IBOutlet weak var categorylabel: UILabel!
    
    var product : Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idlabel.text = "Id : \(product!.id)"
        titlelabel.text = "Title : \(product!.title)"
        pricelabel.text = "Price : \(product!.price)"
        brandlabel.text = "Brand : \(product!.brand)"
        categorylabel.text = "Category : \(product!.category)"
        let urlstring = (product!.thumbnail)
        let url = URL(string: urlstring)
        image.sd_setImage(with: url)
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

