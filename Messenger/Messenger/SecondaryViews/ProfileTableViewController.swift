//
//  ProfileTableViewController.swift
//  Messenger
//
//  Created by Shounak Jindam on 16/10/23.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    
    //MARK: IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    //MARK: Var
    
    var user: User?
    
    
    //MARK: View lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        tableView.tableFooterView = UIView()
        setupUI()
        
    }
    
    
    //MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "tableviewBackgroundColor")
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 1 {
            
            
            let chatId = startChat(user1: User.currentUser!, user2: user!)
            
            let privateChatView = ChatViewController(chatId: chatId, recipientId: user!.id, recipientName: user!.username)
            
            privateChatView.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(privateChatView, animated: true)
            
            
            
        }
    }
    
    //MARK: SetupUI
    
    private func setupUI() {
        
        if user != nil {
            self.title = user!.username
            userNameLabel.text = user!.username
            statusLabel.text = user!.status
            
            if user!.avatarLink != "" {
                FileStorage.downloadImage(imageUrl: user!.avatarLink) { (avatarImage) in
                    
                    self.avatarImageView.image = avatarImage?.circleMasked
                }
            }
        }
    }

}
