import UIKit
import ToiletFinderServices

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        setupWindow(with: windowScene)
        configureRootViewControllerBasedOnAuthState()
        configureGlobalUIStyles()
    }
    
    // MARK: - Window Setup
    private func setupWindow(with windowScene: UIWindowScene) {
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }

    // MARK: - UI Configuration
    private func configureGlobalUIStyles() {
        UINavigationBar.appearance().tintColor = .systemBlue
        UITabBar.appearance().tintColor = .systemBlue
    }

    // MARK: - Authentication State Handling
    private func configureRootViewControllerBasedOnAuthState() {
        AuthenticationService.shared.addAuthStateListener { [weak self] user in
            DispatchQueue.main.async {
                self?.window?.rootViewController = user != nil ? self?.createTabbar() : self?.createLoginNavigationController()
                self?.window?.makeKeyAndVisible()
            }
        }
    }

    // MARK: - View Controller Creation
    private func createTabbar() -> UITabBarController {
        let tabbar = UITabBarController()
        tabbar.viewControllers = [createMapViewNavigationController(), createFavouritesNavigationController(), createProfileNavigationController()]
        return tabbar
    }
    
    private func createMapViewNavigationController() -> UINavigationController {
        let viewController = ToiletMapViewController()
        viewController.title = "Toilet Map"
        viewController.tabBarItem = UITabBarItem(title: "Toilet Map", image: UIImage(systemName: "mappin.square.fill"), tag: 0)
        return UINavigationController(rootViewController: viewController)
    }
    
    private func createFavouritesNavigationController() -> UINavigationController {
        let viewController = FavouritesViewController()
        viewController.title = "Favourites"
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: viewController)
    }
    
    private func createLoginNavigationController() -> UINavigationController {
        let viewController = LoginUserViewController() // Ensure this is properly initialized
        viewController.title = "Login"
        return UINavigationController(rootViewController: viewController)
    }
    
    private func createProfileNavigationController() -> UINavigationController {
        let viewController = ProfileViewController() // Ensure this is properly initialized
        viewController.title = "Profile"
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        return UINavigationController(rootViewController: viewController)
    }
    
    // MARK: - Scene Lifecycle
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Perform a more rigorous authentication check when the app becomes active
        AuthenticationService.shared.verifyCurrentUser { [weak self] (isValidUser, _) in
            DispatchQueue.main.async {
                if !isValidUser {
                    print("No valid user is signed in. Directing to login screen.")
                    self?.window?.rootViewController = self?.createLoginNavigationController()
                    self?.window?.makeKeyAndVisible()
                }
            }
        }
    }

    
}
