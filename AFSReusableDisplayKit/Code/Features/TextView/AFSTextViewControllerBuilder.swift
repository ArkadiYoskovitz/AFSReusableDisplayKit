//
//  AFSTextViewControllerBuilder.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/22/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

public final class AFSTextViewControllerBuilder<DataSource>: NSObject where DataSource : AFSMetadataDataSource {
    
    // MARK: - typealias
    public typealias ElementsController = AFSTextViewController<DataSource>
    
    // MARK: - Stored Properties
    public internal(set) var displayType     : AFSReusableDisplayKit.DisplayType
    public internal(set) var dataController  : DataSource!
    
    // MARK: - Stored Properties - UITextViewDelegate
    private var _delegateShouldBeginEditing      : Any?
    private var _delegateShouldEndEditing        : Any?
    private var _delegateDidBeginEditing         : Any?
    private var _delegateDidEndEditing           : Any?
    private var _delegateShouldChangeTextInRange : Any?
    private var _delegateDidChange               : Any?
    private var _delegateDidChangeSelection      : Any?
    
    private var _delegateShouldInteractWithURLInteraction        : Any?
    private var _delegateShouldInteractWithAttachmentInteraction : Any?
    
    // private var _delegateShouldInteractWithURLInRange        : Any?
    // private var _delegateShouldInteractWithAttachmentInRange : Any?
    
    // MARK: - Access Properties - UITextViewDelegate
    @available(iOS 2.0, *)
    internal var delegateShouldBeginEditing : AFSTextViewDelegateBoolBlock<DataSource>? {
        get { return _delegateShouldBeginEditing as? AFSTextViewDelegateBoolBlock<DataSource> }
        set { _delegateShouldBeginEditing = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateShouldEndEditing : AFSTextViewDelegateBoolBlock<DataSource>? {
        get { return _delegateShouldEndEditing as? AFSTextViewDelegateBoolBlock<DataSource> }
        set { _delegateShouldEndEditing = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateDidBeginEditing : AFSTextViewDelegateVoidBlock<DataSource>? {
        get { return _delegateDidBeginEditing as? AFSTextViewDelegateVoidBlock<DataSource> }
        set { _delegateDidBeginEditing = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateDidEndEditing : AFSTextViewDelegateVoidBlock<DataSource>? {
        get { return _delegateDidEndEditing as? AFSTextViewDelegateVoidBlock<DataSource> }
        set { _delegateDidEndEditing = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateShouldChangeTextInRange : AFSTextViewDelegateShouldChangeText<DataSource>? {
        get { return _delegateShouldChangeTextInRange as? AFSTextViewDelegateShouldChangeText<DataSource> }
        set { _delegateShouldChangeTextInRange = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateDidChange : AFSTextViewDelegateVoidBlock<DataSource>? {
        get { return _delegateDidChange as? AFSTextViewDelegateVoidBlock<DataSource> }
        set { _delegateDidChange = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateDidChangeSelection : AFSTextViewDelegateVoidBlock<DataSource>? {
        get { return _delegateDidChangeSelection as? AFSTextViewDelegateVoidBlock<DataSource> }
        set { _delegateDidChangeSelection = newValue }
    }
    @available(iOS 10.0, *)
    internal var delegateShouldInteractWithURLInteraction : AFSTextViewDelegateShouldInteractWithURLInteraction<DataSource>? {
        get { return _delegateShouldInteractWithURLInteraction as? AFSTextViewDelegateShouldInteractWithURLInteraction<DataSource> }
        set { _delegateShouldInteractWithURLInteraction = newValue }
    }
    @available(iOS 10.0, *)
    internal var delegateShouldInteractWithAttachmentInteraction : AFSTextViewDelegateShouldInteractWithAttachmentInteraction<DataSource>? {
        get { return _delegateShouldInteractWithAttachmentInteraction as? AFSTextViewDelegateShouldInteractWithAttachmentInteraction<DataSource> }
        set { _delegateShouldInteractWithAttachmentInteraction = newValue }
    }
    
    // @available(iOS, introduced: 7.0, deprecated: 10.0)
    // internal var delegateShouldInteractWithURLInRange        : AFSTextViewDelegateShouldInteractWithURLInRange<DataSource>? {
    //     get { return _delegateShouldInteractWithURLInRange as? AFSTextViewDelegateShouldInteractWithURLInRange<DataSource> }
    //     set { _delegateShouldInteractWithURLInRange = newValue }
    // }
    // @available(iOS, introduced: 7.0, deprecated: 10.0)
    // internal var delegateShouldInteractWithAttachmentInRange : AFSTextViewDelegateShouldInteractWithAttachmentInRange<DataSource>? {
    //     get { return _delegateShouldInteractWithAttachmentInRange as? AFSTextViewDelegateShouldInteractWithAttachmentInRange<DataSource> }
    //     set { _delegateShouldInteractWithAttachmentInRange = newValue }
    // }
    
    // MARK: - Subscript
    
    // MARK: - Initialization
    public init(displayType: AFSReusableDisplayKit.DisplayType = .textView)
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
        let controller = AFSTextViewController<DataSource>()
        controller.dataController = dataController
        applyTextViewBlocks(to: controller)
        return controller
    }
    
    ///
    /// Applay delegate Blocks to text field controller
    ///
    public final func applyTextViewBlocks(to controller: AFSTextViewController<DataSource>) {
        
        if #available(iOS 2.0, *) {
            controller.delegateShouldBeginEditing      = delegateShouldBeginEditing
            controller.delegateShouldEndEditing        = delegateShouldEndEditing
            controller.delegateDidBeginEditing         = delegateDidBeginEditing
            controller.delegateDidEndEditing           = delegateDidEndEditing
            controller.delegateShouldChangeTextInRange = delegateShouldChangeTextInRange
            controller.delegateDidChange               = delegateDidChange
            controller.delegateDidChangeSelection      = delegateDidChangeSelection
        }
        
        if #available(iOS 7.0, *) {
            // controller.delegateShouldInteractWithURLInRange        = delegateShouldInteractWithURLInRange
            // controller.delegateShouldInteractWithAttachmentInRange = delegateShouldInteractWithAttachmentInRange
        }
        if #available(iOS 10.0, *) {
            controller.delegateShouldInteractWithURLInteraction = delegateShouldInteractWithURLInteraction
            controller.delegateShouldInteractWithAttachmentInteraction = delegateShouldInteractWithAttachmentInteraction
        }
    }
}
// MARK: -
extension AFSTextViewControllerBuilder { // MARK: Block setters
    // MARK: -
    ///
    /// Set a new behavior for UITextViewDelegate method `textViewShouldBeginEditing(_:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateShouldBeginEditing(handler block: AFSTextViewHandlersDelegateBoolBlock<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateShouldBeginEditing = AFSTextViewDelegateBoolBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UITextViewDelegate method `textViewShouldEndEditing(_:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateShouldEndEditing(handler block: AFSTextViewHandlersDelegateBoolBlock<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateShouldEndEditing = AFSTextViewDelegateBoolBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UITextViewDelegate method `textViewDidBeginEditing(_:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateDidBeginEditing(handler block: AFSTextViewHandlersDelegateVoidBlock<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateDidBeginEditing = AFSTextViewDelegateVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UITextViewDelegate method `textViewDidEndEditing(_:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateDidEndEditing(handler block: AFSTextViewHandlersDelegateVoidBlock<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateDidEndEditing = AFSTextViewDelegateVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UITextViewDelegate method `textView(_:shouldChangeTextIn:replacementText:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateShouldChangeTextInRange(handler block: AFSTextViewHandlersDelegateShouldChangeText<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateShouldChangeTextInRange = AFSTextViewDelegateShouldChangeText<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UITextViewDelegate method `textViewDidChange(_:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateDidChange(handler block: AFSTextViewHandlersDelegateVoidBlock<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateDidChange = AFSTextViewDelegateVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UITextViewDelegate method `textViewDidChangeSelection(_:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateDidChangeSelection(handler block: AFSTextViewHandlersDelegateVoidBlock<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateDidChangeSelection = AFSTextViewDelegateVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    /////=======
    ///
    /// Set a new behavior for UITextViewDelegate method `textView(_:shouldInteractWith:in:interaction:)`
    ///
    @available(iOS 10.0, *)
    @discardableResult public func setDelegateShouldInteractWithURLInteraction(handler block: AFSTextViewHandlersDelegateShouldInteractWithURLInteraction<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateShouldInteractWithURLInteraction = AFSTextViewDelegateShouldInteractWithURLInteraction<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UITextViewDelegate method `textView(_:shouldInteractWith:in:interaction:)`
    ///
    @available(iOS 10.0, *)
    @discardableResult public func setDelegateShouldInteractWithAttachmentInteraction(handler block: AFSTextViewHandlersDelegateShouldInteractWithAttachmentInteraction<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateShouldInteractWithAttachmentInteraction = AFSTextViewDelegateShouldInteractWithAttachmentInteraction<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    // ///
    // /// Set a new behavior for UITextViewDelegate method `textView(_:shouldInteractWith:in:)`
    // ///
    // @available(iOS 7.0, *)
    // @discardableResult public func setDelegateShouldInteractWithURLInRange(handler block: AFSTextViewHandlersDelegateShouldInteractWithURLInRange<DataSource>?) -> Self {
    //
    //     if let handlerBlock = block {
    //         self.delegateShouldInteractWithURLInRange = AFSTextViewDelegateShouldInteractWithURLInRange<DataSource>.init(handler: handlerBlock)
    //     }
    //     return self
    // }
    // ///
    // /// Set a new behavior for UITextViewDelegate method `textView(_:shouldInteractWith:in:)`
    // ///
    // @available(iOS 7.0, *)
    // @discardableResult public func setDelegateShouldInteractWithAttachmentInRange(handler block: AFSTextViewHandlersDelegateShouldInteractWithAttachmentInRange<DataSource>?) -> Self {
    //
    //     if let handlerBlock = block {
    //         self.delegateShouldInteractWithAttachmentInRange = AFSTextViewDelegateShouldInteractWithAttachmentInRange<DataSource>.init(handler: handlerBlock)
    //     }
    //     return self
    // }
}
