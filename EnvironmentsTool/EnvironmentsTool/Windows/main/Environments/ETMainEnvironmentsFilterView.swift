//
//  ETMainEnvironmentsFilterView.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/15.
//  Copyright © 2019 lin. All rights reserved.
//

import Cocoa

class ETMainEnvironmentsFilterView: NSView {
    
    var bottomBorder: NSView = {
        let tempView = NSView(frame: NSRect.zero)
        tempView.translatesAutoresizingMaskIntoConstraints = false
        tempView.wantsLayer = true
        tempView.backgroundColor(color: NSColor(white: 100.0/255.0, alpha: 0.4))
        return tempView
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        // bottomBorder
        self.addSubview(bottomBorder)
        self.addConstraint(NSLayoutConstraint(item: bottomBorder, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: bottomBorder, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: bottomBorder, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: bottomBorder, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1.0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
