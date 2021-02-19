//
//  IconCollectionViewController.swift
//  CollectionViewStoryBoard
//
//  Created by Yurii on 2021/2/19.
//

import UIKit

private let reuseIdentifier = "Cell"
private let bottomReuseIdentifier = "HorizCell"

class IconCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
        
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var bottomCollectionView: UICollectionView!
    
    private var iconSet: [Icon] = [
                                    Icon(name: "candle", price: 3.99, isFeatured: false),
                                    Icon(name: "cat", price: 2.99, isFeatured: true),
                                    Icon(name: "dribbble", price: 1.99, isFeatured: false),
                                    Icon(name: "ghost", price: 4.55, isFeatured: false),
                                    Icon(name: "hat", price: 3.99, isFeatured: false),
                                    Icon(name: "owl", price: 2.99, isFeatured: true),
                                    Icon(name: "pot", price: 1.99, isFeatured: false),
                                    Icon(name: "pumkin", price: 4.55, isFeatured: false),
                                    Icon(name: "rip", price: 3.99, isFeatured: false),
                                    Icon(name: "skull", price: 2.99, isFeatured: true),
                                    Icon(name: "sky", price: 1.99, isFeatured: false),
                                    Icon(name: "toxic", price: 4.55, isFeatured: false),
                                    Icon(name: "ic_book", price: 3.99, isFeatured: false),
                                    Icon(name: "ic_backpack", price: 2.99, isFeatured: true),
                                    Icon(name: "ic_camera", price: 1.99, isFeatured: false),
                                    Icon(name: "ic_coffee", price: 4.55, isFeatured: false) ]
    
    private var bottomIConSet: [Icon] = [
                                    Icon(name: "WechatIMG63", price: 4.55, isFeatured: false),
                                    Icon(name: "WechatIMG65", price: 4.55, isFeatured: false),
                                    Icon(name: "WechatIMG66", price: 4.55, isFeatured: false),
                                    Icon(name: "WechatIMG67", price: 4.55, isFeatured: false),
                                    Icon(name: "WechatIMG68", price: 4.55, isFeatured: false),
                                    Icon(name: "WechatIMG69", price: 4.55, isFeatured: false),
                                    Icon(name: "WechatIMG77", price: 4.55, isFeatured: false),
                                    Icon(name: "WechatIMG78", price: 4.55, isFeatured: false),
                                    Icon(name: "WechatIMG79", price: 4.55, isFeatured: false),
                                    Icon(name: "WechatIMG80", price: 4.55, isFeatured: false),
                                    Icon(name: "WechatIMG81", price: 4.55, isFeatured: false) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegatesAndDSource()
        registerCell()
    }
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ( collectionView == bottomCollectionView) {
            return bottomIConSet.count
        }
        
        return iconSet.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if ( collectionView == bottomCollectionView ) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
            let icon: Icon
            
            icon = bottomIConSet[indexPath.row]
            cell.configure(with: icon)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
            let icon: Icon
            
            icon = iconSet[indexPath.row]
            cell.configure(with: icon)
            
            return cell
        }
    }
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model: Icon
        guard let detailVC = storyboard?.instantiateViewController(identifier: "detailVC") as? IconDetailViewController else { return }

        if ( collectionView == bottomCollectionView) {
            model = bottomIConSet[indexPath.row]
        } else {
            model = iconSet[indexPath.row]
        }
    
        detailVC.icon = model
        navigationController?.pushViewController(detailVC, animated: true)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

private extension IconCollectionViewController {
    func setDelegatesAndDSource() {
        collectionView.delegate = self
        collectionView.dataSource = self
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
    }
    
    func registerCell() {
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: Bundle(for: CollectionViewCell.self)), forCellWithReuseIdentifier: "Cell")
        self.bottomCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: Bundle(for: CollectionViewCell.self)), forCellWithReuseIdentifier: "Cell")
    }
}
