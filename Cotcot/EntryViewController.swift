//
//  EntryViewController.swift
//  Cotcot
//
//  Created by Nicolas CARRARA on 05/06/2020.
//  Copyright © 2020 Nicolas CARRARA. All rights reserved.
//

import RealmSwift
import UIKit

class EntryViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var field: UITextField!
    @IBOutlet var DatePicker: UIDatePicker!
    
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.becomeFirstResponder()
        field.delegate = self
        DatePicker.setDate(Date(), animated: true)
        
    }
    
    @IBAction func saveHatch(){
        if let text = field.text, !text.isEmpty{
            let date = DatePicker.date
            realm.beginWrite()
            let newHatch = HatchListItem()
            newHatch.espece = text
            newHatch.dateAdd = date
            newHatch.dateHatch = Calendar.current.date(byAdding: .day, value: 21, to: date)!
            realm.add(newHatch)
             
            try! realm.commitWrite()
            
            dismiss(animated: true,completion: nil)
        }else{
            print("add something")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    @IBAction func TapDismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    
    

}
