////
////  YADLSpotRaw+CSVEncodable.swift
////  YADL-Reference-App
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
    
    open var yadlHeader : [String] {
        
        let yadlHeader = ["timestamp","BedToChair","Dressing","Housework","Lifting","Shopping","ShortWalk","WalkingUpStairs"]
        
        return yadlHeader
    }
    
    open static var header: String {
        
        let yadlHeader = ["timestamp","BedToChair","Dressing","Housework","Lifting","Shopping","ShortWalk","WalkingUpStairs"]
        
        let header = yadlHeader.joined(separator:",")
        
        return header
    }
    
    open func toRecords() -> [CSVRecord] {
        
        let time = self.stringFromDate(self.creationDateTime)
        var record = ""
        
        for each in self.yadlHeader {
            
            if self.selected.contains(each){
                record = record + "selected,"
            }
            
            if self.notSelected.contains(each){
                record = record + "not selected,"
            }
            
            if self.excluded.contains(each){
                record = record + "excluded,"
            }
            
        }
                
        let completeRecord = time + "," + record
                
        return [completeRecord]
        
    }
    
}
