//
//  FoodSearchViewController.swift
//  healthproject
//
//  Created by Charles Dowswell on 4/16/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class FoodSearchViewController: UIViewController {
    var fname: String = ""
    var fimage: UIImage?
    
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var calField: UITextField!
    @IBOutlet weak var fatField: UITextField!
    @IBOutlet weak var carbField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.scrollView.isScrollEnabled = true
        self.webView.scalesPageToFit = true
        let newFname = fname.replacingOccurrences(of: " ", with: "+")
        let webpage = "http://www.calorieking.com/foods/search.php?keywords=" + newFname + "&go.x=0&go.y=0&go=Go"
        let url = URL(string: webpage)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveFood(_ sender: UIButton) {
        

    }
    @IBAction func forward(_ sender: UIButton) {
        webView.goForward()
    }
    
    @IBAction func previous(_ sender: UIButton) {
        webView.goBack()
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
