//
//  AppDelegate.swift
//  ExameniOS
//
//  Created by Luis Zavaleta on 27/08/21.
//

import UIKit
import Firebase
import FirebaseDatabase
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        var ref: DatabaseReference!
        ref = Database.database().reference()
        //ref.child("color").setValue(["value": "#331233"])
        
        ref.child("color/value").getData { (error, snapshot) in
            if let error = error {
                print("Error al obtener los datos \(error)")
            }
            else if snapshot.exists() {
                print("color screens \(snapshot.value!)")
            }
            else {
                print("No existen datos")
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

