//
//  ETDevice.swift
//  EnvironmentsTool
//
//  Created by LinJia on 2019/10/22.
//  Copyright © 2019 lin. All rights reserved.
//

import Foundation

class ETDevice: NSObject {
    static var main: ETDevice = ETDevice()
    
    private var source: XMLDocument?
    
    var machineName: String = "" // 机器
    var machineModel: String = "" { // 型号
        didSet {
            switch machineModel {
            case "MacBookPro15,4":
                self.machineModelName = "MacBook Pro (13 英寸，2019 年，两个雷雳 3 端口)"
            case "MacBookPro15,1", "MacBookPro15,3":
                self.machineModelName = "MacBook Pro (15 英寸，2019 年)"
            case "MacBookPro15,2":
                self.machineModelName = "MacBook Pro (13 英寸，2019 年，四个雷雳 3 端口)"
            case "MacBookPro15,1":
                self.machineModelName = "MacBook Pro（15 英寸，2018 年）"
            case "MacBookPro15,2":
                self.machineModelName = "MacBook Pro（13 英寸，2018 年，四个雷雳 3 端口）"
            case "MacBookPro14,3":
                self.machineModelName = "MacBook Pro（15 英寸，2017 年）"
            case "MacBookPro14,2":
                self.machineModelName = "MacBook Pro（13 英寸，2017 年，四个雷雳 3 端口）"
            case "MacBookPro14,1":
                self.machineModelName = "MacBook Pro（13 英寸，2017 年，两个雷雳 3 端口）"
            case "MacBookPro13,3":
                self.machineModelName = "MacBook Pro（15 英寸，2016 年）"
            case "MacBookPro13,2":
                self.machineModelName = "MacBook Pro（13 英寸，2016 年，四个雷雳 3 端口）"
            case "MacBookPro13,1":
                self.machineModelName = "MacBook Pro（13 英寸，2016 年，两个雷雳 3 端口）"
            case "MacBookPro11,4":
                self.machineModelName = "MacBook Pro（视网膜显示屏，15 英寸，2015 年中）"
            case "MacBookPro11,5":
                self.machineModelName = "MacBook Pro（视网膜显示屏，15 英寸，2015 年中）"
            case "MacBookPro12,1":
                self.machineModelName = "MacBook Pro（视网膜显示屏，13 英寸，2015 年初）"
            case "MacBookPro11,2":
                self.machineModelName = "MacBook Pro（视网膜显示屏，15 英寸，2014 年中）"
            case "MacBookPro11,3":
                self.machineModelName = "MacBook Pro（视网膜显示屏，15 英寸，2014 年中）"
            case "MacBookPro11,1":
                self.machineModelName = "MacBook Pro（视网膜显示屏，13 英寸，2014 年中）"
            case "MacBookPro11,2":
                self.machineModelName = "MacBook Pro（视网膜显示屏，15 英寸，2013 年末）"
            case "MacBookPro11,3":
                self.machineModelName = "MacBook Pro（视网膜显示屏，15 英寸，2013 年末）"
            case "MacBookPro10,1":
                self.machineModelName = "MacBook Pro（视网膜显示屏，15 英寸，2013 年初）"
            case "MacBookPro11,1":
                self.machineModelName = "MacBook Pro（视网膜显示屏，13 英寸，2013 年末）"
            case "MacBookPro10,2":
                self.machineModelName = "MacBook Pro（视网膜显示屏，13 英寸，2013 年初）"
            case "MacBookPro10,1":
                self.machineModelName = "MacBook Pro（视网膜显示屏，15 英寸，2012 年中）"
            case "MacBookPro9,1":
                self.machineModelName = "MacBook Pro（15 英寸，2012 年中）"
            case "MacBookPro10,2":
                self.machineModelName = "MacBook Pro（视网膜显示屏，13 英寸，2012 年末）"
            case "MacBookPro9,2":
                self.machineModelName = "MacBook Pro（13 英寸，2012 年中）"
            case "MacBookPro8,3":
                self.machineModelName = "MacBook Pro（17 英寸，2011 年末）"
            case "MacBookPro8,3":
                self.machineModelName = "MacBook Pro（17 英寸，2011 年初）"
            case "MacBookPro8,2":
                self.machineModelName = "MacBook Pro（15 英寸，2011 年末）"
            case "MacBookPro8,2":
                self.machineModelName = "MacBook Pro（15 英寸，2011 年初）"
            case "MacBookPro8,1":
                self.machineModelName = "MacBook Pro（13 英寸，2011 年末）"
            case "MacBookPro8,1":
                self.machineModelName = "MacBook Pro（13 英寸，2011 年初）"
            case "MacBookPro6,1":
                self.machineModelName = "MacBook Pro（17 英寸，2010 年中）"
            case "MacBookPro6,2":
                self.machineModelName = "MacBook Pro（15 英寸，2010 年中）"
            case "MacBookPro7,1":
                self.machineModelName = "MacBook Pro（13 英寸，2010 年中）"
            case "MacBookPro5,2":
                self.machineModelName = "MacBook Pro（17 英寸，2009 年中）"
            case "MacBookPro5,2":
                self.machineModelName = "MacBook Pro（17 英寸，2009 年初）"
            case "MacBookPro5,3":
                self.machineModelName = "MacBook Pro（15 英寸，2009 年中）"
            case "MacBookPro5,3":
                self.machineModelName = "MacBook Pro（15 英寸，2.53 GHz，2009 年中）"
            case "MacBookPro5,5":
                self.machineModelName = "MacBook Pro（13 英寸，2009 年中）"
            case "MacBookPro5,1":
                self.machineModelName = "MacBook Pro（15 英寸，2008 年末）"
            case "MacBookPro4,1":
                self.machineModelName = "MacBook Pro（17 英寸，2008 年初）"
            case "MacBookPro4,1":
                self.machineModelName = "MacBook Pro（15 英寸，2008 年初）"
//            case "":
//            self.machineModelName = ""
//            case "":
//            self.machineModelName = ""
            default:
                break
            }
        }
    }
    var machineModelName: String = "未知型号"
    
    var cpuType: String = "" // cpu型号
    var currentProcessorSpeed: String = "" //
    var physicalMemory: String = "" // 物理内存
    var numberProcessors: Int = 0 // CPU核数
    var mac: String = ""
    var name: String = ""
    var uuid: String = ""
    var id: String = ""
    var osVersion: String = ""
    
    override init() {
        super.init()
        
        let task = Process()
        let outputPipe = Pipe()

        task.launchPath = "/usr/sbin/system_profiler"
        task.arguments = ["-xml", "-detailLevel", "mini"]
        task.standardOutput = outputPipe
        task.launch()
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()

        let output = NSString(data: outputData, encoding: String.Encoding.utf8.rawValue)! as String
//        print("output", output)
        
        let tempDocument = try! XMLDocument(xmlString: output)
//        print("tempDocument.childCount", tempDocument.childCount)
        
        if tempDocument.childCount == 1 {
            let tempRootNode = tempDocument.children![0]
//            print("tempRootNode.childCount", tempRootNode.childCount)
            if tempRootNode.childCount == 1 {
                let tempRootListNode = tempRootNode.children![0]
//                print("tempRootListNode.childCount", tempRootListNode.childCount)
                if tempRootListNode.childCount > 0 {
                    for tempDictItem in tempRootListNode.children! {
//                        print("tempDictItem.childCount", tempDictItem.childCount)
                        if tempDictItem.childCount > 0 {
                            for tempDictSubItem in tempDictItem.children! {
                                if tempDictSubItem.name == "key" && tempDictSubItem.stringValue == "_items" {
                                    if let tempDictSubItem_items = tempDictSubItem.nextSibling, tempDictSubItem_items.childCount > 0 {
//                                        print("tempDictSubItem_items.childCount", tempDictSubItem_items.childCount)
                                        for tempDictSubItem_items_item in tempDictSubItem_items.children! {
                                            if tempDictSubItem_items_item.name == "dict" && tempDictSubItem_items_item.childCount > 0 {
//                                                print("tempDictSubItem_items_item.childCount", tempDictSubItem_items_item.childCount)
                                                for tempDictSubItem_items_item_node in tempDictSubItem_items_item.children! {
                                                    // 机器
                                                    if tempDictSubItem_items_item_node.name == "key" && tempDictSubItem_items_item_node.stringValue == "machine_model" {
                                                        if let tempMachineModel_node = tempDictSubItem_items_item_node.nextSibling {
                                                            self.machineModel = tempMachineModel_node.stringValue ?? ""
                                                        }
                                                    }
                                                    
                                                    // 机型
                                                    if tempDictSubItem_items_item_node.name == "key" && tempDictSubItem_items_item_node.stringValue == "machine_name" {
                                                        if let tempMachineName_node = tempDictSubItem_items_item_node.nextSibling {
                                                            self.machineName = tempMachineName_node.stringValue ?? ""
                                                        }
                                                    }
                                                    
                                                    // 物理内存
                                                    if tempDictSubItem_items_item_node.name == "key" && tempDictSubItem_items_item_node.stringValue == "physical_memory" {
                                                        if let tempPhysicalMemory_node = tempDictSubItem_items_item_node.nextSibling {
                                                            self.physicalMemory = tempPhysicalMemory_node.stringValue ?? ""
                                                        }
                                                    }
                                                    
                                                    // CPU型号
                                                    if tempDictSubItem_items_item_node.name == "key" && tempDictSubItem_items_item_node.stringValue == "cpu_type" {
                                                        if let tempCpuType_node = tempDictSubItem_items_item_node.nextSibling {
                                                            self.cpuType = tempCpuType_node.stringValue ?? ""
                                                        }
                                                    }
                                                    
                                                    // CPU主频
                                                    if tempDictSubItem_items_item_node.name == "key" && tempDictSubItem_items_item_node.stringValue == "current_processor_speed" {
                                                        if let tempCurrentProcessorSpeed_node = tempDictSubItem_items_item_node.nextSibling {
                                                            self.currentProcessorSpeed = tempCurrentProcessorSpeed_node.stringValue ?? ""
                                                        }
                                                    }
                                                    
                                                    // CPU核数
                                                    if tempDictSubItem_items_item_node.name == "key" && tempDictSubItem_items_item_node.stringValue == "number_processors" {
                                                        if let tempNumberProcessors_node = tempDictSubItem_items_item_node.nextSibling {
                                                            self.numberProcessors = Int(tempNumberProcessors_node.stringValue ?? "0")!
                                                        }
                                                    }
                                                    
                                                    // UUID
                                                    if tempDictSubItem_items_item_node.name == "key" && tempDictSubItem_items_item_node.stringValue == "domain_uuid_key" {
                                                        if let tempUUID_node = tempDictSubItem_items_item_node.nextSibling {
                                                            self.uuid = tempUUID_node.stringValue ?? ""
                                                        }
                                                    }
                                                    
                                                    // osVersion
                                                    if tempDictSubItem_items_item_node.name == "key" && tempDictSubItem_items_item_node.stringValue == "os_version" {
                                                        if let tempOSVersion_node = tempDictSubItem_items_item_node.nextSibling {
                                                            self.osVersion = tempOSVersion_node.stringValue ?? ""
                                                        }
                                                    }
                                                    
                                                    // mac
//                                                    if tempDictSubItem_items_item_node.name == "key" && tempDictSubItem_items_item_node.stringValue == "spairport_airport_interfaces" {
//                                                        if let temp_spairport_airport_interfaces_node = tempDictSubItem_items_item_node.nextSibling, temp_spairport_airport_interfaces_node.childCount > 0 {
//                                                            for temp_spairport_airport_interfaces_node_sub in temp_spairport_airport_interfaces_node.children! {
//                                                                if temp_spairport_airport_interfaces_node_sub.childCount > 0 {
//                                                                    for temp_spairport_airport_interfaces_node_sub_sub in temp_spairport_airport_interfaces_node_sub.children! {
//                                                                        if temp_spairport_airport_interfaces_node_sub_sub.name == "key" && temp_spairport_airport_interfaces_node_sub_sub.stringValue == "spairport_wireless_mac_address" {
//                                                                            if let temp_spairport_airport_interfaces_node_sub_sub_next = temp_spairport_airport_interfaces_node_sub_sub.nextSibling {
//                                                                                self.mac = temp_spairport_airport_interfaces_node_sub_sub_next.stringValue ?? ""
//                                                                            }
//                                                                        }
//                                                                    }
//                                                                }
//                                                            }
//                                                        }
//                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        self.source = tempDocument
        
        self.name = Host.current().localizedName ?? ""
        
        print("机器", self.machineName)
        print("型号", self.machineModel)
        print("型号名", self.machineModelName)
        print("CPU型号", self.cpuType)
        print("CPU主频", self.currentProcessorSpeed)
        print("物理内存", self.physicalMemory)
        print("CPU核数", self.numberProcessors)
        print("MAC地址", self.mac)
        print("Mac名称", self.name)
        print("UUID", self.uuid)
        print("ID", self.id)
        print("系统版本", self.osVersion)
        
//        let system_task = Process()
//        let system_outputPipe = Pipe()
//
//        system_task.launchPath = "/System/Library/CoreServices/SystemVersion.plist"
////        system_task.arguments = ["-xml", "-detailLevel", "mini"]
//        system_task.standardOutput = system_outputPipe
//        system_task.launch()
//        let system_outputData = system_outputPipe.fileHandleForReading.readDataToEndOfFile()
//
//        let system_output = NSString(data: system_outputData, encoding: String.Encoding.utf8.rawValue)! as String
//        print("system_output", system_output)
        
        let tempPList = NSDictionary(contentsOfFile: "/System/Library/CoreServices/SystemVersion.plist")
        print("tempPList", tempPList)
        
        var result: String? = ""
        var len: size_t = 0
        sysctlbyname("hw.model", nil, &len, nil, 0)
        if len >= 0 {
            var tempData = NSMutableData(length: len)
            sysctlbyname("hw.model", tempData?.mutableBytes, &len, nil, 0)
            result = NSString(bytes: tempData!.bytes, length: len, encoding: String.Encoding.utf8.rawValue) as! String
        }
        
        print("result", result)
    }
}
