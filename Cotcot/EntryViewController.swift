//
//  EntryViewController.swift
//  Cotcot
//
//  Created by Nicolas CARRARA on 05/06/2020.
//  Copyright © 2020 Nicolas CARRARA. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveHatch()
        return true
    }
    
    @IBAction func saveHatch(){
    
    }
    

}
