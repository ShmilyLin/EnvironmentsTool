//
//  AppDelegate.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/11.
//  Copyright © 2019 lin. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindowController: ETMainWindowController?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        getAMainWindow()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func getAMainWindow() {
        mainWindowController = ETMainWindowController(windowNibName: "ETMainWindowController")
        mainWindowController!.mainViewController = ETMainViewController()
        
        mainWindowController!.showWindow(self)
        mainWindowController!.window!.center()
        mainWindowController!.window!.makeKey()
//        mainWindow?.makeKeyAndOrderFront(nil)
        mainWindowController!.window!.makeMain()
    }
    
    func applicationDidBecomeActive(_ notification: Notification) {
        print("[AppDelegate] applicationDidBecomeActive")
    }
    
    func applicationDidResignActive(_ notification: Notification) {
        print("[AppDelegate] applicationDidResignActive")
    }
}

