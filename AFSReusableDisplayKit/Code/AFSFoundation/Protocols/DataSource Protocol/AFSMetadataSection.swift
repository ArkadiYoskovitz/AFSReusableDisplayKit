//
//  AFSMetadataSection.swift
//  AFSReusableDisplayKit
//
//  Created by Arkadi Yoskovitz on 11/24/18.
//  Copyright © 2018 Arkadi Yoskovitz. All rights reserved.
//
import Foundation
///
/// An instance conforming to `AFSMetadataSection` represents a section of items.
///
public protocol AFSMetadataSection : AFSCollection
{    
    // MARK: - Associated types
    
    ///
    /// The type of elements stored in the section.
    ///
    associatedtype Header
    ///
    /// The type of elements stored in the section.
    ///
    associatedtype Item
    ///
    /// The type of elements stored in the section.
    ///
    associatedtype Footer
    
    // MARK: - Properties
    
    ///
    /// The header metadata for the section.
    ///
    var headerMetadata : Header? { get }
    
    ///
    /// The elements in the section.
    ///
    var  itemsMetadata : [Item]  { get set }
    
    ///
    /// The footer metadata for the section.
    ///
    var footerMetadata : Footer? { get }
    
    // MARK: -
    
    ///
    /// The header title for the section.
    ///
    var headerTitle : String? { get }
    
    ///
    /// The footer title for the section.
    ///
    var footerTitle : String? { get }
    
    // MARK: -
}
///
/// MARK: - Default Implementation
///
extension AFSMetadataSection
{
    public var isEmpty : Bool
    {
        return count == 0
    }
    
    public var   count : Int
    {
        return itemsMetadata.count
    }    
}
///
///
///
extension AFSMetadataSection where Self.Header : AFSTitleable
{
    public var headerTitle : String?
    {
        return headerMetadata?.title
    }
}
///
///
///
extension AFSMetadataSection where Self.Footer : AFSTitleable
{
    public var footerTitle : String?
    {
        return footerMetadata?.title
    }
}
