//
//  SayfaCell.swift
//  sirketAdi
//
//  Created by Oğuzhan Erdem on 2.04.2022.
//

import Foundation
import UIKit

class SayfaCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("Hata oluştu...")
    }
    
}
