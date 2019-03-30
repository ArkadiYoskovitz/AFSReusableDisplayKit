//
//  AFSTextFieldLogicHandlersTypealias.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/22/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

@available(iOS 2.0, *)
public typealias AFSTextFieldHandlersDelegateBoolBlock<DS:AFSMetadataDataSource> = (AFSTextFieldController<DS>,UITextField) -> Bool
@available(iOS 2.0, *)
public typealias AFSTextFieldHandlersDelegateVoidBlock<DS:AFSMetadataDataSource> = (AFSTextFieldController<DS>,UITextField) -> Void
@available(iOS 10.0, *)
public typealias AFSTextFieldHandlersDelegateEditingReasonBlock         <DS:AFSMetadataDataSource> = (AFSTextFieldController<DS>,UITextField,UITextField.DidEndEditingReason) -> Void
@available(iOS 2.0, *)
public typealias AFSTextFieldHandlersDelegateShouldChangeCharactersBlock<DS:AFSMetadataDataSource> = (AFSTextFieldController<DS>,UITextField,NSRange,String) -> Bool
