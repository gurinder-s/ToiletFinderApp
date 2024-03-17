import UIKit

/// A view controller that presents a map and a list of toilets.
class ToiletMapViewController: UIViewController {
    
    // MARK: - Properties
    
    private var mapView: MapView!
    private var toiletTableListView: ToiletTableListView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        setupUI()
    }
    
    // MARK: - Setup
    
    /// Configures the view controller's initial settings.
    private func configureViewController() {
        // Setting the background color to the system's default background color
        view.backgroundColor = .systemBackground
    }
    
    /// Sets up and lays out the UI components on the screen.
    private func setupUI() {
        initializeComponents()
        layoutComponents()
    }
    
    /// Initializes the UI components.
    private func initializeComponents() {
        mapView = MapView()
        toiletTableListView = ToiletTableListView()
        
        // Disabling autoresizing mask constraints for programmatic Auto Layout
        mapView.translatesAutoresizingMaskIntoConstraints = false
        toiletTableListView.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding subviews to the view's hierarchy
        view.addSubview(mapView)
        view.addSubview(toiletTableListView)
    }
    
    /// Lays out the UI components using Auto Layout constraints.
    private func layoutComponents() {
        NSLayoutConstraint.activate([
            // MapView constraints
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mapView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            // ToiletTableListView constraints
            toiletTableListView.topAnchor.constraint(equalTo: mapView.bottomAnchor),
            toiletTableListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            toiletTableListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            toiletTableListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
