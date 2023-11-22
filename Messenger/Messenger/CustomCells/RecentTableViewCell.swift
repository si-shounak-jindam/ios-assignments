//
//  RecentTableViewCell.swift
//  Messenger
//
//  Created by Shounak Jindam on 16/10/23.
//

import UIKit

class RecentTableViewCell: UITableViewCell {
    
    
    //MARK: IBOutlets
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var lastmessageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var unreadCountelabel: UILabel!
    @IBOutlet weak var unreadCounterBackgroundView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        unreadCounterBackgroundView.layer.cornerRadius = unreadCounterBackgroundView.frame.width / 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configure(recent: RecentChat) {
        
        usernameLabel.text = recent.receiverName
        usernameLabel.adjustsFontSizeToFitWidth = true
        usernameLabel.minimumScaleFactor = 0.9
        
        lastmessageLabel.text = recent.lastMessage
        lastmessageLabel.adjustsFontSizeToFitWidth = true
        lastmessageLabel.numberOfLines = 2
        lastmessageLabel.minimumScaleFactor = 0.9
        
        
        if recent.unreadCounter != 0 {
            self.unreadCountelabel.text = "\(recent.unreadCounter)"
            self.unreadCounterBackgroundView.isHidden = false
        } else {
            self.unreadCountelabel.isHidden = true
        }
        
        setAvatar(avatarLink: recent.avatarLink)
        dateLabel.text = timeElapsed(recent.date ?? Date())
        dateLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func setAvatar(avatarLink: String) {
        if avatarLink != "" {
            FileStorage.downloadImage(imageUrl: avatarLink) { (avatarImage) in
                self.avatarImageView.image = avatarImage?.circleMasked
            }
            
        } else {
            self.avatarImageView.image = UIImage(named: "avatar")?.circleMasked
        }
    }

}
