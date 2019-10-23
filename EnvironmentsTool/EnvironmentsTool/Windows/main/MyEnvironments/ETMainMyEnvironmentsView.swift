//
//  ETMainMyEnvironmentsView.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/14.
//  Copyright © 2019 lin. All rights reserved.
//

import Cocoa

class ETMainMyEnvironmentsView: NSView {

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.wantsLayer = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
