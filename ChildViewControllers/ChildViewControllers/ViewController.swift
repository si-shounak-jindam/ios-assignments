//
//  ViewController.swift
//  ChildViewControllers
//
//  Created by Shounak Jindam on 03/11/23.
//

import UIKit

class ViewController: UIViewController {

    
    let secondChildVC = SecondChildVC()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    func addSecondChildVC(){
        
        addChild(secondChildVC)
        view.addSubview(secondChildVC.view)
        secondChildVC.didMove(toParent: self)
        setSecondChildVCConstraints()

    }
    
    func setSecondChildVCConstraints() {
        
        secondChildVC.view.translatesAutoresizingMaskIntoConstraints = false
        secondChildVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        secondChildVC.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        secondChildVC.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        secondChildVC.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFirstChild" {
            let destVC = segue.destination as! FirstChildVC
            destVC.view.backgroundColor = .blue
        }
            
    }

}

