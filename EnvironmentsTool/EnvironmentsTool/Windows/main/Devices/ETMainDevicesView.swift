//
//  ETMainDevicesView.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/14.
//  Copyright © 2019 lin. All rights reserved.
//

import Cocoa
import Foundation

class ETMainDevicesView: NSView {
    
    var headerView: ETMainDevicesHeaderView = {
        let tempView = ETMainDevicesHeaderView(frame: NSRect.zero)
        tempView.translatesAutoresizingMaskIntoConstraints = false
        return tempView
    }()

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
//        self.wantsLayer = true
        
        // headerView
        self.addSubview(headerView)
        self.addConstraint(NSLayoutConstraint(item: headerView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: headerView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: headerView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: headerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0))
        
        _ = ETDevice.main
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
