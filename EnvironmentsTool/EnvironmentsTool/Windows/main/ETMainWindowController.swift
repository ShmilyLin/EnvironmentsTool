//
//  ETMainWindowController.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/11.
//  Copyright © 2019 lin. All rights reserved.
//

import Cocoa

class ETMainWindowController: NSWindowController {
    
    var mainViewController: ETMainViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("[ETMainWindowController] awakeFromNib")
    }
    
    override func windowWillLoad() {
        super.windowWillLoad()
        print("[ETMainWindowController] windowWillLoad")
    }
    
    override func showWindow(_ sender: Any?) {
        super.showWindow(sender)
        print("[ETMainWindowController] showWindow", self.isWindowLoaded)
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        print("[ETMainWindowController] windowDidLoad")
        
        self.window?.contentView = self.mainViewController.view
        (self.window as! ETMainWindow).setEffectView()
//        mainViewController.viewDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
}
