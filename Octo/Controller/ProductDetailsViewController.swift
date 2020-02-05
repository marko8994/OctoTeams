//
//  ProductDetailsViewController.swift
//  OctoTeams
//
//  Created by Marko Mladenovic on 2/4/20.
//  Copyright © 2020 Grne Dev. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UITableViewController {
    
    var productUid: String!
    
    private var product: Product!

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var nameCell: UITableViewCell!
    @IBOutlet weak var descriptionCell: UITableViewCell!
    @IBOutlet weak var priceCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProduct()
        setUpLabels()
        setUpProductInfo()
        setUpGestureRecognizer()
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    private func setUpProduct() {
        if let product = MockData.shared.fetchProduct(with: productUid) {
            self.product = product
        } else {
            self.product = Product()
        }
    }
    
    private func setUpLabels() {
        nameCell.textLabel?.text = NSLocalizedString("Common.Name", comment: "")
        priceCell.textLabel?.text = NSLocalizedString("Common.Price", comment: "")
    }

    private func setUpProductInfo(){
        if let url = URL(string: product.imageURL), let data = try? Data(contentsOf: url) {
            productImage.image = UIImage(data: data)
        }
        nameCell.detailTextLabel?.text = product.name
        descriptionCell.textLabel?.text = product.description
        var priceCurrency: String
        if product.price == 1 {
            priceCurrency = NSLocalizedString("Common.Currency.Euro", comment: "")
        } else {
            priceCurrency = NSLocalizedString("Common.Currency.Euros", comment: "")
        }
        priceCell.detailTextLabel?.text = String(product.price) + " " + priceCurrency
    }
    
    private func setUpGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        productImage.isUserInteractionEnabled = true
        productImage.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @IBAction func imageTapped(sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func dismissFullscreenImage(sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()

    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int ) -> String? {
        return NSLocalizedString("Title.ProductInfo", comment: "")
    }
}
