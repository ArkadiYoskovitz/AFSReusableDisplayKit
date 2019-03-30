//
//  AFSReusableDisplayKit.swift
//  AFSReusableDisplayKit
//
//  Created by Arkadi Yoskovitz on 3/28/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//
import Foundation
///
///
///
public final class AFSReusableDisplayKit : NSObject
{
    private override init() {
        super.init()
    }
}
extension AFSReusableDisplayKit {
    public static var version : String {
        guard let infoDictionary = Bundle(for: self).infoDictionary else { return String() }
        return infoDictionary["CFBundleShortVersionString"] as? String ?? String()
    }
}
