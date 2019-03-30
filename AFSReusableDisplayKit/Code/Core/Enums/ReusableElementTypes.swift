//
//  ReusableElementTypes.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/21/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//
import UIKit
///
///
///
extension AFSReusableDisplayKit
{
    public enum DisplayType : Int
    {
        case scroll
        case table
        case collection
        case textField
        case textView
        case pickerView
    }
    public enum ReusableElementKinds : Int
    {
        case cell
        case supplementary
    }
    public enum ReusableElementTypes
    {
        case tableCell(IndexPath)
        case tableHeader(Int)
        case tableFooter(Int)
        case collectionCell(IndexPath)
        case collectionSupplementary(String,Int)
        
        internal var content : String {
            switch self {
            case .tableCell: return "Raw"
            case .tableHeader(let section): return "Header: \(section)"
            case .tableFooter(let section): return "Footer: \(section)"
            case .collectionCell: return "Item"
            case .collectionSupplementary(let kind,_): return "Supplementary: \(kind)"
            }
        }
    }
}
extension AFSReusableDisplayKit.DisplayType : CustomStringConvertible
{
    public var description : String {
        switch self {
        case .scroll    : return "Type: Scroll    "
        case .table     : return "Type: Table     "
        case .collection: return "Type: Collection"
        case .textField : return "Type: TextField "
        case .textView  : return "Type: TextView  "
        case .pickerView: return "Type: PickerView"
        }
    }
}
extension AFSReusableDisplayKit.DisplayType : CustomDebugStringConvertible
{
    public var debugDescription : String {
        return description
    }
}
extension AFSReusableDisplayKit.ReusableElementKinds : CustomStringConvertible
{
    public var description : String {
        switch self {
        case .cell         : return "Type: Cell         "
        case .supplementary: return "Type: Supplementary"
        }
    }
}
extension AFSReusableDisplayKit.ReusableElementKinds : CustomDebugStringConvertible
{
    public var debugDescription : String {
        return description
    }
}
extension AFSReusableDisplayKit.ReusableElementTypes : CustomStringConvertible
{
    public var description : String {
        switch self {
        case .tableCell  : return "Type: Table Cell  "
        case .tableHeader: return "Type: Table Header"
        case .tableFooter: return "Type: Table Footer"
        case .collectionCell         : return "Type: Collection Cell"
        case .collectionSupplementary: return "Type: Collection Supplementary"
        }
    }
}
extension AFSReusableDisplayKit.ReusableElementTypes : CustomDebugStringConvertible
{
    public var debugDescription : String {
        return description
    }
}
