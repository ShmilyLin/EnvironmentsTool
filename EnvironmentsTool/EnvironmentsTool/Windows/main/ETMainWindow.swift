//
//  ETMainWindow.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/11.
//  Copyright © 2019 lin. All rights reserved.
//

import Cocoa

class ETMainWindow: NSWindow {
    
    var navigationEffectView: NSVisualEffectView!
    var contentEffectView: NSVisualEffectView!

    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
        
        print("[ETMainWindow] init")
        
        self.backgroundColor = NSColor.clear
        self.canHide = true
        self.isOpaque = false
        self.hidesOnDeactivate = false
        self.titlebarAppearsTransparent = true
        self.isMovableByWindowBackground = true
        
        self.minSize = NSSize(width: 600.0, height: 400.0)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("[ETMainWindow] awakeFromNib")
    }
    
    func setEffectView() {
        navigationEffectView = NSVisualEffectView(frame: NSRect.zero)
        navigationEffectView.blendingMode = .behindWindow
        navigationEffectView.state = .active
        navigationEffectView.material = .ultraDark
        navigationEffectView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView?.addSubview(navigationEffectView, positioned: .below, relativeTo: nil)
        
        self.contentView?.addConstraint(NSLayoutConstraint(item: navigationEffectView!, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1.0, constant: 0.0))
        self.contentView?.addConstraint(NSLayoutConstraint(item: navigationEffectView!, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0.0))
        self.contentView?.addConstraint(NSLayoutConstraint(item: navigationEffectView!, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        self.contentView?.addConstraint(NSLayoutConstraint(item: navigationEffectView!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 70.0))
        
        contentEffectView = NSVisualEffectView(frame: NSRect.zero)
        contentEffectView.blendingMode = .behindWindow
        contentEffectView.state = .active
        contentEffectView.material = .mediumLight
        contentEffectView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView?.addSubview(contentEffectView, positioned: .below, relativeTo: nil)
        
        self.contentView?.addConstraint(NSLayoutConstraint(item: contentEffectView!, attribute: .left, relatedBy: .equal, toItem: navigationEffectView, attribute: .right, multiplier: 1.0, constant: 0.0))
        self.contentView?.addConstraint(NSLayoutConstraint(item: contentEffectView!, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0.0))
        self.contentView?.addConstraint(NSLayoutConstraint(item: contentEffectView!, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        self.contentView?.addConstraint(NSLayoutConstraint(item: contentEffectView!, attribute: .right, relatedBy: .equal, toItem: self.contentView, attribute: .right, multiplier: 1.0, constant: 0.0))

    }
    
    override func mouseDown(with event: NSEvent) {
        print("[ETMainWindow] mouseDown")
        
        self.makeFirstResponder(nil)
    }
}
