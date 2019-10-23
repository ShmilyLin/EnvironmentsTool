//
//  ETNSViewExtension.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/12.
//  Copyright © 2019 lin. All rights reserved.
//

import Cocoa

extension NSView {
    func backgroundColor(color: NSColor) {
        if (self.layer == nil) {
            self.wantsLayer = true
        }
        
        self.layer?.backgroundColor = color.cgColor
        self.needsDisplay = true
    }
}
