//
//  DefaultsIdentifier.swift
//  AFSReusableDisplayKit
//
//  Created by Arkadi Yoskovitz on 3/30/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//
import UIKit
///
///
///
extension AFSReusableIdentifier {
    
    static var `default` : AFSReusableIdentifier<DataSource> {
        
        return AFSReusableIdentifier(modelType: DataSource.Section.self, { (type,controller) -> String in
            fatalError("You must override the initial identifierLogic block")
        })
    }
}
