//
//  NewFoodViewController.swift
//  healthproject
//
//  Created by Charles Dowswell on 4/16/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class NewFoodViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    var pickedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let des = segue.destination as! FoodSearchViewController
        des.fname = nameField.text!
        des.fimage = pickedImage
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        let img = UIImagePickerController()
        img.delegate = self
        img.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        img.allowsEditing = false
        
        self.present(img, animated: true)
        {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imageView.image = image
            pickedImage = image
        }
        
        self.dismiss(animated: true, completion: nil)
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
