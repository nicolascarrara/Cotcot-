//
//  HatchingViewController.swift
//  Cotcot'
//
//  Created by Nicolas CARRARA on 04/06/2020.
//  Copyright © 2020 Nicolas CARRARA. All rights reserved.
//

import UIKit

class HatchingViewController: UIViewController {

    //@IBOutlet weak var testView: UIView!
    @IBOutlet var CurrentHatchTable: UITableView!
    @IBOutlet var noItemsView: UIView!
    
    
    @IBAction func didTapAddd() {
        
        let vc = storyboard?.instantiateViewController(identifier: "entry")as! UIViewController
        vc.title = " TEST "
        tabBarController?.setViewControllers([vc], animated: true)
        
    }
    
    
    
    
    
    var tasks = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //CurrentHatchTable.isHidden=true
       //CurrentHatchTable.backgroundView=noItemsView
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

extension HatchingViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
    }
}

extension HatchingViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}
