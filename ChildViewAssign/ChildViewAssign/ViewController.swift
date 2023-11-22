//
//  ViewController.swift
//  ChildViewAssign
//
//  Created by Shounak Jindam on 06/11/23.
//

import UIKit

class ViewController: UIViewController {

    
    
    private lazy var firstChildVC = FirstChildViewController()
    
    private lazy var ChildCollectionVC = ChildCollectionViewController()
    
    //MARK: - IBOutlets
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        add(ChildCollectionVC.collectionView)
    }
    
    @IBAction func exitButtonPressed(_ sender: UIButton) {
        remove()
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    
    //MARK: - Functions
    
    func add(_ child: UICollectionView, shouldAddView: Bool = true) {
        UIView.animate(withDuration: 0.34, delay: 0.5, options: .transitionCurlUp) {  [self] in
            self.addChild(self.ChildCollectionVC)
            ChildCollectionVC.beginAppearanceTransition(true, animated: true)
                if shouldAddView {
                    view.addSubview(ChildCollectionVC.view)
                }
            ChildCollectionVC.didMove(toParent: self)
            self.ChildCollectionVC.view.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: view.frame.size.height)
        }
        
        }
    
    func remove(shouldRemoveView: Bool = true) {
        UIView.animate(withDuration: 0.34, delay: 0.5, options: .autoreverse) { [self] in
            ChildCollectionVC.beginAppearanceTransition(false, animated: true)
            
            ChildCollectionVC.willMove(toParent: nil)
            if shouldRemoveView {
                ChildCollectionVC.view.removeFromSuperview()
            }
            ChildCollectionVC.removeFromParent()
        }
    }

}

