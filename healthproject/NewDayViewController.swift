//
//  NewDayViewController.swift
//  healthproject
//
//  Created by Charles Dowswell on 4/16/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class NewDayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var newDayTable: UITableView!
    var foods = [String]()
    var images = [UIImage]()
    var foodItems = [FoodItem]()
    var dayNumber = 0
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
        
        cell.textLabel?.text = foodItems[indexPath.row].name
        cell.imageView?.image = UIImage(data: foodItems[indexPath.row].picture!)
        cell.detailTextLabel?.textAlignment = .right
        
        return cell;
    }
    
    @IBAction func returnFromAddFood(sender: UIStoryboardSegue)
    {
        if let svc = sender.source as? FoodPickerViewController
        {
            //print(svc.pickedName)
            //foods.append(svc.pickedName)
            //images.append(UIImage(data: svc.pickedData!)!)
            foodItems.append(svc.pickedFood!)
            newDayTable.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        result = formatter.string(from: date)
        
        
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
