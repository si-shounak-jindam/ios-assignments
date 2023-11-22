//
//  GCDTableViewController.swift
//  GCD&OQAssign
//
//  Created by Shounak Jindam on 09/11/23.
//

import UIKit

class GCDTableViewController: UITableViewController {
    
    static let reuseIdentifier = "GCDTableViewCell"

    
    static func nib() -> UINib {
        return UINib(nibName: "GCDTableViewCell", bundle: nil)
    }
    
    //MARK: - Data
    
    var dataArray: [Welcome] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return dataArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GCDTableViewCell", for: indexPath) as! GCDTableViewCell

              let item = dataArray[indexPath.row]

        cell.label1.text = item.matchdetail.weather
        cell.label2.text = item.matchdetail.series.status
        cell.label3.text = item.matchdetail.match.league
        cell.label4.text = item.matchdetail.result
        cell.label5.text = item.matchdetail.playerMatch
              
              

        return cell
    
       
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
    
    func fetch2(){
       
                let operationQueue = OperationQueue()
                
                let operation: BlockOperation = BlockOperation {
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
