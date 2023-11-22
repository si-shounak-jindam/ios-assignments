//
//  EditProfileTableViewController.swift
//  Messenger
//
//  Created by Shounak Jindam on 12/10/23.
//

import UIKit
 import YPImagePicker
import ProgressHUD

class EditProfileTableViewController: UITableViewController {
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    

    
    //MARK: - Vars
    var picker: YPImagePicker?
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        configureTextField()
        //avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        
        setupPicker()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showUserInfo()
    }
    
    //MARK: - TableView Delegates
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "tableViewBackgroundColor")
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0.0 : 30.0
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        if indexPath.section == 1 && indexPath.row == 0 {
            performSegue(withIdentifier: "editProfileToStatusSeg", sender: self)
        }
        
    }
    
    //MARK: IBActions
    @IBAction func editButtonPressed(_ sender: Any) {
        showPicker()
    }
    
    
    //MARK: - Setup image picker
    func setupPicker() {
            var config = YPImagePickerConfiguration()
            config.showsPhotoFilters = false
            config.screens = [.library]
            
            config.library.maxNumberOfItems = 1
     
            picker = YPImagePicker(configuration: config)
        }
    
    func showPicker() {
            
            guard let picker = picker else { return }
            
            picker.didFinishPicking { [unowned picker] items, cancelled in
                if cancelled {
                    print("Picker was canceled")
                }
     
                for item in items {
                    switch item {
                    case .photo(let photo):
                        //this is just an example to show in imageView
                        DispatchQueue.main.async {
                            self.avatarImageView.image = photo.image
                        }
                    case .video(let video):
                        //if you need to access videos as well
                        print(video)
                    }
                }
                picker.dismiss(animated: true, completion: nil)
            }
            
            present(picker, animated: true, completion: nil)
        }
    //MARK: - UpdateUI
    private func showUserInfo(){
        if let user = User.currentUser {
            usernameTextField.text = user.username
            statusLabel.text = user.status
            
            
                //set avatar
                if user.avatarLink != "" {
                    FileStorage.downloadImage(imageUrl: user.avatarLink) { (avatarImage) in
                        self.avatarImageView.image = avatarImage?.circleMasked
                    }
                }
            }
        }
    
    //MARK: - Configure
    private func configureTextField() {
        usernameTextField.delegate = self
        usernameTextField.clearButtonMode = .whileEditing
    }
    
    //MARK: Upload Avatar Image
    
    private func uploadAvatarImage(_ image : UIImage) {
        let fileDirectory = "Avatars/" + "_\(User.currentId)" + ".jpg"
        
        FileStorage.uploadImage(image, directory: fileDirectory) { (avatarLink) in
            if var user  = User.currentUser {
                user.avatarLink = avatarLink ?? ""
                saveUserLocally(user)
                FirebaseUserListener.shared.saveUserToFireStore(user)
            }
            
            //TODO: Save image locally
           FileStorage.saveFileLocally(fileData: image.jpegData(compressionQuality: 1.0)! as NSData, fileName: User.currentId)
        }
    }
}

extension EditProfileTableViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            
            if textField.text != "" {
                if var user = User.currentUser {
                    user.username = textField.text!
                    saveUserLocally(user)
                    FirebaseUserListener.shared.saveUserToFireStore(user)
                }
            }
            textField.resignFirstResponder() //disappears the keyboard
            return false
        }
        return true
    }
}
