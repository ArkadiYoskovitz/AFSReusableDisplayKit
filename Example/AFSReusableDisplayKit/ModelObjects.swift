//
//  ModelObjects.swift
//  AFSReusableDisplayKit_Example
//
//  Created by Arkadi Yoskovitz on 3/30/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import AFSReusableDisplayKit
///
///
///
class TestHeader : NSObject, AFSMetadataSectionHeader , AFSTitleable {
    var title: String?
}
///
///
///
class TestItem   : NSObject, AFSMetadataSectionItem {
    var displayDescription : String = "get"
}
///
///
///
class TestFooter : NSObject, AFSMetadataSectionFooter , AFSTitleable {
    var title: String?
}
