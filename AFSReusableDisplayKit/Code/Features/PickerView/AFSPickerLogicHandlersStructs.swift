//
//  AFSPickerLogicHandlersStructs.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/22/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//
import UIKit
///
///
///
/// ================================================================================================================ ///
@available(iOS 2.0, *)
public struct AFSPickerDataSourceComponentCount<DataSource: AFSMetadataDataSource>
{
    public let run : AFSPickerHandlersDataSourceComponentCount<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSPickerHandlersDataSourceComponentCount<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSPickerDataSourceRowCountInComponent<DataSource: AFSMetadataDataSource>
{
    public let run : AFSPickerHandlersDataSourceRowCountInComponent<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSPickerHandlersDataSourceRowCountInComponent<DataSource>)
    {
        run = block
    }
}
///
///
///
/// ================================================================================================================ ///
@available(iOS 2.0, *)
public struct AFSPickerDelegateComponentWidth<DataSource: AFSMetadataDataSource>
{
    public let run : AFSPickerHandlersDelegateComponentWidth<DataSource>

    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSPickerHandlersDelegateComponentWidth<DataSource>)
    {
        run = block
    }
}

@available(iOS 2.0, *)
public struct AFSPickerDelegateComponentHeight<DataSource: AFSMetadataDataSource>
{
    public let run : AFSPickerHandlersDelegateComponentHeight<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSPickerHandlersDelegateComponentHeight<DataSource>)
    {
        run = block
    }
}

@available(iOS 2.0, *)
public struct AFSPickerDelegateTitleForComponent<DataSource: AFSMetadataDataSource>
{
    public let run : AFSPickerHandlersDelegateTitleForComponent<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSPickerHandlersDelegateTitleForComponent<DataSource>)
    {
        run = block
    }
}

@available(iOS 6.0, *)
public struct AFSPickerDelegateAttributedTitleForComponent<DataSource: AFSMetadataDataSource>
{
    public let run : AFSPickerHandlersDelegateAttributedTitleForComponent<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSPickerHandlersDelegateAttributedTitleForComponent<DataSource>)
    {
        run = block
    }
}

@available(iOS 2.0, *)
public struct AFSPickerDelegateViewForRowForComponent<DataSource: AFSMetadataDataSource>
{
    public let run : AFSPickerHandlersDelegateViewForRowForComponent<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSPickerHandlersDelegateViewForRowForComponent<DataSource>)
    {
        run = block
    }
}

@available(iOS 2.0, *)
public struct AFSPickerDelegateSelectedRowInComponent<DataSource: AFSMetadataDataSource>
{
    public let run : AFSPickerHandlersDelegateSelectedRowInComponent<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSPickerHandlersDelegateSelectedRowInComponent<DataSource>)
    {
        run = block
    }
}
///
///
///
/// ================================================================================================================ ///
@available(iOS 2.0, *)
public struct AFSPickerAccessibilityDelegateString<DataSource: AFSMetadataDataSource>
{
    public let run : AFSPickerHandlersAccessibilityDelegateString<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSPickerHandlersAccessibilityDelegateString<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSPickerAccessibilityDelegateAttributed<DataSource: AFSMetadataDataSource>
{
    public let run : AFSPickerHandlersAccessibilityDelegateAttributed<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSPickerHandlersAccessibilityDelegateAttributed<DataSource>)
    {
        run = block
    }
}
