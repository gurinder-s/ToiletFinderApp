import UIKit
import MapKit

/// A custom view that contains a map view.
class MapView: UIView {
    
    // MARK: - Properties
    
    private var mapView: MKMapView!
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        setupMapView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    
    /// Configures the view's initial settings.
    private func configureView() {
        // Setting the background color to the system's default background color
        self.backgroundColor = .systemBackground
    }
    
    /// Sets up and configures the map view.
    private func setupMapView() {
        mapView = MKMapView()
        
        // Disabling autoresizing mask constraints for programmatic Auto Layout
        mapView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mapView)
        
        layoutMapView()
    }
    
    /// Lays out the map view using Auto Layout constraints.
    private func layoutMapView() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
