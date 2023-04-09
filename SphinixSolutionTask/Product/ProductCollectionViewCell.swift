//
//  ProductCollectionViewCell.swift
//  SphinixSolutionTask
//
//  Created by Mac on 06/04/23.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var pricelbl: UILabel!
    @IBOutlet weak var brandlbl: UILabel!
    @IBOutlet weak var ratinglbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
