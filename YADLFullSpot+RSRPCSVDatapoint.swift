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

extension YADLSpotRaw: RSRPCSVDatapointBuilder {
    
    open var identifier: String {
        return self.taskIdentifier
    }
    
    open var dataPointID: String {
        return self.uuid.uuidString
    }
    
    open var creationDateTime: Date {
        return self.startDate ?? Date()
    }
    
    open var headerDict: String {
        
        var dict: [String:Any] = [
            "id": self.dataPointID,
            "creation_date_time": self.stringFromDate(self.creationDateTime),
            "schema_id": self.schemaDict,
            "taskIdentifier": self.taskIdentifier,
            "taskRunUUID": self.taskRunUUID.uuidString
        ]
        
        var header = ""
        
        for each in self.selected {
            header = header + each + ","
        }
        for each in self.notSelected {
            header = header + each + ","
        }
        for each in self.excluded {
            header = header + each + ","
        }
        
        let completeHeader = "timestamp," + header
        
        return completeHeader
        
        
    }
    
    
    
    
    open var header: String {
        
        return self.headerDict
    }
    
    open var records: [String] {
        
        let time = self.stringFromDate(self.creationDateTime)
        var record = ""
        
        let selectedCount = self.selected.count
        let notSelectedCount = self.notSelected.count
        let excludedCount = self.excluded.count
        
        for _ in 0 ..< selectedCount {
            record = record + "selected,"
        }
        for _ in 0 ..< notSelectedCount {
            record = record + "not selected,"
        }
        
        for _ in 0 ..< excludedCount {
            record = record + "excluded,"
        }
        
        let completeRecord = time + "," + record
        
        return [completeRecord]
        
    }
    
    
    
    
    
    
    
    
    
}
