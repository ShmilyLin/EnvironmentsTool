//
//  ETTableView.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/16.
//  Copyright © 2019 lin. All rights reserved.
//

import Cocoa

class ETTableView: NSScrollView {
    
    var tableView: NSTableView = {
        let tempTableView = NSTableView(frame: NSRect.zero)
        tempTableView.translatesAutoresizingMaskIntoConstraints = false
        tempTableView.gridStyleMask = .solidHorizontalGridLineMask
        tempTableView.selectionHighlightStyle = .none
        tempTableView.backgroundColor = NSColor.clear
        tempTableView.headerView = nil
        return tempTableView
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.backgroundColor = NSColor.clear
        self.borderType = .noBorder
        self.hasHorizontalScroller = false
        self.hasVerticalScroller = true
        self.drawsBackground = false
        self.autohidesScrollers = true
        
        self.documentView = tableView
        
        self.addConstraint(NSLayoutConstraint(item: tableView, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 1.0, constant: 0.0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
