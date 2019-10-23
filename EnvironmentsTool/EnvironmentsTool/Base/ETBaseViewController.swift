//
//  ETBaseViewController.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/12.
//  Copyright © 2019 lin. All rights reserved.
//

import Cocoa

class ETBaseViewController: NSViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        
        let aview = NSView(frame: NSRect.zero)
        aview.wantsLayer = true
        aview.layer?.backgroundColor = NSColor.white.cgColor
        self.view = aview
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
