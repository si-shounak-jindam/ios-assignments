//
//  ViewController.swift
//  GCD&OQAssign
//
//  Created by Shounak Jindam on 09/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    var dataArray: [Welcome] = []
    
    
    
    
    
    //MARK: - IB Action
    
    
    
    @IBAction func GCDButtonPressed(_ sender: UIButton) {
        
        fetchDataGCD()
    }
    
    @IBAction func QAButtonPressed(_ sender: UIButton) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    //MARK: - Functions
    func fetch1() {
        let operationQueue = OperationQueue()
                
                let operation = BlockOperation {
                  let apiUrl3 = URL(string: "https://demo.sportz.io/nzin01312019187360.json")!
                  URLSession.shared.dataTask(with: apiUrl3) { (data, response, error) in
                      
                    guard let data = data, error == nil else {
                      if let error = error {
                        print("Error: \(error.localizedDescription)")
                      }
                      return
                    }
                    do {
                      let decodedData = try JSONDecoder().decode(Welcome.self, from: data)
                      self.dataArray.append(decodedData)
                      OperationQueue.main.addOperation {
                        self.tableView.reloadData()
                      }
                    } catch {
                      print("Error: \(error.localizedDescription)")
                    }
                  }.resume()
                }
                operationQueue.addOperation(operation)
    }
    
}
