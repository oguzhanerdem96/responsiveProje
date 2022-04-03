//
//  gecisKontroller.swift
//  sirketAdi
//
//  Created by Oğuzhan Erdem on 1.04.2022.
//

import Foundation
import UIKit


    

private let identifier = "myCell"

class GecisController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
      
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in self.collectionViewLayout.invalidateLayout()
        let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }) { (_) in
            
        }
    }
        
                            
   let sayfalar = [
    Sayfa(goruntuAdi: "google", baslik: "Ailemizin Arama Moturu - Google",aciklama: "İnternet araması, çevrim içi bilgi dağıtımı, reklam teknolojileri ve arama motorları için yatırımlar yapan çok uluslu Amerikan anonim şirketidir. İnternet tabanlı hizmet ve ürünler geliştirir." ),
    Sayfa(goruntuAdi: "amazon", baslik: "Dünyanın en büyük ürün Yelpazesi - Amazon",aciklama: "Amazon, Amerika Birleşik Devletleri merkezli bir e-ticaret ve bulut bilişim şirketidir. Jeff Bezos tarafından 5 Temmuz 1994'te Amerika Birleşik Devletleri'nin Seattle şehrinde kurulmuştur. Gerek toplam satış hacmi, gerekse piyasa değeri açısından dünyanın en büyük alışveriş sitesidir."),
   Sayfa(goruntuAdi: "instagram", baslik: "Fotoğraflarınızı Instagram'da paylaşın - Instagram", aciklama: "Instagram, sosyal medyada ücretsiz fotoğraf ve video paylaşma uygulaması. Ekim 2010'da kurulduğunda, kullanıcılarına çektikleri bir fotoğraf üzerinde dijital filtre kullanma ve bu fotoğrafı Instagram'ın da dahil olduğu, sosyal medya servisleri ile paylaşma imkanı tanımıştır."),
   Sayfa(goruntuAdi: "apple", baslik: "Yeniliklerle Dolu Dünya - Apple",aciklama: "Apple, merkezi Cupertino'da bulunan; tüketici elektroniği, bilgisayar yazılımı ve kişisel bilgisayar tasarlayan, geliştiren ve satan Amerikan çok uluslu şirkettir."),
   Sayfa(goruntuAdi: "facebook", baslik: "Sosyal Medya Sitesi - Facebook",aciklama: "Facebook, insanların başka insanlarla iletişim kurmasını ve bilgi alışverişi yapmasını amaçlayan bir sosyal ağ. 4 Şubat 2004 tarihinde Harvard Üniversitesi 2006 devresi öğrencisi Mark Zuckerberg tarafından kurulan Facebook, öncelikle Harvard öğrencileri için kurulmuştu"),
   ]
    private let btnOnceki : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Önceki", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.darkGray, for: .normal)
        button.addTarget(self, action: #selector(btnOncekiClicked), for: .touchUpInside)
        return button
        
    }()
    private let btnSonraki : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sonraki", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.yeniKirmizi, for: .normal)
        button.addTarget(self, action: #selector(btnSonrakiClicked), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func btnOncekiClicked() {
        pageControl.currentPage -= 1
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func btnSonrakiClicked() {
        pageControl.currentPage += 1
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    private lazy var  pageControl : UIPageControl = {
        let pControl = UIPageControl()
        pControl.currentPage = 0
        
        pControl.numberOfPages = sayfalar.count
        pControl.currentPageIndicatorTintColor = UIColor.yeniKirmizi
        pControl.pageIndicatorTintColor = UIColor.acikKirmizi
        
        return pControl
    }()
    
fileprivate func buttonControl() {
 
    
    let butonStackView = UIStackView(arrangedSubviews: [btnOnceki,pageControl,btnSonraki])
    butonStackView.translatesAutoresizingMaskIntoConstraints = false
    butonStackView.distribution = .fillEqually
    view.addSubview(butonStackView)
    NSLayoutConstraint.activate([
        butonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        butonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        butonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        butonStackView.heightAnchor.constraint(equalToConstant: 50),
        ])
}
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int( x / view.frame.width )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonControl()
        collectionView.backgroundColor = .clear
        collectionView.register(SayfaCell.self,
                                forCellWithReuseIdentifier: identifier)
        collectionView.isPagingEnabled = true
    }
    
     
        
       
   
    
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return sayfalar.count
        
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                                      for: indexPath) as! SayfaCell
        cell.sayfa = sayfalar[indexPath.row]
        //cell.googleImage.image = UIImage(named: sayfalar[indexPath.row].goruntuAdi)
        //cell.txtSirketAdi.text = sayfalar[indexPath.row].baslik
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
        
    }
}
