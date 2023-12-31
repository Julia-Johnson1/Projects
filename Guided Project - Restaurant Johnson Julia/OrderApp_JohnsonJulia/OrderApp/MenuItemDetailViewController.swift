//
//  MenuItemDetailViewController.swift
//  OrderApp
//
//  Created by Julia Parker on 6/16/23.
//

import UIKit
@MainActor
class MenuItemDetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var detailTextLabel: UILabel!
    
    @IBOutlet var addToOrderButton: UIButton!
   
    let menuItem: MenuItem
    
    init?(coder: NSCoder, menuItem: MenuItem) {
        self.menuItem = menuItem
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        nameLabel.text = menuItem.name
        detailTextLabel.text = menuItem.detailText
        priceLabel.text = menuItem.price.formatted(.currency(code: "usd"))
        
        Task.init {
            if let image = try? await
                MenuController.shared.fetchImage(fron: menuItem.imageURL) {
                imageView.image = image
            }
        }
    }
    
    @IBAction func addToOderButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.1, options: [], animations: { self.addToOrderButton.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        MenuController.shared.order.menuItems.append(menuItem)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
