//
//  AFSReusableElementsConfigurator.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/13/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

public class AFSReusableElementsConfigurator : AFSReusableElementsConfiguratorProtocol
{
    // MARK: - Enum Types
    
    // MARK: - Struct Types
    
    // MARK: - Stored Properties
    fileprivate(set) var           displayType : AFSReusableDisplayKit.DisplayType
    fileprivate(set) var elementsRegistrations : [AFSElementMetadata]
    fileprivate(set) var elementsConfigurators : [String:AFSElementConfiguration]
    
    // MARK: - Subscript
    public subscript(element: AFSReusableDisplayKit.ReusableElementKinds, reusable: AFSReusableDisplayKit.ReusableElementTypes, identifier: String) -> AFSElementConfiguration? {
        get { return elementsConfigurators["\(element.description)-\(reusable.content)-\(identifier)"]     }
        set { elementsConfigurators["\(element.description)-\(reusable.content)-\(identifier)"] = newValue }
    }
    
    // MARK: - Initialization
    public init(displayType type: AFSReusableDisplayKit.DisplayType)
    {
        
        self.displayType           = type
        self.elementsRegistrations = [AFSElementMetadata]()
        self.elementsConfigurators = [String:AFSElementConfiguration]()
        self.elementsRegistrations.reserveCapacity(10)
        self.elementsConfigurators.reserveCapacity(10)
    }
    
    // MARK: - Registrations
    public func   register(element reuseableElement: AFSElementMetadata)
    {
        elementsRegistrations.append(reuseableElement)
    }
    public func unregister(element reuseableElement: AFSElementMetadata)
    {
        let reuseable = reuseableElement
        let elements  = elementsRegistrations.filter {
            
            var value : Bool
            switch reuseable.elementKind.isEmpty {
            case true : value = reuseable.identifier != $0.identifier && reuseable.elementType != $0.elementType && reuseable.method != $0.method
            case false:
                value = reuseable.identifier != $0.identifier && reuseable.elementType != $0.elementType && reuseable.method != $0.method && reuseable.elementKind != $0.elementKind
            }
            return value
        }
        elementsRegistrations.removeAll(keepingCapacity: true)
        elementsRegistrations.append(contentsOf: elements)
    }
    
    public func clearRegisteration()
    {
        elementsRegistrations.removeAll(keepingCapacity: true)
        elementsConfigurators.removeAll(keepingCapacity: true)
        elementsRegistrations.reserveCapacity(10)
        elementsConfigurators.reserveCapacity(10)
    }
}
