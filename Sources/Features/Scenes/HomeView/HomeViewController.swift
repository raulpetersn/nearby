//
//  HomeViewController.swift
//  Nearby
//
//  Created by Rauls on 31/01/25.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
    private var places: [Place] = []
    private let homeView = HomeView()
    private var homeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        homeView.mapView.delegate = self
        homeView.configureTableViewDelegate(self, dataSource: self)
        defineInitialLocation()
        
        homeViewModel.fecthInitialDate { [weak self] categories in
            guard let self = self else { return }
            self.homeView.updateFilterButtons(with: categories) { selectedCategory in
                self.filterPlaces(by: selectedCategory)
                
            }
        }
        
        self.addAnnotationToMap()
        
        homeViewModel.didUpdatePlaces = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.places = self.homeViewModel.places
                self.homeView.reloadTableViewData()
                self.addAnnotationToMap()
            }
        }
        
       
        
    }
    
    private func defineInitialLocation() {
        let initialLocation = CLLocationCoordinate2D(latitude: -23.561187293883442, longitude: -46.656451388116494)
        homeView.mapView.setRegion(MKCoordinateRegion(center: initialLocation, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: false)
    }
    
    func filterPlaces(by category: Category) {
        let currentCenter = homeView.mapView.region.center
        homeViewModel.fetchPlaces(for: category.id, usrLocation: currentCenter)
    }
    
    
    private func addAnnotationToMap() {
        homeView.mapView.removeAnnotations(homeView.mapView.annotations)
        let annotation = places.map { PlaceAnnotation(place: $0) }
        
        homeView.mapView.addAnnotations(annotation)
        if let firstAnnotation = annotation.first {
            homeView.mapView.setRegion(MKCoordinateRegion(center: firstAnnotation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)), animated: true)
        }
    }
    
    
}

extension HomeViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }
    
        let identifier = "CustomPin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            if let pinImage = UIImage(named: "filedMapIcon") {
                annotationView?.image = pinImage
                annotationView?.frame.size = CGSize(width: 50, height: 68)
               
            } else {
                annotationView?.annotation = annotation
            }
            
        }
        return annotationView
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let annotation = view.annotation as? PlaceAnnotation else { return }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlaceTableViewCell.identifier, for: indexPath) as? PlaceTableViewCell else { return UITableViewCell()
        }
        
        cell.configure(with: places[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let details = DetailsViewController()
        
        details.place = places[indexPath.row]
        details.title = places[indexPath.row].name
        navigationController?.pushViewController(details, animated: true)
        
    }
    
    
}
