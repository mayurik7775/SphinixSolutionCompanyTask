//
//  ProductViewController.swift
//  SphinixSolutionTask
//
//  Created by Mac on 06/04/23.
//

import UIKit
import SDWebImage

class ProductViewController: UIViewController {

    @IBOutlet weak var productCollectionView: UICollectionView!
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXIB()
        fetchingAPI()
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
    }
    func registerXIB() {
        let uiNib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        self.productCollectionView.register(uiNib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
    }
    func fetchingAPI(){
        let urlString = "https://dummyjson.com/products"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request){
            data , response , error in
            print(String(data: data!, encoding: .utf8))
            print(response)
            
            let jsonDecoder = JSONDecoder()
            
            let root : Root = try! jsonDecoder.decode(Root.self, from: data!)
            self.products = root.products
            DispatchQueue.main.async {
                self.productCollectionView.reloadData()
            }
        }.resume()
    }
}
extension ProductViewController : UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ProductCollectionViewCell = self.productCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        cell.titlelbl.text = products[indexPath.row].title
        cell.brandlbl.text = products[indexPath.row].brand
        cell.pricelbl.text = "\(products[indexPath.row].price)"
        cell.ratinglbl.text = "\(products[indexPath.row].rating)"
        let urlstring = products[indexPath.row].thumbnail
        let  url = URL(string: urlstring)
        cell.img.sd_setImage(with: url!)
        cell.layer.borderWidth = 5
        cell.layer.borderColor = .init(genericCMYKCyan: 2, magenta: 2, yellow: 2, black: 5, alpha: 2)
        cell.layer.cornerRadius = 8
        cell.layer.cornerCurve = .circular
     return cell
    }
    func  collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductSecondViewController") as! ProductSecondViewController
        secondVC.product = products[indexPath.row]
        navigationController?.pushViewController(secondVC, animated: true)
    }
        
    }
    

