//
//  UserTableViewCell.swift
//  Messenger
//
//  Created by Shounak Jindam on 15/10/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    
    //MARK: IBOutlets
    
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configure(user: User) {
        
        usernameLabel.text = user.username
        statusLabel.text = user.status
        setAvatar(avatarLink:  user.avatarLink)
    }
    
    private func setAvatar(avatarLink: String) {
        
        if avatarLink != "" {
            FileStorage.downloadImage(imageUrl: avatarLink) { (avatarimage) in
                self.avatarImageView.image = avatarimage?.circleMasked
            }
            
        } else {
            self.avatarImageView.image = UIImage(named: "avatar")?.circleMasked
        }
    }

}
