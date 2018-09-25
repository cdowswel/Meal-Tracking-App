//
//  DaysViewController.swift
//  healthproject
//
//  Created by Charles Dowswell on 4/16/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit
import CoreData

class DaysViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var daysTable: UITableView!
    

    var dayDataContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    
    var fetchResults =   [DayItem]()
    
    var days = [String]()
    var foods = [FoodItem]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func fetchCount() -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DayItem")
        var x   = 0
        
        fetchResults = ((try? dayDataContext.fetch(fetchRequest)) as? [DayItem])!
        
        
        x = fetchResults.count
        
        print(x)
        
        
        return x
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchCount()
    }
    
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath)
        
        cell.textLabel?.text = "Day " + String(fetchResults[indexPath.row].number) + " - " + fetchResults[indexPath.row].date!
        cell.detailTextLabel?.textAlignment = .right
        
        return cell;
    }
    
    @IBAction func returnFromSaveDay(sender: UIStoryboardSegue)
    {
        if let svc = sender.source as? NewDayViewController
        {
            let ent = NSEntityDescription.entity(forEntityName: "DayItem", in: self.dayDataContext)
            let newItem = DayItem(entity: ent!, insertInto: self.dayDataContext)
            newItem.date = String(svc.result)
            newItem.number = fetchResults.count + 1
            var i = 0

            while i < svc.foodItems.count
            {
                newItem.addToFoods(svc.foodItems[i])
                i = i + 1
            }
            
            do {
                try self.dayDataContext.save()
            } catch _ {
            }
            
            daysTable.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "totals"
        {
            let selectedIndex: IndexPath = self.daysTable.indexPath(for: sender as! UITableViewCell)!
            
            let des = segue.destination as! DayTotalViewController
            des.pickedNumber = fetchResults[selectedIndex.row].number
           
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
