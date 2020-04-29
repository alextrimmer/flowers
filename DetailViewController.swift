//
//  DetailViewController.swift
//  flowerFinal
//
//  Created by Nermin Dedovic on 3/9/20.
//  Copyright © 2020 Nermin Dedovic. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var genusLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantitySelectedLabel: UILabel!
    
    @IBOutlet weak var qStepper: UIStepper!
    @IBOutlet weak var addToCartButton: UIButton!
    
    var flower : Flower?

    override func viewDidLoad() {
        super.viewDidLoad()
        quantitySelectedLabel.text = "Quantity: 0"
        
        
        
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action:
            #selector(DetailViewController.handlePinch))
        view.addGestureRecognizer(pinchGestureRecognizer)
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        if let f = flower {
            nameLabel.text = f.name
            viewImage.image = f.image
            familyLabel.text = f.family
            genusLabel.text = f.science
            priceLabel.text = "PRICE/FLOWER: \(f.price)"
            descriptionLabel.text = f.description
     
        }
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        quantitySelectedLabel.text = "Quantity: \(Int(sender.value))"
    }
    
    @IBAction func toCartAction(_ sender: UIButton) {
        
        if let f = flower {
            if qStepper.value == 0 {
                showQuantityAlert()
                return
            }
            cart.addToCart(flower: f, quantity: Int(qStepper.value))
        }
    }
    
    func showQuantityAlert() {
        let alertController = UIAlertController(title: "Error", message: "Cannot add to cart, please enter a quantity greater than zero", preferredStyle: .alert)
        
        let okay = UIAlertAction(title: "OKAY", style: .default, handler: nil)
        alertController.addAction(okay)
        
        self.present(alertController, animated: true)
    }
    
    
    
    @objc
    func handlePinch(_ sender: UIPinchGestureRecognizer) {
        let s = sender.scale
        viewImage.transform = CGAffineTransform(a: s, b: 0, c: 0, d: s, tx: 0, ty: 0)
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

var cart = ShoppingCart()
