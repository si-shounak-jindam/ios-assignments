//
//  ChildCollectionViewCell.swift
//  ChildViewAssign
//
//  Created by Shounak Jindam on 07/11/23.
//

import UIKit

class ChildCollectionViewCell: UICollectionViewCell {

    
    
    var model = [Model]()
    
    //MARK: - IBOutlets
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    
    static let reuseIdentifier = "CollectionViewCell"

    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func configure(with model: Model){
        self.myLabel.text = model.text
        self.myImageView.image = UIImage(named: model.imageName)
    }
}



