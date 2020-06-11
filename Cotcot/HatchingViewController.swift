//
//  HatchingViewController.swift
//  Cotcot'
//
//  Created by Nicolas CARRARA on 04/06/2020.
//  Copyright © 2020 Nicolas CARRARA. All rights reserved.
//

import UIKit
import RealmSwift

class HatchListItem: Object{
    @objc dynamic var espece: String = ""
    @objc dynamic var dateAdd: Date = Date()
    @objc dynamic var dateHatch: Date = Date()+1
}

class HatchingTableViewCell: UITableViewCell {
    @IBOutlet weak var speciestitlelabel: UILabel!
    @IBOutlet weak var hatchdatelabel: UILabel!
    @IBOutlet weak var hatchimageview: UIImageView!
}

class HatchingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //@IBOutlet weak var testView: UIView!
    @IBOutlet var CurrentHatchTable: UITableView!
    @IBOutlet var noItemsView: UIView!
    
    private let realm = try! Realm()
    private var data = [HatchListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = realm.objects(HatchListItem.self).map({ $0 })
        //CurrentHatchTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        CurrentHatchTable.delegate = self
        CurrentHatchTable.dataSource = self
        //CurrentHatchTable.isHidden=true
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  data.count == 0{
             CurrentHatchTable.backgroundView=noItemsView
        }
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { 
        let cell = CurrentHatchTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HatchingTableViewCell
        let hatch = data[indexPath.row]
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        cell.speciestitlelabel?.text = hatch.espece
        let timeDifference = Calendar.current.dateComponents([.day], from: Date(), to: hatch.dateHatch)
        if timeDifference.day == 0 {
            cell.hatchdatelabel?.text = "Éclosion prévue aujourd'hui !"
            cell.hatchimageview?.image = UIImage(named: "5stephatch")
        }else{
            cell.hatchdatelabel?.text = "\(timeDifference.day ?? 0) jours avant éclosion"
            let hatchtime = Calendar.current.dateComponents([.day], from: hatch.dateAdd, to: hatch.dateHatch)
            let prc = (timeDifference.day! * 100)/hatchtime.day!
            cell.hatchimageview?.image = UIImage(named: "HomeTabBar")
            switch prc {
            case 0...24 :
                cell.hatchimageview?.image = UIImage(named: "4stephatch")
            case 25...49 :
                cell.hatchimageview?.image = UIImage(named: "3stephatch")
            case 50...74 :
                cell.hatchimageview?.image = UIImage(named: "2stephatch")
            case 75...100:
                cell.hatchimageview?.image = UIImage(named: "1stephatch")
            default:
                cell.hatchimageview?.image = UIImage(named: "1stephatch")
            }
            
        }
        //cell.hatchdatelabel?.text = formatter.string(from: hatch.dateHatch)
        //cell.speciestitlelabel?.text = hatch.espece
        
        
        //cell.textLabel?.text = data[indexPath.row].espece
        return cell
    }
    
    
    @IBAction func DidTapAdd(_ sender: Any) {
       // let test = EntryViewController()
        //self.present(test, animated: true, completion: refresh)
        performSegue(withIdentifier: "entrysegue", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        CurrentHatchTable.deselectRow(at: indexPath, animated: true)
        
        // Navigation vers les détails
        
    }
    func refresh()  {
        data = realm.objects(HatchListItem.self).map({ $0 })
        if  data.count == 0{
             CurrentHatchTable.backgroundView=noItemsView
        }else{
            CurrentHatchTable.backgroundView?.isHidden=true
        }
        CurrentHatchTable.reloadData()
    }
   
    override func viewWillAppear(_ animated: Bool){
         refresh()
        
    }
}

