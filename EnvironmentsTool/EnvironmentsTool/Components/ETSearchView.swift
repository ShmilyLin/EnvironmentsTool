//
//  ETSearchView.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/14.
//  Copyright © 2019 lin. All rights reserved.
//

import Cocoa

protocol ETSearchViewDelegate: class {
    func searchView(_ searchView: ETSearchView, should focus: Bool) -> Bool
    func searchView(_ searchView: ETSearchView, on focus: Bool)
    
    
}

extension ETSearchViewDelegate {
    func searchView(_ searchView: ETSearchView, should focus: Bool) -> Bool {
        return true
    }
}

class ETSearchView: NSView, NSTextFieldDelegate {
    
    weak var delegate: ETSearchViewDelegate?
    
    var isInputing: Bool = false {
        didSet {
            if isInputing != oldValue {
                if isInputing {
                    textInputView.stringValue = ""
                    inputText = ""
                    textInputView.isHidden = false
                    DispatchQueue.main.async {
                        self.window?.makeFirstResponder(self.textInputView)
//                        self.textInputView.becomeFirstResponder()
                    }
                } else {
                    self.window?.makeFirstResponder(nil)
//                    textInputView.resignFirstResponder()
                    if (inputText.count > 0) {
                        
                    } else {
                        textInputView.stringValue = ""
                        textInputView.isHidden = true
                    }
                }
            }
        }
    }
    
    var inputText: String = "" {
        didSet {
            if inputText.count > 0 {
                clearButton.isHidden = false
            } else {
                clearButton.isHidden = true
            }
        }
    }
    
    // MARK: - UI
    lazy var iconView: NSImageView = {
        let tempView = NSImageView(image: NSImage(named: "search")!)
        tempView.translatesAutoresizingMaskIntoConstraints = false
        return tempView
    }()
    
    lazy var textInputView: NSTextField = {
        let tempView = NSTextField(frame: NSRect.zero)
        tempView.translatesAutoresizingMaskIntoConstraints = false
        tempView.isBordered = false
        tempView.font = NSFont.systemFont(ofSize: 12.0)
        tempView.backgroundColor = NSColor.clear
        tempView.focusRingType = .none
        tempView.delegate = self
        
        self.addSubview(tempView)
        self.addConstraint(NSLayoutConstraint(item: tempView, attribute: .left, relatedBy: .equal, toItem: iconView, attribute: .right, multiplier: 1.0, constant: 5.0))
        self.addConstraint(NSLayoutConstraint(item: tempView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -(8.0 + 14.0 + 5.0)))
        self.addConstraint(NSLayoutConstraint(item: tempView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        return tempView
    }()
    
    lazy var clearButton: NSButton = {
        let tempButton = NSButton(image: NSImage(named: "close_ffffff")!, target: self, action: #selector(clearButtonClickEvent(sender:)))
        tempButton.translatesAutoresizingMaskIntoConstraints = false
        tempButton.isBordered = false
        tempButton.backgroundColor(color: NSColor(white: 90.0/255.0, alpha: 1.0))
        tempButton.layer?.cornerRadius = 9.0
        tempButton.layer?.borderColor = NSColor(white: 90.0/255.0, alpha: 1.0).cgColor
        tempButton.layer?.borderWidth = 4.0
        self.addSubview(tempButton)
        self.addConstraint(NSLayoutConstraint(item: tempButton, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -8.0))
        self.addConstraint(NSLayoutConstraint(item: tempButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 18.0))
        self.addConstraint(NSLayoutConstraint(item: tempButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 18.0))
        self.addConstraint(NSLayoutConstraint(item: tempButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        return tempButton
    }()
    
    // MARK: - Init
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.addSubview(iconView)
        self.addConstraint(NSLayoutConstraint(item: iconView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 8.0))
        self.addConstraint(NSLayoutConstraint(item: iconView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 5.0))
        self.addConstraint(NSLayoutConstraint(item: iconView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -5.0))
        self.addConstraint(NSLayoutConstraint(item: iconView, attribute: .width, relatedBy: .equal, toItem: iconView, attribute: .height, multiplier: 1.0, constant: 0.0))

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        self.addTrackingRect(dirtyRect, owner: self, userData: nil, assumeInside: false)
        self.addTrackingArea(NSTrackingArea(rect: dirtyRect, options: [.mouseEnteredAndExited, .activeInActiveApp, .inVisibleRect], owner: self, userInfo: nil))
    }
    
    override var mouseDownCanMoveWindow: Bool {
        get {
            return false
        }
    }
    
    override func mouseDown(with event: NSEvent) {
        
    }
    
    override func mouseUp(with event: NSEvent) {
        let eventLocation = event.locationInWindow
        let center = convert(eventLocation, from: nil)
        if center.x >= 0 && center.y >= 0 {
            if isInputing {
                
            } else {
                if inputText.count <= 0 {
                    if delegate != nil {
                        if delegate?.searchView(self, should: true) ?? true {
                            isInputing = true
                            delegate?.searchView(self, on: true)
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Events
    @objc func clearButtonClickEvent(sender: NSButton) {
        if !isInputing {
            if delegate != nil {
                if delegate?.searchView(self, should: true) ?? true {
                    isInputing = true
                    delegate?.searchView(self, on: true)
                }
            }
        } else {
            textInputView.stringValue = ""
            inputText = ""
        }
    }
    
    func controlTextDidChange(_ obj: Notification) {
        self.inputText = self.textInputView.stringValue
    }
    
//    func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
//        print("[ETSearchView] control textShouldEndEditing")
//        if self.inputText.count > 0 {
//            self.isInputing = false
//        }
//
//        return true
//    }
    
    func controlTextDidBeginEditing(_ obj: Notification) {
        print("[ETSearchView] controlTextDidBeginEditing")
    }
    
    func controlTextDidEndEditing(_ obj: Notification) {
        print("[ETSearchView] controlTextDidEndEditing", obj.userInfo)
        if delegate != nil {
            if delegate?.searchView(self, should: false) ?? true {
                isInputing = false
                delegate?.searchView(self, on: false)
            }
        }
    }

}
