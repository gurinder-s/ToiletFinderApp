//
//  SceneDelegate.swift
//  ToiletFinder
//
//  Created by Gurinder Singh on 27/02/2024.
//

import UIKit
import ToiletFinderServices
import ToiletFinderDomain
import FirebaseAuth
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        self.setupWindow(with: scene)
        configureRootViewControllerBasedOnAuthState()
        configureNavigationBar()
        
        
    }
    public func setupWindow(with scene: UIScene){
        guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            window?.makeKeyAndVisible()
    }
public func createTabbar() -> UITabBarController{
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = .systemBlue
        tabbar.viewControllers = [createMapViewNavigationController(),createFavouritesNavigationController()]
        return tabbar
    }
    
    func createMapViewNavigationController() -> UINavigationController{
        let viewController = ToiletMapViewController()
        viewController.title = "Toilet Map"
        //TODO: Change to a SF Symbol
        viewController.tabBarItem = UITabBarItem(title: "Toilet Map", image: UIImage(systemName: "mappin.square.fill"), tag: 0)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createFavouritesNavigationController() -> UINavigationController{
        let viewController = FavouritesViewController()
        viewController.title = "Favourites"
        //TODO: Change to a SF Symbol
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createLoginNavigationController() -> UINavigationController{
        let viewController = LoginUserViewController()
        viewController.title = "Login"
        return UINavigationController(rootViewController: viewController)
    }
    func configureNavigationBar(){
           UINavigationBar.appearance().tintColor = .systemBlue
       }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        AuthenticationService.shared.verifyCurrentUser { [weak self] (isValidUser, _) in
            DispatchQueue.main.async {
                if isValidUser {
                    print("User is valid and signed in.")
                    // Keep the user on the current screen or update the view as needed.
                } else {
                    print("No valid user is signed in. Directing to login screen.")
                    self?.window?.rootViewController = self?.createLoginNavigationController()
                    self?.window?.makeKeyAndVisible()
                }
            }
        }
    }


    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    private func configureRootViewControllerBasedOnAuthState() {
        
            AuthenticationService.shared.addAuthStateListener { [weak self] user in
                guard let self = self else { return }
                
                DispatchQueue.main.async {
                    if let _ = user {
                        // User is signed in
                        print("User is signed in")
                        self.window?.rootViewController = self.createTabbar()
                    } else {
                        // No user is signed in
                        print("No user is signed in.")
                        self.window?.rootViewController = self.createLoginNavigationController()
                    }
                    self.window?.makeKeyAndVisible()
                }
            }
        }

    
    public func checkAuthentication(){
        print(Auth.auth().currentUser)
        if Auth.auth().currentUser == nil{
            self.window?.rootViewController = createLoginNavigationController()
        }else{
            self.window?.rootViewController = createTabbar()
        }
    }


}

