//
//  FoodDetailViewController.swift
//  healthproject
//
//  Created by Charles Dowswell on 4/16/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    var fname = ""
    var fcal: Double!
    var fcarb: Double!
    var ffat: Double!
    var fdata: Data!

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var calLabel: UILabel!
    @IBOutlet weak var carbLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodNameLabel.text = fname
        foodNameLabel.textAlignment = .center
        calLabel.text = String(fcal)
        calLabel.textAlignment = .left
        carbLabel.text = String(fcarb) + " g"
        carbLabel.textAlignment = .left
        fatLabel.text = String(ffat) + " g"
        fatLabel.textAlignment = .left
        foodImageView.image = UIImage(data: fdata)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
