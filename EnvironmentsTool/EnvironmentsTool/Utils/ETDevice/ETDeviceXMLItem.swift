//
//  ETDeviceXMLItem.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/22.
//  Copyright © 2019 lin. All rights reserved.
//

import Foundation

class ETDeviceXMLItem: NSObject {
    var CommandLineArguments: [String]?
    
    var CompletionInterval: Float64?
    
    var ResponseTime: Float64?
    
    var dataType: String?
    
    var detailLevel: Int?
    
    var items: [[String: Any]]?
    
    var parentDataType: String?
    
    var properties: [String: [String: Any]]?

    var timeStamp: Date?
    
    var versionInfo: ETDeviceXMLItemVersionInfo?
    
    
    var parsingInputKey: Bool = false
//    var parsingName: String?
    var parsingKey: String?
    var parsingValue: Bool = false
    var parsingInputDictItem: Bool = false
    var parsingInputSubKey: String?
    var parsingInputSubValue: Bool = false
    
//    var parsingProperties
}
