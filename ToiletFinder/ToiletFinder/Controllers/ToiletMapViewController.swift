import UIKit
import CoreLocation

class ToiletMapViewController: UIViewController {
    
    // MARK: - Properties
    private var mapView = MapView()
    private var toiletTableListView = ToiletTableListView()
    private var locationManager = CLLocationManager()
    
    private let mapViewHeightMultiplier: CGFloat = 0.5
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLocationManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLocationAuthorizationStatus()
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        view.backgroundColor = .systemBackground
        setupMapView()
        setupToiletTableListView()
    }
    
    private func setupMapView() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: mapViewHeightMultiplier)
        ])
    }
    
    private func setupToiletTableListView() {
        toiletTableListView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toiletTableListView)
        NSLayoutConstraint.activate([
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
    
    private func updateLocationAuthorizationStatus() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
            mapView.showUserLocation(true)
            mapView.centerToLocation(locationManager)
        default:
            mapView.showUserLocation(false)
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension ToiletMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        //mapView.centerToLocation(location)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        updateLocationAuthorizationStatus()
    }
}
