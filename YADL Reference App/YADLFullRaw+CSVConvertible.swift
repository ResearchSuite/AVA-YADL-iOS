//
//  YADLFullRaw+RSRPCSVDatapoint.swift
//  YADL Reference App
//
//  Created by Christina Tsangouri on 11/14/17.
//  Copyright © 2017 Christina Tsangouri. All rights reserved.
//

import Foundation
import Gloss
import sdlrkx
import ResearchSuiteResultsProcessor

extension YADLFullRaw: CSVConvertible, CSVEncodable {
    
    //let yadlFullRaw = YADLFullRaw(uuid: <#UUID#>)
   
    public static var header: String {
        return self.header
    }

   
    public static var typeString: String {
        
       // let string = yadlFullRaw.taskIdentifier
        
        return "string"
    }

    
    public var typeString:String {
        
        return self.taskIdentifier
    }
    
    
    open var identifier: String {
        return self.taskIdentifier
    }
    
    open var dataPointID: String {
        return self.uuid.uuidString
    }
    
    open var creationDateTime: Date {
        return self.startDate ?? Date()
    }
    
  

    
    open func toRecords() -> [CSVRecord] {
        
        let time = self.stringFromDate(self.creationDateTime)
        
            let flatRecord = (self.resultMap.flatMap({ (key, value) -> String in
                return "\(value)"
            }) as Array).joined(separator: ",")
        
            let completeRecord = time + "," + flatRecord
               
            return [completeRecord]
        
    }
    
    public var header:String {
        
        var dict: [String:Any] = [
            "id": self.dataPointID,
            "creation_date_time": self.stringFromDate(self.creationDateTime),
            "schema_id": self.schemaDict,
            "taskIdentifier": self.taskIdentifier,
            "taskRunUUID": self.taskRunUUID.uuidString
        ]
        
        let header = (self.resultMap.flatMap({ (key, value) -> String in
            return "\(key)"
        }) as Array).joined(separator: ",")
        
        
        let completeHeader = "timestamp," + header
        
        return completeHeader
    }
    
//
//    
// 
//    
//    open var header: String {
//        
//        return self.headerDict
//    }
//    
//    open var records: [String] {
//        
//        let time = self.stringFromDate(self.creationDateTime)
//        
//        let flatRecord = (self.resultMap.flatMap({ (key, value) -> String in
//            return "\(value)"
//        }) as Array).joined(separator: ",")
//        
//        let completeRecord = time + "," + flatRecord
//       
//        return [completeRecord]
//        
//    }
//    
  

    
    
    
    


}
