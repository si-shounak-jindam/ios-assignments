//
//  ViewController.swift
//  Practice
//
//  Created by Shounak Jindam on 31/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var nametextField: UITextField!
    
    var ch = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewDidAppear(true)
        viewIsAppearing(true)
        
        viewWillAppear(true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        view.backgroundColor = .yellow
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        print("viewIsAppearing")
    }
    
    override func viewLayoutMarginsDidChange() {
        print("viewLayoutMargingDidChange")
    }
    
    override func viewDidLayoutSubviews() {
        
        print("viewDidLayoutSubviews")
        if nametextField.text == "a"{
            view.backgroundColor = .blue
        } else {
            view.backgroundColor = .red
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
    }
    


}

