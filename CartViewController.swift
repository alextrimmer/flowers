//
//  CartViewController.swift
//  flowerFinal
//
//  Created by Nermin Dedovic on 3/10/20.
//  Copyright © 2020 Nermin Dedovic. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    

    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var itemInfo: UITextView!
    @IBOutlet weak var checkOutButton: UIButton!
    
    
    @IBOutlet weak var tf: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        itemInfo.text = cart.outputCartInfo()
        totalPriceLabel.text = "Total Price: \(cart.getPrice())"
        createPickerView()
        dismissPickerView()
        if cart.size == 0 {
           checkOutButton.backgroundColor = .red
        } else {
            checkOutButton.backgroundColor = .white
        }
        
        
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if cart.size == 0 {
            checkOutButton.isEnabled = false
            checkOutButton.backgroundColor = .red
        } else {
            checkOutButton.isEnabled = true
            checkOutButton.backgroundColor = .white
        }
        itemInfo.text = cart.outputCartInfo()
        totalPriceLabel.text = "Total Price: \(cart.getPrice())"
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
            tf.resignFirstResponder()
    }
    
    
    
    
   
    
    let pickerView = UIPickerView()
    
    var selectedFlower: String?
    var flowerList : [String] = cart.getKeys2()
    

    
    
    func createPickerView() {
        
        pickerView.delegate = self
        tf.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        tf.inputAccessoryView = toolBar
    }
    
    @objc func action() {
        view.endEditing(true)
        if let f = selectedFlower {
            if f == "---"  {
                return
            }
            
            cart.removeFromCart(flower: f)
            if cart.size == 0 {
                checkOutButton.isEnabled = false
                checkOutButton.backgroundColor = .red
            } else {
                checkOutButton.isEnabled = true
                checkOutButton.backgroundColor = .white
            }
            itemInfo.text = cart.outputCartInfo()
            flowerList = cart.getKeys2()
            tf.text = ""
            totalPriceLabel.text = "Total Price: " + String(cart.getPrice())
            pickerView.selectRow(0, inComponent: 0, animated: true)
            
        }
        
        
    }
    
    
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return flowerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return flowerList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedFlower = flowerList[row]
        tf.text = selectedFlower
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
