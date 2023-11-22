//
//  TableViewCell.swift
//  Assignment
//
//  Created by Shounak Jindam on 11/10/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    
    
    
    @IBOutlet weak var labelOutlet: UILabel!
    
    
    
    
    fileprivate func setupInitialUI() {
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
