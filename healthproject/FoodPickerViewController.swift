//
//  FoodPickerViewController.swift
//  healthproject
//
//  Created by Charles Dowswell on 4/16/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit
import CoreData

class FoodPickerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var foodPickerTable: UITableView!
    
    var pickedDataContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    var fetchResults =   [FoodItem]()
    var pickedName = ""
    var pickedFood: FoodItem?
    var pickedData: Data?
    
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
        
        fetchResults = ((try? pickedDataContext.fetch(fetchRequest)) as? [FoodItem])!
        
        
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
        let selectedIndex: IndexPath = self.foodPickerTable.indexPath(for: sender as! UITableViewCell)!
        pickedFood = fetchResults[selectedIndex.row]

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
