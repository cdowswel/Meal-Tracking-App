//
//  FoodListViewController.swift
//  healthproject
//
//  Created by Charles Dowswell on 4/16/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit
import CoreData

class FoodListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var foodTable: UITableView!
    var foodDataContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    
    var   fetchResults =   [FoodItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func fetchCount() -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FoodItem")
        var x   = 0
        
        fetchResults = ((try? foodDataContext.fetch(fetchRequest)) as? [FoodItem])!
        
        
        x = fetchResults.count
        
        print(x)
        
        
        return x
        
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchCount()
    }
    
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
        
        cell.detailTextLabel?.textAlignment = .right
        
        cell.textLabel?.text = fetchResults[indexPath.row].name
        cell.imageView?.image = UIImage(data: fetchResults[indexPath.row].picture!)
        
        return cell;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detail"
        {
            let selectedIndex: IndexPath = self.foodTable.indexPath(for: sender as! UITableViewCell)!

            let des = segue.destination as! FoodDetailViewController
            des.fname = fetchResults[selectedIndex.row].name!
            des.fcal = fetchResults[selectedIndex.row].calories
            des.fcarb = fetchResults[selectedIndex.row].carbs
            des.ffat = fetchResults[selectedIndex.row].fat
            des.fdata = fetchResults[selectedIndex.row].picture!
        
        }
    }
    
    
    @IBAction func returnFromAdd(sender: UIStoryboardSegue)
    {
        if let svc = sender.source as? FoodSearchViewController
        {
            let ent = NSEntityDescription.entity(forEntityName: "FoodItem", in: self.foodDataContext)
            let newItem = FoodItem(entity: ent!, insertInto: self.foodDataContext)
            newItem.name = svc.fname
            newItem.calories = Double(svc.calField.text!)!
            newItem.carbs = Double(svc.carbField.text!)!
            newItem.fat = Double(svc.fatField.text!)!
            newItem.picture = UIImagePNGRepresentation(svc.fimage!) as Data?
            
            do {
                try self.foodDataContext.save()
            } catch _ {
            }
            
            foodTable.reloadData()
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
