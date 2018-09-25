//
//  DayDetailsViewController.swift
//  healthproject
//
//  Created by Charles Dowswell on 4/16/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit
import CoreData

class DayDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var detailTable: UITableView!
    var pickedNumber: Int16 = 0
    var foodCount = 0
    var dayDataContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    
    var fetchResults =   [DayItem]()
    var temp: DayItem?
    var foodies = [FoodItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DayItem")
        fetchResults = ((try? dayDataContext.fetch(fetchRequest)) as? [DayItem])!
        var i = 0
        
        while i < fetchResults.count{
            if fetchResults[i].number == pickedNumber
            {
                temp = fetchResults[i]
                break;
            }
            else {
                i = i + 1
            }
        }
        
        foodies = temp.flatMap
            {
                $0.foods!.allObjects as? [FoodItem]
        }!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodCount
    }
    
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayFoodCell", for: indexPath)
        
        cell.textLabel?.text = foodies[indexPath.row].name
        cell.imageView?.image = UIImage(data: foodies[indexPath.row].picture!)!
        cell.detailTextLabel?.textAlignment = .right
        
        return cell;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dayToFoodDetail"
        {
            let selectedIndex: IndexPath = self.detailTable.indexPath(for: sender as! UITableViewCell)!
            let des = segue.destination as! FoodDetailViewController
            des.fcal = foodies[selectedIndex.row].calories
            des.fcarb = foodies[selectedIndex.row].carbs
            des.ffat = foodies[selectedIndex.row].fat
            des.fdata = foodies[selectedIndex.row].picture
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
