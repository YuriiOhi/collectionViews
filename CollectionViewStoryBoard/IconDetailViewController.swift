//
//  IconDetailViewController.swift
//  CollectionViewStoryBoard
//
//  Created by Yurii on 2021/2/15.
//

import UIKit

class IconDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!

    @IBAction func dismisDetailVL(sender: AnyObject) {
        navigationController?.popViewController(animated: true)
    }
    
    var icon: Icon?
    // на данном этапе жизненного цикла  - у вьюКонтроллера нет аутлетов
    override func viewDidLoad() {
        super.viewDidLoad() // на данном этапе жизненного цикла  - у вьюКонтроллера есть аутлеты
        updateUI()
        hideBackButton()
    }
}

private extension IconDetailViewController {
    func updateUI() {
        guard let icon = icon else { return }
        
        nameLabel.text = icon.name
        iconImageView.image = UIImage(named: icon.name)
        priceLabel.text = "$\(icon.price)"
    }
    
    func hideBackButton() {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}
