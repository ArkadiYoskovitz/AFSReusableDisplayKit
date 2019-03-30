//
//  AFSScrollLogicHandlersStructs.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/20/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//
import UIKit
///
///
///
// =====================================================================================================================
@available(iOS 2.0, *)
public struct AFSScrollDelegateDidScroll<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersDelegateDidScroll<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersDelegateDidScroll<DataSource>)
    {
        run = block
    }
}

@available(iOS 3.2, *)
public struct AFSScrollDelegateDidZoom<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersDelegateDidZoom<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersDelegateDidZoom<DataSource>)
    {
        run = block
    }
}

@available(iOS 2.0, *)
public struct AFSScrollDelegateWillBeginDragging<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersDelegateWillBeginDragging<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersDelegateWillBeginDragging<DataSource>)
    {
        run = block
    }
}

@available(iOS 5.0, *)
public struct AFSScrollDelegateWillEndDragging<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersDelegateWillEndDragging<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersDelegateWillEndDragging<DataSource>)
    {
        run = block
    }
}

@available(iOS 2.0, *)
public struct AFSScrollDelegateDidEndDragging<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersDelegateDidEndDragging<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersDelegateDidEndDragging<DataSource>)
    {
        run = block
    }
}

@available(iOS 2.0, *)
public struct AFSScrollDelegateWillBeginDecelerating<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersDelegateWillBeginDecelerating<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersDelegateWillBeginDecelerating<DataSource>)
    {
        run = block
    }
}

@available(iOS 2.0, *)
public struct AFSScrollDelegateDidEndDecelerating<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersDelegateDidEndDecelerating<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersDelegateDidEndDecelerating<DataSource>)
    {
        run = block
    }
}

@available(iOS 2.0, *)
public struct AFSScrollDelegateDidEndScrollingAnimation<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersDelegateDidEndScrollingAnimation<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersDelegateDidEndScrollingAnimation<DataSource>)
    {
        run = block
    }
}

@available(iOS 2.0, *)
public struct AFSScrollDelegateViewForZooming<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersDelegateViewForZooming<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersDelegateViewForZooming<DataSource>)
    {
        run = block
    }
}

@available(iOS 3.2, *)
public struct AFSScrollDelegateWillBeginZooming<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersDelegateWillBeginZooming<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersDelegateWillBeginZooming<DataSource>)
    {
        run = block
    }
}

@available(iOS 2.0, *)
public struct AFSScrollDelegateDidEndZooming<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersDelegateDidEndZooming<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersDelegateDidEndZooming<DataSource>)
    {
        run = block
    }
}

@available(iOS 2.0, *)
public struct AFSScrollDelegateShouldScrollToTop<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersDelegateShouldScrollToTop<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersDelegateShouldScrollToTop<DataSource>)
    {
        run = block
    }
}

@available(iOS 2.0, *)
public struct AFSScrollDelegateDidScrollToTop<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersDelegateDidScrollToTop<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersDelegateDidScrollToTop<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSScrollDelegateDidChangeAdjustedContentInset<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersDelegateDidChangeAdjustedContentInset<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersDelegateDidChangeAdjustedContentInset<DataSource>)
    {
        run = block
    }
}
///
///
///
/// ================================================================================================================ ///
@available(iOS 2.0, *)
public struct AFSScrollAccessibilityDelegateScrollStatus<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersAccessibilityDelegateScrollStatus<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersAccessibilityDelegateScrollStatus<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSScrollAccessibilityDelegateAttributedScrollStatus<DataSource:AFSMetadataDataSource>
{
    public let run : AFSScrollHandlersAccessibilityDelegateAttributedScrollStatus<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSScrollHandlersAccessibilityDelegateAttributedScrollStatus<DataSource>)
    {
        run = block
    }
}
