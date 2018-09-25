//
//  DayTotalViewController.swift
//  healthproject
//
//  Created by Charles Dowswell on 4/16/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit
import CoreData

class DayTotalViewController: UIViewController {
    
    var day: DayItem?
    var foodSet: NSSet?
    var pickedDate = ""
    var temp = 0
    var match: DayItem?
    var pickedNumber: Int16 = 0
    var dayDataContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    
    var fetchResults =   [DayItem]()
    
    @IBOutlet weak var calLabel: UILabel!
    @IBOutlet weak var carbLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DayItem")
        fetchResults = ((try? dayDataContext.fetch(fetchRequest)) as? [DayItem])!
        var i = 0
        
        while i < fetchResults.count{
            if fetchResults[i].number == pickedNumber
            {
                match = fetchResults[i]
                break;
            }
            else {
                i = i + 1
            }
        }
        
        let foodies = match.flatMap
            {
                $0.foods!.allObjects as? [FoodItem]
            }
        temp = foodies!.count
        var calTotal = 0.0
        var carbTotal = 0.0
        var fatTotal = 0.0
        
        var j = 0
        while j < foodies!.count
        {
            calTotal = calTotal + foodies![j].calories
            carbTotal = carbTotal + foodies![j].carbs
            fatTotal = fatTotal + foodies![j].fat
            j = j + 1
        }
        
        calLabel.text = String(calTotal)
        calLabel.textAlignment = .right
        if calTotal < 2500 {
            calLabel.textColor = .green
        }
        else if calTotal >= 2500 && calTotal < 3000
        {
            calLabel.textColor = .orange
        }
        else if calTotal > 3000
        {
            calLabel.textColor = .red
        }
        carbLabel.text = String(carbTotal)
        carbLabel.textAlignment = .right
        if carbTotal < 225 {
            carbLabel.textColor = .green
        }
        else if carbTotal >= 225 && carbTotal < 325
        {
            carbLabel.textColor = .orange
        }
        else if carbTotal > 325
        {
            carbLabel.textColor = .red
        }
        fatLabel.text = String(fatTotal)
        fatLabel.textAlignment = .right
        if fatTotal < 44 {
            fatLabel.textColor = .green
        }
        else if fatTotal >= 44 && fatTotal < 78
        {
            fatLabel.textColor = .orange
        }
        else if fatTotal > 78
        {
            fatLabel.textColor = .red
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "totalToDetail"
        {
            let des = segue.destination as! DayDetailsViewController
            des.pickedNumber = match!.number
            des.foodCount = temp
        }
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
