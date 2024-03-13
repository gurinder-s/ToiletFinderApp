//
//  SceneDelegate.swift
//  ToiletFinder
//
//  Created by Gurinder Singh on 27/02/2024.
//

import UIKit
import Firebase
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    //TEmp
    var isSignedIn: Bool = false

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
                window = UIWindow(frame: windowScene.coordinateSpace.bounds)
                window?.windowScene = windowScene
        
        //TO DO: Handle signed in status maybe via userservice
        if isSignedIn{
            window?.rootViewController = createTabbar()
        }else{
            window?.rootViewController = createLoginNavigationController()
        }
                window?.makeKeyAndVisible()
                configureNavigationBar()
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
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
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


}

