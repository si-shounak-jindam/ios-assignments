//
//  GCDTableViewCell.swift
//  GCD&OQAssign
//
//  Created by Shounak Jindam on 09/11/23.
//

import UIKit

class GCDTableViewCell: UITableViewCell {
    
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

    
}
