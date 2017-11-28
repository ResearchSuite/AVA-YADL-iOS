//
//  YADLFullRaw.swift
//  Pods
//
//  Created by James Kizer on 4/2/17.
//
//

import UIKit
import ResearchKit
import ResearchSuiteResultsProcessor
import Gloss

open class YADLFullRaw: RSRPIntermediateResult, RSRPFrontEndTransformer {
    static open let kType = "YADLFullRaw"
    static open let skipped = "skipped"
    
    fileprivate static let supportedTypes = [
        kType
    ]
    
    open static func supportsType(type: String) -> Bool {
        return supportedTypes.contains(type)
    }
    
    open static func transform(
        taskIdentifier: String,
        taskRunUUID: UUID,
        parameters: [String: AnyObject]
        ) -> RSRPIntermediateResult? {
        
        
        guard let schemaID = parameters["schemaID"] as? JSON else {
                return nil
        }
        
        let results: [(String, String)] = parameters.flatMap { (pair) -> (String, String)? in
            guard let stepResult = pair.value as? ORKStepResult,
                let choiceResult = stepResult.firstResult as? ORKChoiceQuestionResult,
                let answer = choiceResult.choiceAnswers?.first as? String,
                let identifier = stepResult.identifier.components(separatedBy: ".").last else {
                    return nil
            }
          
            return (identifier, answer)
        }
        
        var resultMap: [String: String] = [:]
        results.forEach { (pair) in
            resultMap[pair.0] = pair.1
        }
        
        var skippedMap: [String: Bool] = [:]
        for (keyParam,_) in parameters {
            if keyParam != "schemaID"{
                for (keyResult,_) in resultMap {
                    if keyParam == keyResult {
                        skippedMap[keyParam] = false
                        break
                    }
                    else {
                        skippedMap[keyParam] = true
                    }
                }
            }
        }
        
        for (key,value) in skippedMap {
            if value == true {
                resultMap[key] = "skipped"
            }
            
        }
            
        
        
        return YADLFullRaw(
            uuid: UUID(),
            taskIdentifier: taskIdentifier,
            taskRunUUID: taskRunUUID,
            schemaID: schemaID,
            resultMap: resultMap
        )
    }
    
    open let resultMap: [String: String]
    open let schemaID: JSON
    
    public init?(
        uuid: UUID,
        taskIdentifier: String,
        taskRunUUID: UUID,
        schemaID: JSON,
        resultMap: [String: String]
        ) {
        
        self.schemaID = schemaID
        self.resultMap = resultMap
        
        super.init(
            type: YADLFullRaw.kType,
            uuid: uuid,
            taskIdentifier: taskIdentifier,
            taskRunUUID: taskRunUUID
        )
    }
}
