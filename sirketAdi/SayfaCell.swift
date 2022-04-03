//
//  SayfaCell.swift
//  sirketAdi
//
//  Created by Oğuzhan Erdem on 2.04.2022.
//

import Foundation
import UIKit

class SayfaCell : UICollectionViewCell {
    
    var sayfa : Sayfa? {
        didSet{
            guard let sayfa = sayfa else {
                return }
            googleImage.image = UIImage(named: sayfa.goruntuAdi)
            let attrText = NSMutableAttributedString(string: sayfa.baslik, attributes:[ NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            attrText.append(NSAttributedString(string: "\n\n\(sayfa.aciklama)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.darkGray]))
            
            txtSirketAdi.attributedText = attrText
            txtSirketAdi.textAlignment = .center    
            

        }
    }
    
       private let googleImage : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "google.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
       private let txtSirketAdi : UITextView = {
        let txtView = UITextView()
       
        
        txtView.textAlignment = .center
        txtView.translatesAutoresizingMaskIntoConstraints = false
        txtView.isEditable = false
        txtView.isScrollEnabled = false
        return txtView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layoutDuzenle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Hata oluştu...")
    }
    private func layoutDuzenle() {
        
        let ustView = UIView()
        addSubview(ustView)
        ustView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        
        ustView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        ustView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        ustView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        ustView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        ustView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
       
        ustView.addSubview(googleImage)
        googleImage.centerXAnchor.constraint(equalTo: ustView.centerXAnchor).isActive = true
        googleImage.centerYAnchor.constraint(equalTo: ustView.centerYAnchor).isActive = true
        googleImage.heightAnchor.constraint(equalTo: ustView.heightAnchor, multiplier: 0.6).isActive = true
        
        addSubview(txtSirketAdi)
        txtSirketAdi.topAnchor.constraint(equalTo: ustView.bottomAnchor, constant: 10).isActive = true
        txtSirketAdi.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        txtSirketAdi.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        txtSirketAdi.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
