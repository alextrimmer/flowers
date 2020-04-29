//
//  CheckOutViewController.swift
//  flowerFinal
//
//  Created by Nermin Dedovic on 3/10/20.
//  Copyright © 2020 Nermin Dedovic. All rights reserved.
//

import UIKit

var reset = false

class CheckOutViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var deliveryTextField: UITextField!
    @IBOutlet weak var expTextField: UITextField!
    
    
    private var datePicker : UIDatePicker?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        dismissPickerView()
        deliveryTextField.inputView = datePicker
        
        createPickerView()
        dismissPickerView2()
        
        
    
    }
    
    
    
    var selectedMonth : String?
    var selectedYear : String?
    
    var monthList : [String] = ["---", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
    let yearList : [String] = ["---", "2020", "2021", "2021", "2022", "2023", "2024"]
    
    func createPickerView() {
           let pickerView = UIPickerView()
           pickerView.delegate = self
           expTextField.inputView = pickerView
       }
    
    func dismissPickerView2() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        expTextField.inputAccessoryView = toolBar
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return monthList.count
        } else {
            return yearList.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return monthList[row]
        } else {
            return yearList[row]
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            selectedMonth = monthList[row]
            
        } else {
            selectedYear = yearList[row]
        }
            
        
        if selectedMonth == "---" || selectedYear == "---" || selectedMonth == nil || selectedYear == nil {
            expTextField.text = ""
            return
        }
        
       
        
        expTextField.text = "\(selectedMonth!) / \(selectedYear!)"
        
    }
    
    
    
    
    
    
    func dismissPickerView() {
      let toolBar = UIToolbar()
      toolBar.sizeToFit()
      let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
      toolBar.setItems([button], animated: true)
      toolBar.isUserInteractionEnabled = true
      deliveryTextField.inputAccessoryView = toolBar
    }
    
    @objc func action() {view.endEditing(true)}
    

    
    @objc func dateChanged(datePicker : UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        deliveryTextField.text = dateFormatter.string(from: datePicker.date)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
  
    
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for tf in textFields {
            tf.resignFirstResponder()
        }
    }
    
    
    
    @IBAction func returnAction(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func addyDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func emailDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func placeOrderAction(_ sender: UIButton) {
        for tf in textFields {
            if tf.text == "" {
                showEmptyAlert()
            }
        }
        showSuccessAlert()
    }
    
    func showEmptyAlert() {
        let alertController = UIAlertController(title: "Alert!", message: "Cannot complete order. Please fill out all text fields with correct information.", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OKAY", style: .cancel, handler: nil)
        alertController.addAction(okButton)
        self.present(alertController, animated: true)
    }
    
    func showSuccessAlert() {
        let alertController = UIAlertController(title: "Success!", message: "Thank you for your order!", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OKAY", style: .default, handler: {
            (action) in
            for tf in self.textFields {
                tf.text = ""
            }
            cart.clearCart()
            reset = true
            self.performSegue(withIdentifier: "fromCheckOutToDrawing", sender: self)
            
            
        })
        
        alertController.addAction(okButton)
        self.present(alertController, animated: true)
        
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
