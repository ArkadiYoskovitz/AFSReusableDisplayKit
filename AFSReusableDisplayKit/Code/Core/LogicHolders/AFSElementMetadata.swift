//
//  AFSElementMetadata.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/13/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

public struct AFSElementMetadata
{    
    // MARK: - Stored Properties
    public let identifier  : String
    public let elementType : AFSReusableDisplayKit.ReusableElementKinds
    public let elementKind : String
    public let method      : AFSReusableDisplayKit.RegistrationMethod
    
    // MARK: - Initialization
    public init(reuseIdentifier: String,
                elementType: AFSReusableDisplayKit.ReusableElementKinds,
                reuseableElementKind kind: String = String(),
                registrationMethod: AFSReusableDisplayKit.RegistrationMethod)
    {
        self.identifier  = reuseIdentifier
        self.elementType = elementType
        self.elementKind = kind
        self.method      = registrationMethod
    }
}
