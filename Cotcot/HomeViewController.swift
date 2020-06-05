//
//  HomeViewController.swift
//  Cotcot
//
//  Created by Nicolas CARRARA on 05/06/2020.
//  Copyright © 2020 Nicolas CARRARA. All rights reserved.
//

import UIKit
import SwiftyGif


class HomeViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let gif = try UIImage(gifName: "cocote.gif")
            self.imageView.setGifImage(gif, loopCount: 1)
        } catch {
            print(error)
        }
        // Do any additional setup after loading the view.
        self.imageView.delegate = self
        // Do any additional setup after loading the view.
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
extension HomeViewController : SwiftyGifDelegate {

    func gifDidStart(sender: UIImageView) {
        print("gifDidStart")
    }
    
    func gifDidLoop(sender: UIImageView) {
        print("gifDidLoop")
    }
    
    func gifDidStop(sender: UIImageView) {
        performSegue(withIdentifier: "Hatching", sender: self)
    }
}
