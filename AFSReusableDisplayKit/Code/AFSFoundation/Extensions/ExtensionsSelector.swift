//
//  ExtensionsSelector.swift
//  AFSReusableDisplayKit
//
//  Created by Arkadi Yoskovitz on 12/22/18.
//  Copyright © 2018 Arkadi Yoskovitz. All rights reserved.
//

import Foundation
import ObjectiveC

extension Selector {
    
    public func isMember(of aProtocol: Protocol) -> Bool {
        
        if  isMember(of: aProtocol, isRequired: true , isInstance: true ) ||
            isMember(of: aProtocol, isRequired: true , isInstance: false) ||
            isMember(of: aProtocol, isRequired: false, isInstance: true ) ||
            isMember(of: aProtocol, isRequired: false, isInstance: false)
        {
            return true
        }
        return false
    }
    
    private func isMember(of aProtocol: Protocol, isRequired required: Bool, isInstance instance: Bool) -> Bool {
        
        var outCount = UInt32(0)
        guard let descriptions = protocol_copyMethodDescriptionList(aProtocol, required, instance, &outCount) else { return false }
        for itemIndex in 0 ... Int(outCount) {
            
            guard let name = descriptions[itemIndex].name , name == self else { continue }
            descriptions.deallocate()
            return true
        }
        return false
    }
}
