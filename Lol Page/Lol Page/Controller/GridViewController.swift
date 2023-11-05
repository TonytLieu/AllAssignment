//
//  GridViewController.swift
//  Lol Page
//
//  Created by Tony Lieu on 11/1/23.
//

import UIKit

class GridViewController: UIViewController{
    var img = UIImage(named: "why")
    var arrayDays = ["Sun","Monday","Tuesday","Wendenday","Thurs","Friday","Sat"]
    var numberMonths = ["Jan","Feb","March","April","May", "June","July","Aug","Oct", "Nov", "Dec"]
   // @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
extension GridViewController:UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayDays.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCellID", for: indexPath) as! GridViewCell
        var data = ""
        
        data = arrayDays[indexPath.row]
        cell.gridLabel.text = data
        cell.gridImageView.image = img
        
        
        return cell
    }
}
extension GridViewController:UICollectionViewDelegate{
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        print(arrayDays[indexPath.row])
    }
}
