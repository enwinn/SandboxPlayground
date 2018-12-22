//
//  AppDelegate.swift
//  SandboxPlayground
//
//  Created by Fernando Rodríguez Romero on 13/05/16.
//  Copyright © 2016 udacity.com. All rights reserved.
//

import UIKit

// MARK: - AppDelegate: UIResponder, UIApplicationDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Properties
    
    var window: UIWindow?

    func sandboxPlayground() {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.txt", isDirectory: false)
        
        do {
            try "Ho there!".write(to: url!, atomically: true, encoding: .utf8)
        } catch {
            print("Error while writing")
        }
        
        do {
            let content = try String(contentsOf: url!, encoding: .utf8)
            if content == "Hi there!" {
                print("yay")
            } else {
                print("oops - no match")
            }
        } catch {
            print("Something went wrong")
        }
    }

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        sandboxPlayground()
        return true
    }
    
}

