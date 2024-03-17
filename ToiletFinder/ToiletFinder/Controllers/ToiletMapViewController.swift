import UIKit
import CoreLocation

class ToiletMapViewController: UIViewController {
    
    // MARK: - Properties
    private var mapView: MapView! // Assuming MapView is a custom class that encapsulates MKMapView
    private var toiletTableListView: ToiletTableListView! // Assuming this is a custom UIView
    private let locationManager = CLLocationManager()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        setupUI()
        configureLocationManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mapView.showUserLocation(true)// This assumes your custom MapView class has a property or method that effectively makes this call on its MKMapView instance.
    }

    // MARK: - Setup ViewController and UI
    private func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupUI() {
        mapView = MapView()
        toiletTableListView = ToiletTableListView()
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        toiletTableListView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mapView)
        view.addSubview(toiletTableListView)
        
        layoutComponents()
    }
    
    private func layoutComponents() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            toiletTableListView.topAnchor.constraint(equalTo: mapView.bottomAnchor),
            toiletTableListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toiletTableListView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toiletTableListView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Location Manager Configuration and Authorization
    private func configureLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    private func checkLocationAuthorizationStatus() {
        if CLLocationManager.locationServicesEnabled() {
            switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .authorizedWhenInUse, .authorizedAlways:
                locationManager.startUpdatingLocation()
                
            default:
                mapView.showUserLocation(false)
            }
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension ToiletMapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async { [weak self] in
            self?.mapView.centerToLocation(location)
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        DispatchQueue.main.async { [weak self] in
            self?.checkLocationAuthorizationStatus()
        }
    }
}
