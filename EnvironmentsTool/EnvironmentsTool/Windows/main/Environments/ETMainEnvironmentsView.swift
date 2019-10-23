//
//  ETMainEnvironmentsView.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/14.
//  Copyright © 2019 lin. All rights reserved.
//

import Cocoa

class ETMainEnvironmentsView: NSView, NSTableViewDelegate, NSTableViewDataSource {
    
    var headerView: ETMainEnvironmentsHeaderView = {
        let tempView = ETMainEnvironmentsHeaderView(frame: NSRect.zero)
        tempView.translatesAutoresizingMaskIntoConstraints = false
        return tempView
    }()
    
    var filterView: ETMainEnvironmentsFilterView = {
        let tempView = ETMainEnvironmentsFilterView(frame: NSRect.zero)
        tempView.translatesAutoresizingMaskIntoConstraints = false
        return tempView
    }()
    
    var tableView: ETTableView = {
        let tempTableView = ETTableView(frame: NSRect.zero)
        tempTableView.translatesAutoresizingMaskIntoConstraints = false
        return tempTableView
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        // headerView
        self.addSubview(headerView)
        self.addConstraint(NSLayoutConstraint(item: headerView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: headerView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: headerView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: headerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 60.0))
        
        // filterView
        self.addSubview(filterView)
        self.addConstraint(NSLayoutConstraint(item: filterView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: filterView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: filterView, attribute: .top, relatedBy: .equal, toItem: headerView, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: filterView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80.0))
        
        // tableView
        tableView.tableView.delegate = self
        tableView.tableView.dataSource = self
        self.addSubview(tableView)
        self.addConstraint(NSLayoutConstraint(item: tableView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: tableView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: filterView, attribute: .bottom, multiplier: 1.0, constant: 0.0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    // MARK: - NSTableViewDelegate, NSTableViewDataSource
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var tempView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "NSTableCellView"), owner: self) as? NSTableCellView
        if tempView == nil {
            tempView = NSTableCellView(frame: NSRect.zero)
        }
        
        return tempView
    }
}
