//
//  DataSourceClass.swift
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
public final class DataSourceClass<Section>: AFSMetadataDataSource
    where
    Section : AFSMetadataSection,
    Section.Header : AFSMetadataSectionHeader,
    Section.Header : AFSTitleable,
    Section.Item   : AFSMetadataSectionItem ,
    Section.Footer : AFSMetadataSectionFooter,
    Section.Footer : AFSTitleable
{
    
    public func set(_ newItem: Section.Item?, atRow row: Int, inSection section: Int) {
        
    }
    
    public func item(atRow row: Int, inSection section: Int) -> Section.Item? {
        return TestItem.init() as? Section.Item
    }
    
    public func numberOfSections() -> Int {
        return 2
    }
    
    public func numberOfItems(inSection section: Int) -> Int {
        return 50
    }
    
    public func items(inSection section: Int) -> [Section.Item]? {
        return nil
    }
    
    public func headerMetadata(inSection section: Int) -> Section.Header? {
        return nil
    }
    
    public func footerMetadata(inSection section: Int) -> Section.Footer? {
        return nil
    }
}
