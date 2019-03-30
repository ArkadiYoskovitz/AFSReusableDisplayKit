//
//  AFSTextViewLogicHandlersTypealias.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/22/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

@available(iOS 2.0, *)
public typealias AFSTextViewHandlersDelegateBoolBlock <DS:AFSMetadataDataSource> = (AFSTextViewController<DS>,UITextView) -> Bool
@available(iOS 2.0, *)
public typealias AFSTextViewHandlersDelegateVoidBlock <DS:AFSMetadataDataSource> = (AFSTextViewController<DS>,UITextView) -> Void
@available(iOS 2.0, *)
public typealias AFSTextViewHandlersDelegateShouldChangeText<DS:AFSMetadataDataSource> = (AFSTextViewController<DS>,UITextView,NSRange,String) -> Bool

@available(iOS 7.0, *)
public typealias AFSTextViewHandlersDelegateShouldInteractWithURLInRange    <DS:AFSMetadataDataSource> = (AFSTextViewController<DS>,UITextView,URL,NSRange) -> Bool

@available(iOS 7.0, *)
public typealias AFSTextViewHandlersDelegateShouldInteractWithAttachmentInRange    <DS:AFSMetadataDataSource> = (AFSTextViewController<DS>,UITextView,NSTextAttachment,NSRange) -> Bool

@available(iOS 10.0, *)
public typealias AFSTextViewHandlersDelegateShouldInteractWithURLInteraction<DS:AFSMetadataDataSource> = (AFSTextViewController<DS>,UITextView,URL,NSRange,UITextItemInteraction) -> Bool
@available(iOS 10.0, *)
public typealias AFSTextViewHandlersDelegateShouldInteractWithAttachmentInteraction<DS:AFSMetadataDataSource> = (AFSTextViewController<DS>,UITextView,NSTextAttachment,NSRange,UITextItemInteraction) -> Bool
