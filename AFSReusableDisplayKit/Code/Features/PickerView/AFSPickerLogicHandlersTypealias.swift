//
//  AFSPickerLogicHandlersTypealias.swift
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
public typealias AFSPickerHandlersDataSourceComponentCount           <DS:AFSMetadataDataSource> = (AFSPickerController<DS>,UIPickerView) -> Int
@available(iOS 2.0, *)
public typealias AFSPickerHandlersDataSourceRowCountInComponent      <DS:AFSMetadataDataSource> = (AFSPickerController<DS>,UIPickerView,Int) -> Int
///
///
///
/// ================================================================================================================ ///
@available(iOS 2.0, *)
public typealias AFSPickerHandlersDelegateComponentWidth             <DS:AFSMetadataDataSource> = (AFSPickerController<DS>,UIPickerView,Int) -> CGFloat
@available(iOS 2.0, *)
public typealias AFSPickerHandlersDelegateComponentHeight            <DS:AFSMetadataDataSource> = (AFSPickerController<DS>,UIPickerView,Int) -> CGFloat
@available(iOS 2.0, *)
public typealias AFSPickerHandlersDelegateTitleForComponent          <DS:AFSMetadataDataSource> = (AFSPickerController<DS>,UIPickerView,Int,Int) -> String?
@available(iOS 6.0, *)
public typealias AFSPickerHandlersDelegateAttributedTitleForComponent<DS:AFSMetadataDataSource> = (AFSPickerController<DS>,UIPickerView,Int,Int) -> NSAttributedString?
@available(iOS 2.0, *)
public typealias AFSPickerHandlersDelegateViewForRowForComponent     <DS:AFSMetadataDataSource> = (AFSPickerController<DS>,UIPickerView,Int,Int,UIView?) -> UIView
@available(iOS 2.0, *)
public typealias AFSPickerHandlersDelegateSelectedRowInComponent     <DS:AFSMetadataDataSource> = (AFSPickerController<DS>,UIPickerView,Int,Int) -> Void
///
///
///
/// ================================================================================================================ ///
@available(iOS 2.0, *)
public typealias AFSPickerHandlersAccessibilityDelegateString        <DS:AFSMetadataDataSource> = (AFSPickerController<DS>,UIPickerView,Int) -> String?
@available(iOS 11.0, *)
public typealias AFSPickerHandlersAccessibilityDelegateAttributed    <DS:AFSMetadataDataSource> = (AFSPickerController<DS>,UIPickerView,Int) -> NSAttributedString?
