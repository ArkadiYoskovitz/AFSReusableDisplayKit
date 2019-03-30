//
//  AFSCollection.swift
//  AFSReusableDisplayKit
//
//  Created by Arkadi Yoskovitz on 11/24/18.
//  Copyright © 2018 Arkadi Yoskovitz. All rights reserved.
//

import Foundation

public protocol AFSCollection {
    
    ///
    /// A Boolean value indicating whether the collection is empty.
    ///
    var isEmpty : Bool { get }
    
    ///
    /// The number of elements in the section.
    ///
    /// To check whether a collection is empty, use its `isEmpty` property
    /// instead of comparing `count` to zero.
    ///
    var count : Int { get }
}
