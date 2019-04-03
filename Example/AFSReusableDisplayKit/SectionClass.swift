//
//  SectionClass.swift
//  AFSReusableDisplayKit_Example
//
//  Created by Arkadi Yoskovitz on 3/28/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//
import Foundation
import AFSReusableDisplayKit
///
/// `AFSSection` is a concrete `AFSMetadataSection` type.
/// A section instance is responsible for managing the elements in a section.
///
public final class SectionClass<Header,Item,Footer> : NSObject , AFSMetadataSection
    where
    Header : AFSMetadataSectionHeader,
    Header : AFSTitleable,
    Item   : AFSMetadataSectionItem  ,
    Footer : AFSMetadataSectionFooter,
    Footer : AFSTitleable
{
    // MARK: - Properties
    
    ///
    /// The header metadata for the section.
    ///
    public var headerMetadata : Header?
    
    ///
    /// The elements in the section.
    ///
    public var itemsMetadata  : [Item]
    
    ///
    /// The footer metadata for the section.
    ///
    public var footerMetadata : Footer?
    
    // MARK: - Initialization
    
    /**
     Constructs a new section.
     
     - parameter items:       The elements in the section.
     - parameter headerTitle: The section header title.
     - parameter footerTitle: The section footer title.
     
     - returns: A new `AFSSection` instance.
     */
    public convenience init(items: Item..., headerMetadata: Header? = nil, footerMetadata: Footer? = nil) {
        self.init(items: items, headerMetadata: headerMetadata, footerMetadata: footerMetadata)
    }
    
    /**
     Constructs a new section.
     
     - parameter  itemsMetadata: The elements in the section.
     - parameter headerMetadata: The section header title.
     - parameter footerMetadata: The section footer title.
     
     - returns: A new `AFSSection` instance.
     */
    public init(items itemsMetadata: [Item], headerMetadata: Header? = nil, footerMetadata: Footer? = nil) {
        self.itemsMetadata  = itemsMetadata
        self.headerMetadata = nil
        self.footerMetadata = nil
    }
    
    // MARK: - Subscripts
    
    /**
     - parameter index: The index of the item to return.
     - returns: The item at `index`.
     */
    public subscript (itemIndex: Int) -> Item {
        get { return itemsMetadata[itemIndex]     }
        set { itemsMetadata[itemIndex] = newValue }
    }
}
