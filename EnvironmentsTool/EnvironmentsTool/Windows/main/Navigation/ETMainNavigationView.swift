//
//  ETMainNavigationView.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/12.
//  Copyright © 2019 lin. All rights reserved.
//

import Cocoa

protocol ETMainNavigationViewDelegate: class {
    func navigationView(_ navigationView: ETMainNavigationView, shouldChange selectedIndex: Int) -> Bool
}

class ETMainNavigationView: NSView, NSTableViewDelegate {
    
    weak var delegate: ETMainNavigationViewDelegate?
    
    var topVStackView: NSStackView = {
        let tempView = NSStackView(frame: NSRect.zero)
        tempView.orientation = .vertical
        tempView.alignment = .centerX
        tempView.spacing = 20.0
        tempView.translatesAutoresizingMaskIntoConstraints = false
        return tempView
    }()
    var bottomVStackView: NSStackView = {
        let tempView = NSStackView(frame: NSRect.zero)
        tempView.orientation = .vertical
        tempView.alignment = .centerX
        tempView.spacing = 20.0
        tempView.translatesAutoresizingMaskIntoConstraints = false
        return tempView
    }()
    
    var environmentsButton: ETMainNavigationViewItem = {
        let tempButton = ETMainNavigationViewItem(frame: NSRect.zero)
        tempButton.translatesAutoresizingMaskIntoConstraints = false
        tempButton.imageName = "home"
        tempButton.imageSelectedName = "home_selected"
        tempButton.titleText = "环境"
        tempButton.isSelected = true
        return tempButton
    }()
    var devicesButton: ETMainNavigationViewItem = {
        let tempButton = ETMainNavigationViewItem(frame: NSRect.zero)
        tempButton.translatesAutoresizingMaskIntoConstraints = false
        tempButton.imageName = "devices"
        tempButton.imageSelectedName = "devices_selected"
        tempButton.titleText = "设备"
        return tempButton
    }()
    var myEnvironmentsButton: ETMainNavigationViewItem = {
        let tempButton = ETMainNavigationViewItem(frame: NSRect.zero)
        tempButton.translatesAutoresizingMaskIntoConstraints = false
        tempButton.imageName = "environments"
        tempButton.imageSelectedName = "environments_selected"
        tempButton.titleText = "我的环境"
        return tempButton
    }()
    var updateButton: ETMainNavigationViewItem = {
        let tempButton = ETMainNavigationViewItem(frame: NSRect.zero)
        tempButton.translatesAutoresizingMaskIntoConstraints = false
        tempButton.imageName = "update"
        tempButton.imageSelectedName = "update_selected"
        tempButton.titleText = "更新"
        return tempButton
    }()
    
    var meButton: NSButton!
    var settingsButton: NSButton!
    
    var selectedIndex: Int = 0 {
        didSet {
            if selectedIndex != oldValue {
                switch selectedIndex {
                case 0:
                    environmentsButton.isSelected = true
                    devicesButton.isSelected = false
                    myEnvironmentsButton.isSelected = false
                case 1:
                    environmentsButton.isSelected = false
                    devicesButton.isSelected = true
                    myEnvironmentsButton.isSelected = false
                case 2:
                    environmentsButton.isSelected = false
                    devicesButton.isSelected = false
                    myEnvironmentsButton.isSelected = true
                default:
                    break
                }
            }
        }
    }

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
//        self.backgroundColor(color: NSColor(white: 51.0/255.0, alpha: 0.9))
        self.backgroundColor(color: NSColor.clear)
        
        // topVStackView
        self.addSubview(topVStackView)
        self.addConstraint(NSLayoutConstraint(item: topVStackView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: topVStackView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: topVStackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 40.0))
        self.addConstraint(NSLayoutConstraint(item: topVStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 175.0))
        
        // environmentsButton
        environmentsButton.target = self
        environmentsButton.action = #selector(environmentsButtonClickEvent(sender:))
        
        // devicesButton
        devicesButton.target = self
        devicesButton.action = #selector(devicesButtonClickEvent(sender:))
        
        // myEnvironmentsButton
        myEnvironmentsButton.target = self
        myEnvironmentsButton.action = #selector(myEnvironmentsButtonClickEvent(sender:))
        
        topVStackView.setViews([environmentsButton, devicesButton, myEnvironmentsButton], in: .top)
        
        topVStackView.addConstraint(NSLayoutConstraint(item: environmentsButton, attribute: .width, relatedBy: .equal, toItem: topVStackView, attribute: .width, multiplier: 1.0, constant: 0.0))
        topVStackView.addConstraint(NSLayoutConstraint(item: environmentsButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 45.0))
        topVStackView.addConstraint(NSLayoutConstraint(item: devicesButton, attribute: .width, relatedBy: .equal, toItem: topVStackView, attribute: .width, multiplier: 1.0, constant: 0.0))
        topVStackView.addConstraint(NSLayoutConstraint(item: devicesButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 45.0))
        topVStackView.addConstraint(NSLayoutConstraint(item: myEnvironmentsButton, attribute: .width, relatedBy: .equal, toItem: topVStackView, attribute: .width, multiplier: 1.0, constant: 0.0))
        topVStackView.addConstraint(NSLayoutConstraint(item: myEnvironmentsButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 45.0))
        
        
        // bottomVStackView
        self.addSubview(bottomVStackView)
        self.addConstraint(NSLayoutConstraint(item: bottomVStackView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: bottomVStackView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: bottomVStackView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -20.0))
        self.addConstraint(NSLayoutConstraint(item: bottomVStackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 68.0))
        
        // meButton
        meButton = NSButton(image: NSImage(named: "me")!, target: self, action: #selector(meButtonClickEvent(sender:)))
        meButton.translatesAutoresizingMaskIntoConstraints = false
        meButton.bezelStyle = .shadowlessSquare
        meButton.setButtonType(.momentaryPushIn)
        meButton.isBordered = false
        meButton.imageScaling = .scaleProportionallyDown
        meButton.toolTip = "我的账号"
        
        // settingsButton
        settingsButton = NSButton(image: NSImage(named: "settings")!, target: self, action: #selector(settingsButtonClickEvent(sender:)))
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.bezelStyle = .shadowlessSquare
        settingsButton.setButtonType(.momentaryPushIn)
        settingsButton.isBordered = false
        settingsButton.imageScaling = .scaleProportionallyDown
        settingsButton.toolTip = "设置"
        
        bottomVStackView.setViews([meButton, settingsButton], in: .top)
        
        bottomVStackView.addConstraint(NSLayoutConstraint(item: meButton!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 24.0))
        bottomVStackView.addConstraint(NSLayoutConstraint(item: meButton!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 24.0))
        bottomVStackView.addConstraint(NSLayoutConstraint(item: settingsButton!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 24.0))
        bottomVStackView.addConstraint(NSLayoutConstraint(item: settingsButton!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 24.0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    // MARK: - Events
    @objc func environmentsButtonClickEvent(sender: NSButton) {
        print("[ETMainNavigationView] environmentsButtonClickEvent")
        if self.delegate != nil {
            if self.delegate!.navigationView(self, shouldChange: 0) {
                self.selectedIndex = 0
            }
        }
    }
    
    @objc func devicesButtonClickEvent(sender: NSButton) {
        print("[ETMainNavigationView] devicesButtonClickEvent")
        if self.delegate != nil {
            if self.delegate!.navigationView(self, shouldChange: 1) {
                self.selectedIndex = 1
            }
        }
    }
    
    @objc func myEnvironmentsButtonClickEvent(sender: NSButton) {
        print("[ETMainNavigationView] myEnvironmentsButtonClickEvent")
        if self.delegate != nil {
            if self.delegate!.navigationView(self, shouldChange: 2) {
                self.selectedIndex = 2
            }
        }
    }
    
    @objc func meButtonClickEvent(sender: NSButton) {
        print("[ETMainNavigationView] meButtonClickEvent")
    }
    
    @objc func settingsButtonClickEvent(sender: NSButton) {
        print("[ETMainNavigationView] meButtonClickEvent")
    }
}
