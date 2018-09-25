//
//  StoreViewController.swift
//  healthproject
//
//  Created by Charles Dowswell on 4/16/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class StoreViewController: UIViewController,  CLLocationManagerDelegate, MKMapViewDelegate {

    var locationManager: CLLocationManager!
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
      
        map.showsUserLocation = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0]
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.map.setRegion(region, animated: true)
    }
    @IBAction func findJuice(_ sender: UIButton) {
        let allAnnotations = self.map.annotations
        self.map.removeAnnotations(allAnnotations)
        
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "Juice"
        request.region = map.region
        
        let search = MKLocalSearch(request: request)
        search.start(completionHandler: {(response, error) in
            if error != nil {
                print("Error")
            }
            else if response!.mapItems.count == 0
            {
                print("No matches")
            }
            else{
                for item in response!.mapItems
                {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    self.map.addAnnotation(annotation)
                }
            }
        })

    }
    @IBAction func showVitamins(_ sender: UIButton) {
        let allAnnotations = self.map.annotations
        self.map.removeAnnotations(allAnnotations)
        
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "Vitamins"
        request.region = map.region
        
        let search = MKLocalSearch(request: request)
        search.start(completionHandler: {(response, error) in
            if error != nil {
                print("Error")
            }
            else if response!.mapItems.count == 0
            {
                print("No matches")
            }
            else{
                for item in response!.mapItems
                {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    self.map.addAnnotation(annotation)
                }
            }
        })
    }
    
    @IBAction func findGrocery(_ sender: UIButton) {
        let allAnnotations = self.map.annotations
        self.map.removeAnnotations(allAnnotations)
        
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "Grocery"
        request.region = map.region
        
        let search = MKLocalSearch(request: request)
        search.start(completionHandler: {(response, error) in
            if error != nil {
                print("Error")
            }
            else if response!.mapItems.count == 0
            {
                print("No matches")
            }
            else{
                for item in response!.mapItems
                {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    self.map.addAnnotation(annotation)
                }
            }
        })
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
