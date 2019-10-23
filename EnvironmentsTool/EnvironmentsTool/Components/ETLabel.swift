//
//  ETLabel.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/12.
//  Copyright © 2019 lin. All rights reserved.
//

import Cocoa

class ETLabel: NSTextField {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.isEditable = false
        self.backgroundColor = NSColor.clear
//        self.drawsBackground = false
        self.isBezeled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
