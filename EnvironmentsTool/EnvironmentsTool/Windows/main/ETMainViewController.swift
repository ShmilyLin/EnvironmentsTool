//
//  ETMainViewController.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/11.
//  Copyright © 2019 lin. All rights reserved.
//

import Cocoa

class ETMainViewController: NSViewController, ETMainNavigationViewDelegate {
    
    var navigationView: ETMainNavigationView!
    
    lazy var environmentsView: ETMainEnvironmentsView = {
        let tempView = ETMainEnvironmentsView()
        tempView.translatesAutoresizingMaskIntoConstraints = false
//        tempView.backgroundColor(color: NSColor.white)
        self.view.addSubview(tempView)
        
        self.view.addConstraint(NSLayoutConstraint(item: tempView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: tempView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: tempView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: tempView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 70.0))
        
        return tempView
    }()
    
    lazy var devicesView: ETMainDevicesView = {
        let tempView = ETMainDevicesView()
        tempView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tempView)
        
        self.view.addConstraint(NSLayoutConstraint(item: tempView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: tempView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: tempView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: tempView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 70.0))
        
        return tempView
    }()
    
    lazy var myEnvironmentsView: ETMainMyEnvironmentsView = {
        let tempView = ETMainMyEnvironmentsView()
        tempView.translatesAutoresizingMaskIntoConstraints = false
        tempView.backgroundColor(color: NSColor.yellow)
        self.view.addSubview(tempView)
        
        self.view.addConstraint(NSLayoutConstraint(item: tempView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: tempView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: tempView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: tempView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 70.0))
        
        return tempView
    }()
    
    var currentIndex: Int = 0 {
        didSet {
            if currentIndex != oldValue {
                if navigationView != nil {
                    navigationView.selectedIndex = currentIndex
                }
                
                switch currentIndex {
                case 0:
                    environmentsView.isHidden = false
                    devicesView.isHidden = true
                    myEnvironmentsView.isHidden = true
                case 1:
                    environmentsView.isHidden = true
                    devicesView.isHidden = false
                    myEnvironmentsView.isHidden = true
                case 2:
                    environmentsView.isHidden = true
                    devicesView.isHidden = true
                    myEnvironmentsView.isHidden = false
                default:
                    break
                }
            }
        }
    }
    
    init() {
        super.init(nibName: "ETMainViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("[ETMainViewController] viewDidLoad")

        navigationView = ETMainNavigationView(frame: NSRect.zero)
        navigationView.delegate = self
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(navigationView)

        self.view.addConstraint(NSLayoutConstraint(item: navigationView!, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: navigationView!, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: navigationView!, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: navigationView!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 70.0))
        
        environmentsView.isHidden = false
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        print("[ETMainViewController] viewDidAppear")
    }
    
    // MARK: - ETMainNavigationViewDelegate
    func navigationView(_ navigationView: ETMainNavigationView, shouldChange selectedIndex: Int) -> Bool {
        self.currentIndex = selectedIndex
        return false
    }
    
}
