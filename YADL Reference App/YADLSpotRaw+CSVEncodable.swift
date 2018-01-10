////
////  PAMRaw+CSVEncodable.swift
////  PAM-Reference-App
////
////  Created by Christina Tsangouri on 1/5/17.
////  Copyright © 2017 Christina Tsangouri. All rights reserved.
////

import Foundation
import Gloss
import sdlrkx
import ResearchSuiteResultsProcessor

extension YADLSpotRaw: CSVEncodable {
    
    
    open static var typeString: String {
        
        let yadlIdentifier = "YADLSpot"
        return yadlIdentifier
        
    }
    
    open static var header: String {
        
        let yadlHeader = ["timestamp","BedToChair","Dressing","Housework","Lifting","Shopping","ShortWalk","WalkingUpStairs"]
        
        let header = yadlHeader.joined(separator:",")
        
        return header
    }
    
    open func toRecords() -> [CSVRecord] {
        
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
