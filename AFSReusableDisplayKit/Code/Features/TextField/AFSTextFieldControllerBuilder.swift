//
//  AFSTextFieldControllerBuilder.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/22/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

class AFSTextFieldControllerBuilder<DataSource>: NSObject where DataSource : AFSMetadataDataSource {
    
    // MARK: - typealias
    public typealias ElementsController = AFSTextFieldController<DataSource>
    
    // MARK: - Stored Properties
    public internal(set) var displayType     : AFSReusableDisplayKit.DisplayType
    public internal(set) var dataController  : DataSource!
    
    // MARK: - Stored Properties -UITextFieldDelegate
    private var _delegateShouldBeginEditing     : Any?
    private var _delegateDidBeginEditing        : Any?
    private var _delegateShouldEndEditing       : Any?
    private var _delegateDidEndEditing          : Any?
    private var _delegateDidEditingReason       : Any?
    private var _delegateShouldChangeCharacters : Any?
    private var _delegateShouldClear            : Any?
    private var _delegateShouldReturn           : Any?
    
    // MARK: - Access Properties - UITextFieldDelegate
    @available(iOS 2.0, *)
    fileprivate var delegateShouldBeginEditing     : AFSTextFieldDelegateBoolBlock<DataSource>? {
        get { return _delegateShouldBeginEditing as? AFSTextFieldDelegateBoolBlock<DataSource>}
        set { _delegateShouldBeginEditing = newValue }
    }
    
    @available(iOS 2.0, *)
    fileprivate var delegateDidBeginEditing        : AFSTextFieldDelegateVoidBlock<DataSource>? {
        get { return _delegateDidEditingReason as? AFSTextFieldDelegateVoidBlock<DataSource>}
        set { _delegateDidBeginEditing = newValue }
    }
    
    @available(iOS 2.0, *)
    fileprivate var delegateShouldEndEditing       : AFSTextFieldDelegateBoolBlock<DataSource>? {
        get { return _delegateDidEditingReason as? AFSTextFieldDelegateBoolBlock<DataSource>}
        set { _delegateShouldEndEditing = newValue }
    }
    
    @available(iOS 2.0, *)
    fileprivate var delegateDidEndEditing          : AFSTextFieldDelegateVoidBlock<DataSource>? {
        get { return _delegateDidEditingReason as? AFSTextFieldDelegateVoidBlock<DataSource>}
        set { _delegateDidEndEditing = newValue }
    }
    
    @available(iOS 10.0, *)
    fileprivate var  delegateDidEditingReason      : AFSTextFieldDelegateEditingReasonBlock<DataSource>? {
        get { return _delegateDidEditingReason as? AFSTextFieldDelegateEditingReasonBlock<DataSource>}
        set { _delegateDidEditingReason = newValue }
    }
    
    @available(iOS 2.0, *)
    fileprivate var delegateShouldChangeCharacters : AFSTextFieldDelegateShouldChangeCharactersBlock<DataSource>? {
        get { return _delegateShouldChangeCharacters as? AFSTextFieldDelegateShouldChangeCharactersBlock<DataSource>}
        set { _delegateShouldChangeCharacters = newValue }
    }
    
    @available(iOS 2.0, *)
    fileprivate var delegateShouldClear            : AFSTextFieldDelegateBoolBlock<DataSource>? {
        get { return _delegateShouldClear as? AFSTextFieldDelegateBoolBlock<DataSource>}
        set { _delegateShouldClear = newValue }
    }
    
    @available(iOS 2.0, *)
    fileprivate var delegateShouldReturn           : AFSTextFieldDelegateBoolBlock<DataSource>? {
        get { return _delegateShouldReturn as? AFSTextFieldDelegateBoolBlock<DataSource>}
        set { _delegateShouldReturn = newValue }
    }
    
    // MARK: - Subscript
    
    // MARK: - Initialization
    public init(displayType: AFSReusableDisplayKit.DisplayType = .textField)
    {
        self.displayType = displayType
        super.init()
    }
    
    
    // MARK: - Object life cycle
    deinit
    {
        print("\(type(of: self)) was deallocated successfuly")
    }
    
    // MARK: -
    
    ///
    /// Build a new table controller object
    ///
    public func build() -> ElementsController?
    {
        let controller = AFSTextFieldController<DataSource>()
        controller.dataController = dataController
        applyTextFieldBlocks(to: controller)
        return controller
    }
    
    ///
    /// Applay delegate Blocks to text field controller
    ///
    public final func applyTextFieldBlocks(to controller: AFSTextFieldController<DataSource>)
    {
        if #available(iOS 2.0, *) {
            controller.delegateShouldBeginEditing     = delegateShouldBeginEditing
            controller.delegateDidBeginEditing        = delegateDidBeginEditing
            controller.delegateShouldEndEditing       = delegateShouldEndEditing
            controller.delegateDidEndEditing          = delegateDidEndEditing
            controller.delegateShouldChangeCharacters = delegateShouldChangeCharacters
            controller.delegateShouldClear            = delegateShouldClear
            controller.delegateShouldReturn           = delegateShouldReturn
        }
        if #available(iOS 11.0, *) {
            controller.delegateDidEditingReason = delegateDidEditingReason
        } 
    }
}
// MARK: -
extension AFSTextFieldControllerBuilder { // MARK: Block setters
    
    // MARK: -
    ///
    /// Set a new behavior for UITextFieldDelegate method `textFieldShouldBeginEditing(_:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateShouldBeginEditing(handler block: AFSTextFieldHandlersDelegateBoolBlock<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateShouldBeginEditing = AFSTextFieldDelegateBoolBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UITextFieldDelegate method `textFieldDidBeginEditing(_:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateDidBeginEditing(handler block: AFSTextFieldHandlersDelegateVoidBlock<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateDidBeginEditing = AFSTextFieldDelegateVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UITextFieldDelegate method `textFieldShouldEndEditing(_:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateShouldEndEditing(handler block: AFSTextFieldHandlersDelegateBoolBlock<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateShouldEndEditing = AFSTextFieldDelegateBoolBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UITextFieldDelegate method `textFieldDidEndEditing(_:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDdelegateDidEndEditing(handler block: AFSTextFieldHandlersDelegateVoidBlock<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateDidEndEditing = AFSTextFieldDelegateVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UITextFieldDelegate method `textFieldDidEndEditing(_:reason:)`
    ///
    @available(iOS 10.0, *)
    @discardableResult public func setDelegateDidEditingReason(handler block: AFSTextFieldHandlersDelegateEditingReasonBlock<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateDidEditingReason = AFSTextFieldDelegateEditingReasonBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UITextFieldDelegate method `textField(_:shouldChangeCharactersIn:replacementString:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateShouldChangeCharacters(handler block: AFSTextFieldHandlersDelegateShouldChangeCharactersBlock<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateShouldChangeCharacters = AFSTextFieldDelegateShouldChangeCharactersBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UITextFieldDelegate method `textFieldShouldClear(_:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateShouldClear(handler block: AFSTextFieldHandlersDelegateBoolBlock<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateShouldClear = AFSTextFieldDelegateBoolBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UITextFieldDelegate method `textFieldShouldReturn(_:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateShouldReturn(handler block: AFSTextFieldHandlersDelegateBoolBlock<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateShouldReturn = AFSTextFieldDelegateBoolBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
}
