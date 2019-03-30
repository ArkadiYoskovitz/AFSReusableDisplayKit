//
//  AFSReusableElementsConfiguratorProtocol.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/13/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

public protocol AFSReusableElementsConfiguratorProtocol
{
    // MARK: - Types
    
    // MARK: - Subscript
    subscript(element: AFSReusableDisplayKit.ReusableElementKinds, reusable: AFSReusableDisplayKit.ReusableElementTypes, identifier: String) -> AFSElementConfiguration? { get set }
    
    // MARK: - Initialization
    
    // MARK: - Registrations
    func   register(element reuseableElement: AFSElementMetadata)
    func unregister(element reuseableElement: AFSElementMetadata)
    
    func clearRegisteration()
    
    // MARK: - Register Elements
    func   registerElement(of type: AFSReusableDisplayKit.ReusableElementKinds, withReuse identifier: String, via registrationMethod: AFSReusableDisplayKit.RegistrationMethod)
    func unregisterElement(of type: AFSReusableDisplayKit.ReusableElementKinds, withReuse identifier: String, via registrationMethod: AFSReusableDisplayKit.RegistrationMethod)
    
    func   registerElement(of type: AFSReusableDisplayKit.ReusableElementKinds, withReuse identifier: String, elementKind kind: String, via registrationMethod: AFSReusableDisplayKit.RegistrationMethod)
    func unregisterElement(of type: AFSReusableDisplayKit.ReusableElementKinds, withReuse identifier: String, elementKind kind: String, via registrationMethod: AFSReusableDisplayKit.RegistrationMethod)
}
extension AFSReusableElementsConfiguratorProtocol
{
    ///
    ///
    ///
    public func   registerElement(of type: AFSReusableDisplayKit.ReusableElementKinds, withReuse identifier: String, via registrationMethod: AFSReusableDisplayKit.RegistrationMethod)
    {
        registerElement(of: type, withReuse: identifier, elementKind: String(), via: registrationMethod)
    }
    ///
    ///
    ///
    public func unregisterElement(of type: AFSReusableDisplayKit.ReusableElementKinds, withReuse identifier: String, via registrationMethod: AFSReusableDisplayKit.RegistrationMethod)
    {
        unregisterElement(of: type, withReuse: identifier, elementKind: String(), via: registrationMethod)
    }
    ///
    ///
    ///
    public func   registerElement(of type: AFSReusableDisplayKit.ReusableElementKinds, withReuse identifier: String, elementKind kind: String, via registrationMethod: AFSReusableDisplayKit.RegistrationMethod)
    {
        let element = AFSElementMetadata(reuseIdentifier: identifier, elementType: type, reuseableElementKind: kind, registrationMethod: registrationMethod)
        register(element: element)
    }
    ///
    ///
    ///
    public func unregisterElement(of type: AFSReusableDisplayKit.ReusableElementKinds, withReuse identifier: String, elementKind kind: String, via registrationMethod: AFSReusableDisplayKit.RegistrationMethod)
    {
        let element = AFSElementMetadata(reuseIdentifier: identifier, elementType: type, reuseableElementKind: kind, registrationMethod: registrationMethod)
        unregister(element: element)
    }
}
