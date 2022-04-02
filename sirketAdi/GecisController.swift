//
//  gecisKontroller.swift
//  sirketAdi
//
//  Created by Oğuzhan Erdem on 1.04.2022.
//

import Foundation
import UIKit

private let identifier = "myCell"

class GecisController : UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .orange
        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: identifier)
    }
    
   
    
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 5
        
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                                      for: indexPath)
        cell.backgroundColor =  indexPath.row % 2 == 0 ? .green: .blue
        return cell
    }
}
