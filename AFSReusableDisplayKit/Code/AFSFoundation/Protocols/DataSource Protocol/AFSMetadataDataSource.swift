//
//  AFSMetadataDataSource.swift
//  AFSReusableDisplayKit
//
//  Created by Arkadi Yoskovitz on 11/24/18.
//  Copyright © 2018 Arkadi Yoskovitz. All rights reserved.
//
import Foundation
///
/// An instance conforming to `AFSMetadataDataSource` represents a data source of items to be displayed
/// in either a collection view or table view.
///
public protocol AFSMetadataDataSource : AFSCollection
{
    // MARK: Associated types
    
    /// The type of items in the data source.
    associatedtype Section : AFSMetadataSection
    
    // MARK: - Methods
    
    ///
    /// - Returns: The number of sections.
    ///
    func numberOfSections() -> Int
    
    ///
    /// - Parameters:
    ///     - section: A section in the data source.
    ///
    /// - returns: The number of items in the specified section.
    ///
    func numberOfItems(inSection section: Int) -> Int
    
    ///
    /// Returns an arry of items contained in a given sections
    ///
    /// - Parameters:
    ///     - section: A section in the data source.
    ///
    /// - returns: The items in the specified section.
    ///
    func items(inSection section: Int) -> [Section.Item]?
    
    ///
    /// - Parameters:
    ///     - row:     A row in the data source.
    ///     - section: A section in the data source.
    ///
    /// - returns: The item specified by the section and row, or `nil`.
    ///
    func item(atRow row: Int, inSection section: Int) -> Section.Item?
    
    ///
    /// - Parameters:
    ///     - newItem: The item specified by the section and row, or `nil`.
    ///     - row    : A row     in the data source.
    ///     - section: A section in the data source.
    ///
    mutating func set(_ newItem: Section.Item?, atRow row: Int, inSection section: Int)
    
    // MARK: -
    
    ///
    /// - Parameters:
    ///     - section: A section in the data source.
    ///
    /// - returns: The header title for the specified section.
    ///
    func headerMetadata(inSection section: Int) -> Section.Header?
    
    ///
    /// - Parameters:
    ///     - section: A section in the data source.
    ///
    /// - returns: The footer title for the specified section.
    ///
    func footerMetadata(inSection section: Int) -> Section.Footer?
    
    
    // MARK: -
    ///
    /// - Parameters:
    ///     - section: A section in the data source.
    ///
    /// - returns: The header title for the specified section.
    ///
    func headerTitle(inSection section: Int) -> String?
    
    ///
    /// - Parameters:
    ///    - section: A section in the data source.
    ///
    /// - returns: The footer title for the specified section.
    ///
    func footerTitle(inSection section: Int) -> String?
}
///
/// MARK: - Default Implementation
///
extension AFSMetadataDataSource
{
    ///
    /// - Parameters:
    ///    - indexPath: An index path specifying a row and section in the data source.
    ///
    /// - returns: The item specified by indexPath, or `nil`.
    ///
    public func item(at indexPath: IndexPath) -> Section.Item?
    {
        return item(atRow: indexPath.item, inSection: indexPath.section)
    }
    
    ///
    /// - Parameters:
    ///    - newItem  : The item specified by the section and row, or `nil`.
    ///    - indexPath: An index path specifying a row and section in the data source.
    ///
    public mutating func set(_ newItem: Section.Item?, at indexPath: IndexPath)
    {
        set(newItem, atRow: indexPath.row, inSection: indexPath.section)
    }
}
///
/// MARK: - AFSMetadataCollection
///
extension AFSMetadataDataSource
{
    public var isEmpty : Bool
    {
        return count == 0
    }
    
    public var   count : Int
    {
        var itemsCount = 0
        for sectionIndex in 0 ..< numberOfSections() {
            itemsCount += numberOfItems(inSection: sectionIndex)
        }
        return itemsCount
    }
}
///
///
///
extension AFSMetadataDataSource where Self.Section.Header : AFSTitleable
{
    public func headerTitle(inSection section: Int) -> String?
    {
        return headerMetadata(inSection: section)?.title
    }
}
///
///
///
extension AFSMetadataDataSource where Self.Section.Footer : AFSTitleable
{
    public func footerTitle(inSection section: Int) -> String?
    {    
        return footerMetadata(inSection: section)?.title
    }
}
