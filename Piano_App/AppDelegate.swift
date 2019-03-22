//
//  AppDelegate.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 10/13/18.
//  Copyright © 2018 com.nguyenhieu.demo. All rights reserved.
//


import UIKit
import Firebase
import FBSDKCoreKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FBSDKApplicationDelegate.sharedInstance()?.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
       
        if  UserDefaults.standard.string(forKey: "UID") == nil {
             let loginVC = LoginViewController()
            loginVC.inject(presenter: LoginPresenterImp(interactor: LoginInteractorImp(), router: loginVC))
//            navigationController = UINavigationController(rootViewController: loginVC)
            window?.rootViewController = loginVC
            return true
        }
        else {
            let mainVC = HomeController()
            mainVC.inject(presenter: HomeControllerPresenterImp(interacter: InteracterImp(uid:  UserDefaults.standard.string(forKey: "UID")), router: mainVC))
            navigationController = UINavigationController(rootViewController: mainVC)
            print("UserDefaults:    \(UserDefaults.standard.string(forKey: "UID"))")
            window?.rootViewController = navigationController
            customBackButtonNavigation()
            navigationController?.setUpUINaviationItem()
            return true
        }
        
       
    }

    private func customBackButtonNavigation() {
        let yourBackImage = UIImage(named: "backBtn")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        self.navigationController?.navigationBar.backItem?.title = ""
    }
    
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//        return FBSDKApplicationDelegate.sharedInstance()?.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
//    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(app,open: url, options: options)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

