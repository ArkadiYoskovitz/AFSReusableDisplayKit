//
//  RegistrationMethod.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/13/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//
import UIKit
///
///
///
extension AFSReusableDisplayKit
{
    public enum RegistrationMethod
    {
        case  none
        case  nib   (UINib)
        case `class`(AnyClass)
    }
}
extension AFSReusableDisplayKit.RegistrationMethod : Equatable
{
    public static func == (lhs: AFSReusableDisplayKit.RegistrationMethod, rhs: AFSReusableDisplayKit.RegistrationMethod) -> Bool
    {
        switch (lhs,rhs) {
        case let (.nib  (lhsNib  ),.nib  (rhsNib  )) where lhsNib   == rhsNib  : return true
        case let (.class(lhsClass),.class(rhsClass)) where lhsClass == rhsClass: return true
        default: return false
        }
    }
}
extension AFSReusableDisplayKit.RegistrationMethod : CustomStringConvertible
{
    public var description : String {
        switch self {
        case .none : return "none" .capitalized
        case .nib  : return "nib"  .capitalized
        case .class: return "class".capitalized
        }
    }
}
extension AFSReusableDisplayKit.RegistrationMethod : CustomDebugStringConvertible
{    
    public var debugDescription : String {
        return description
    }
}
