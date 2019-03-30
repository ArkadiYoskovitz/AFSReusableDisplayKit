//
//  AFSController.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 3/14/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import Foundation
///
///
///
open class AFSController : NSObject
{
    // MARK: - Typealias
    // MARK: - Enum Types
    // MARK: - Struct Types
    
    // MARK: - Stored Properties
    weak open var delegateProxy : NSObject?
    
    // MARK: - Subscript
    
    // MARK: - Initialization
    public override init()
    {
        super.init()
    }
    
    // MARK: - Object life cycle
    deinit {
        print("\(type(of: self)) was deallocated successfuly")
    }
    
    // MARK: - NSObject override
    open override func responds(to aSelector: Selector!) -> Bool
    {
        guard let input = aSelector     else { return super.responds(to: aSelector) }
        guard let proxy = delegateProxy else { return super.responds(to: aSelector) }
        guard proxy.responds(to: input) else { return super.responds(to: aSelector) }
        return true
    }
    
    open override func conforms(to aProtocol: Protocol) -> Bool
    {
        guard let proxy = delegateProxy     else { return super.conforms(to: aProtocol) }
        guard proxy.conforms(to: aProtocol) else { return super.conforms(to: aProtocol) }
        return true
    }
    
    open override func forwardingTarget(for aSelector: Selector!) -> Any?
    {
        guard let input = aSelector     else { return super.forwardingTarget(for: aSelector) }
        guard let proxy = delegateProxy else { return super.forwardingTarget(for: aSelector) }
        guard proxy.responds(to: input) else { return super.forwardingTarget(for: aSelector) }
        return proxy
    }
    
    open override func doesNotRecognizeSelector(_ aSelector: Selector!)
    {
        super.doesNotRecognizeSelector(aSelector)
    }
}
