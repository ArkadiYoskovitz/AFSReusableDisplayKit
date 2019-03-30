//
//  AFSTextViewLogicHandlersStructs.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/22/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

@available(iOS 2.0, *)
public struct AFSTextViewDelegateBoolBlock<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTextViewHandlersDelegateBoolBlock<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTextViewHandlersDelegateBoolBlock<DataSource>)
    {
        run = block
    }
}

@available(iOS 2.0, *)
public struct AFSTextViewDelegateVoidBlock<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTextViewHandlersDelegateVoidBlock<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTextViewHandlersDelegateVoidBlock<DataSource>)
    {
        run = block
    }
}

@available(iOS 2.0, *)
public struct AFSTextViewDelegateShouldChangeText<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTextViewHandlersDelegateShouldChangeText<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTextViewHandlersDelegateShouldChangeText<DataSource>)
    {
        run = block
    }
}

@available(iOS 10.0, *)
public struct AFSTextViewDelegateShouldInteractWithURLInteraction<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTextViewHandlersDelegateShouldInteractWithURLInteraction<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTextViewHandlersDelegateShouldInteractWithURLInteraction<DataSource>)
    {
        run = block
    }
}

@available(iOS 10.0, *)
public struct AFSTextViewDelegateShouldInteractWithAttachmentInteraction<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTextViewHandlersDelegateShouldInteractWithAttachmentInteraction<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTextViewHandlersDelegateShouldInteractWithAttachmentInteraction<DataSource>)
    {
        run = block
    }
}

@available(iOS 7.0, *)
public struct AFSTextViewDelegateShouldInteractWithURLInRange<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTextViewHandlersDelegateShouldInteractWithURLInRange<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTextViewHandlersDelegateShouldInteractWithURLInRange<DataSource>)
    {
        run = block
    }
}

@available(iOS 7.0, *)
public struct AFSTextViewDelegateShouldInteractWithAttachmentInRange<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTextViewHandlersDelegateShouldInteractWithAttachmentInRange<DataSource>

    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTextViewHandlersDelegateShouldInteractWithAttachmentInRange<DataSource>)
    {
        run = block
    }
}
