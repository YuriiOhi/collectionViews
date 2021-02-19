//
//  IconCollectionViewController.swift
//  CollectionViewStoryBoard
//
//  Created by Yurii on 2021/2/14.
//

import UIKit

private let reuseIdentifier = "Cell"

class OldIconCollectionViewController: UIViewController {
    
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        
    }
    
    private var iconSet: [Icon] = [ Icon(name: "candle", price: 3.99, isFeatured: false),
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconSet.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! IconCollectionViewCell
        let icon = iconSet[indexPath.row]
        
        cell.configure(with: icon)
        
        return cell
    }
    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = iconSet[indexPath.row]
        guard let detailVC = storyboard?.instantiateViewController(identifier: "detailVC") as? IconDetailViewController else { return }
    
        detailVC.icon = model
        navigationController?.pushViewController(detailVC, animated: true)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
