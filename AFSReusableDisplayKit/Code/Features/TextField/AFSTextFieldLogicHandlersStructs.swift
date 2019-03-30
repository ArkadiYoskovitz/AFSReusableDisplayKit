//
//  AFSTextFieldLogicHandlersStructs.swift
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
public struct AFSTextFieldDelegateBoolBlock<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTextFieldHandlersDelegateBoolBlock<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTextFieldHandlersDelegateBoolBlock<DataSource>)
    {
        run = block
    }
}
///
///
///
/// ================================================================================================================ ///
@available(iOS 2.0, *)
public struct AFSTextFieldDelegateVoidBlock<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTextFieldHandlersDelegateVoidBlock<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTextFieldHandlersDelegateVoidBlock<DataSource>)
    {
        run = block
    }
}
///
///
///
/// ================================================================================================================ ///
@available(iOS 10.0, *)
public struct AFSTextFieldDelegateEditingReasonBlock<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTextFieldHandlersDelegateEditingReasonBlock<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTextFieldHandlersDelegateEditingReasonBlock<DataSource>)
    {
        run = block
    }
}
///
///
///
/// ================================================================================================================ ///
@available(iOS 2.0, *)
public struct AFSTextFieldDelegateShouldChangeCharactersBlock<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTextFieldHandlersDelegateShouldChangeCharactersBlock<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTextFieldHandlersDelegateShouldChangeCharactersBlock<DataSource>)
    {
        run = block
    }
}
