//
//  SceneDelegate.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import UIKit
import Hero

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        self.window = self.window ?? UIWindow()

        // Set this scene's window's background color.
        self.window!.backgroundColor = UIColor.white

        // Create a ViewController object and set it as the scene's window's root view controller.
        
        let vm = WelcomeViewModel(welcomeList: [WelcomeModel(image: "spiderman", description: "Bienvenido a la app marvel", title: "Spider man"),
                                  WelcomeModel(image: "ironman", description: "En ella podras encontrar a los personajes mas iconicos", title: "Iron Man"),
                                  WelcomeModel(image: "thanos", description: "¿De que bando eres, de los buenos, de los malos ó eres un antiheroe?", title: "Thanos"),
                                  WelcomeModel(image: "deadpool", description: "Sea cual sea tu elección esperemos que esta app sea de tu completo agrado. Bienvenido 🙈", title: "Deadpool")]
        )
        
        var userModel: UserModel = UserModel(shouldSeeWelcomeView: true)
        
        if let user = Session.user {
            userModel = user
            
        } else {
            Session.user = userModel
        }
        
        let home = TabBarHomeViewController()
        
        
        let nav = UINavigationController(rootViewController: userModel.shouldSeeWelcomeView ? WelcomeViewController(viewModel: vm) : home)
        nav.hero.isEnabled = true
        self.window!.rootViewController = nav

        // Make this scene's window be visible.
        self.window!.makeKeyAndVisible()

        guard scene is UIWindowScene else { return }
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

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

