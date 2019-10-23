//
//  ETMainNavigationViewItem.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/13.
//  Copyright © 2019 lin. All rights reserved.
//

import Cocoa

class ETMainNavigationViewItem: NSButton {
    
    var imageName: String = "" {
        didSet {
            if imageName != oldValue {
                _normalImage = NSImage(named: imageName)
            }
        }
    }
    
    var imageSelectedName: String = "" {
        didSet {
            if imageSelectedName != oldValue {
                _selectedImage = NSImage(named: imageSelectedName)
            }
        }
    }
    
    var titleText: String = "" {
        didSet {
            if titleText != oldValue && titleLabel != nil {
                titleLabel.stringValue = titleText
            }
        }
    }
    
    var imageView: NSImageView!
    var titleLabel: ETLabel!
    
    var isSelected: Bool = false {
        didSet {
            if isSelected != oldValue {
                if imageView != nil {
                    imageView.image = isSelected ? _selectedImage : _normalImage
                }
                
                if titleLabel != nil {
                    titleLabel.textColor = isSelected ? NSColor(red: 18.0/255.0, green: 150.0/255.0, blue: 219.0/255.0, alpha: 1.0) : NSColor(white: 230.0/255.0, alpha: 1.0)
                }
            }
        }
    }
    
    private var _normalImage: NSImage? {
        didSet {
            if _normalImage != nil && !isSelected {
                if imageView == nil {
                    getImageView()
                } else {
                    imageView.image = _normalImage
                }
            }
        }
    }
    private var _selectedImage: NSImage? {
        didSet {
            if _selectedImage != nil && isSelected {
                if imageView == nil {
                    getImageView()
                } else {
                    imageView.image = _selectedImage
                }
            }
        }
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.bezelStyle = .shadowlessSquare
        self.setButtonType(.momentaryPushIn)
        self.isBordered = false
        self.title = ""
        self.isEnabled = true
        
        // imageView
        
        
        // titleLabel
        titleLabel = ETLabel(frame: NSRect.zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.alignment = .center
        titleLabel.font = NSFont.systemFont(ofSize: 12.0)
        titleLabel.textColor = NSColor(white: 230.0/255.0, alpha: 1.0)
        self.addSubview(titleLabel)
        
        self.addConstraint(NSLayoutConstraint(item: titleLabel!, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: titleLabel!, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: titleLabel!, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    func getImageView() {
        if (imageView == nil && ((!isSelected && _normalImage != nil) || (isSelected && _selectedImage != nil)) ) {
            imageView = NSImageView(image: isSelected ? _selectedImage! : _normalImage!)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(imageView)
            
            self.addConstraint(NSLayoutConstraint(item: imageView!, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0))
            self.addConstraint(NSLayoutConstraint(item: imageView!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0))
            self.addConstraint(NSLayoutConstraint(item: imageView!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 28.0))
            self.addConstraint(NSLayoutConstraint(item: imageView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 28.0))
        }
    }
    
}
