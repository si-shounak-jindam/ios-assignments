import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

   
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self

        
        collectionView.register(UINib(nibName: "NumberCell", bundle: nil), forCellWithReuseIdentifier: "NumberCell")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumberCell", for: indexPath) as! NumberCell

        let number = indexPath.item + 1

        
        cell.numberLabel.text = "\(number)"

        
        if number % 2 == 1 {
            cell.backgroundColor = UIColor.blue
        } else {
            cell.backgroundColor = UIColor.white
        }

        return cell
    }
}
