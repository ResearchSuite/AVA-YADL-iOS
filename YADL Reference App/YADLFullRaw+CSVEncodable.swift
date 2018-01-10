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

extension YADLFullRaw: CSVEncodable {
    
    
    open static var typeString: String {
        
        let yadlIdentifier = "YADLFull"
        return yadlIdentifier
        
    }
    
    open static var header: String {
        
        let yadlHeader = ["timestamp","BedToChair","Dressing","Housework","Lifting","Shopping","ShortWalk","WalkingUpStairs"]
        
        let header = yadlHeader.joined(separator:",")
        
        return header
    }
    
    open func toRecords() -> [CSVRecord] {
        
        let time = self.stringFromDate(self.creationDateTime)
        let flatRecord = (self.resultMap.flatMap({ (key, value) -> String in
                return "\(value)"
            }) as Array).joined(separator: ",")
        
        let completeRecord = time + "," + flatRecord
               
        return [completeRecord]
        
    }
    
}
