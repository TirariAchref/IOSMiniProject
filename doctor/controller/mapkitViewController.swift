//
//  mapkitViewController.swift
//  doctor
//
//  Created by User on 04.01.2022.
//

import UIKit
import Foundation

import CoreLocation
import MapKit

class mapkitViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
//var
    var listuser = [User]()
    var locValue:CLLocationCoordinate2D?
    var newCoordinate : CLLocationCoordinate2D?
    let locationManager = CLLocationManager()
       let myPin = MKPointAnnotation()
    var myPin2 = MKPointAnnotation()
   
       private var currentCoordinate: CLLocationCoordinate2D?
    var logmap : String?
    var latmap : String?
    var userviewmodelm = userVM()
       //outlet
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var saveLocationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        saveLocationButton.isEnabled = false
               
               self.locationManager.requestAlwaysAuthorization()
               self.locationManager.requestWhenInUseAuthorization()
               
               if CLLocationManager.locationServicesEnabled() {
                   locationManager.delegate = self
                   locationManager.desiredAccuracy = kCLLocationAccuracyBest
                   locationManager.startUpdatingLocation()
               }
               
               mapView.delegate = self
               mapView.mapType = .standard
               mapView.isZoomEnabled = true
               mapView.isScrollEnabled = true
               
               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(mapkitViewController.handleTap(gestureRecognizer:)))
               self.mapView.addGestureRecognizer(tapGesture)
        let ll = Double.init((userviewmodelm.userToken?.log)!)
        let lat = Double.init((userviewmodelm.userToken?.lat)!)
      
         locValue = CLLocationCoordinate2DMake(ll!,lat!);
        
        userviewmodelm.getallusers()
        sleep(1)
      
        userviewmodelm.userdata.forEach{ msg in
            let myPin3 = MKPointAnnotation()
          
           
            
            myPin3.coordinate =   locValue!
            myPin3.title = msg.nom
         
            mapView.addAnnotation(myPin3)
            
        }
      

               
    }
    

    
       override func viewDidDisappear(_ animated: Bool) {
           SecondModalTransitionMediator.instance.sendPopoverDismissed(modelChanged: true)
       }
       
       // protocols
       internal func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
           if annotation is PinAnnotation {
               let pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "")
               
               pinAnnotationView.tintColor = UIColor(named: "accentColor")
               pinAnnotationView.isDraggable = true
               pinAnnotationView.canShowCallout = true
               pinAnnotationView.animatesDrop = true
               
               return pinAnnotationView
           }
           
           
           
           let identifiant = "MonMarqueur"
           
           if annotation.isKind(of: MKUserLocation.self) {
               return nil
           }
           
           // Réutiliser l'annotation si possible
           var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifiant) as? MKMarkerAnnotationView
           
          if annotationView == nil {
               annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifiant)
           }
           annotationView?.image = UIImage(systemName: "person.circle" )

           //annotationView?.glyphText = "🚀"
           //annotationView?.markerTintColor = .red
           
           return annotationView
           
           
           
           
           
           
           
       }
       
       internal func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
           if let annotation = view.annotation as? PinAnnotation {
               mapView.removeAnnotation(annotation)
           }
       }
       
       // methods
       @objc func handleTap(gestureRecognizer: UITapGestureRecognizer){
           
           if gestureRecognizer.state != UITapGestureRecognizer.State.began{
               let touchLocation = gestureRecognizer.location(in: mapView)
               let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
               
               saveLocationButton.isEnabled = true
               
               print("Tapped at Lattitude: " + String(locationCoordinate.latitude) + ", Longitude: " + String(locationCoordinate.longitude))
               
               
               myPin.coordinate = locationCoordinate
               
               myPin.title = userviewmodelm.userToken?.nom
               latmap =  String(locationCoordinate.latitude)
               logmap = String(locationCoordinate.longitude)
               mapView.addAnnotation(myPin)
              
               
             
               
           }
       }
       
       
       
       
      
    @IBAction func upd(_ sender: Any) {
        userviewmodelm.updatemap(id: (userviewmodelm.userToken?._id)!, log: logmap!, lat: latmap!)
        prompt(title: "Succes", message: "Updated Location !!")
    }
    
       
    func prompt(title: String, message: String) {
           
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           
           let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
           
           alert.addAction(action)
           self.present(alert, animated: true, completion: nil)
           
       }

}
