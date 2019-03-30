//
//  AFSPickerControllerBuilder.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/22/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

class AFSPickerControllerBuilder<DataSource>: NSObject where DataSource : AFSMetadataDataSource
{
    /// MARK: - typealias
    public typealias ElementsController = AFSPickerController<DataSource>
    
    // MARK: - Stored Properties
    public internal(set) var displayType     : AFSReusableDisplayKit.DisplayType
    public internal(set) var dataController  : DataSource!
    
    // MARK: - Stored Properties - UIPickerViewDataSource
    private var _dataSourceComponentCount      : Any?
    private var _dataSourceRowCountInComponent : Any?
    
    // MARK: - Stored Properties - UIPickerViewDelegate
    private var _delegateComponentWidth              : Any?
    private var _delegateComponentHeight             : Any?
    private var _delegateTitleForComponent           : Any?
    private var _delegateAttributedTitleForComponent : Any?
    private var _delegateViewForRowForComponent      : Any?
    private var _delegateSelectedRowInComponent      : Any?
    
    // MARK: - Stored Properties - UIPickerViewAccessibilityDelegate
    private var _accessibilityDelegateLabelForComponent           : Any?
    private var _accessibilityDelegateHintForComponent            : Any?
    private var _accessibilityDelegateAttributedLabelForComponent : Any?
    private var _accessibilityDelegateAttributedHintForComponent  : Any?
    
    /////
    // MARK: - Access Properties - UIPickerViewDataSource
    @available(iOS 2.0, *)
    fileprivate var dataSourceComponentCount      : AFSPickerDataSourceComponentCount<DataSource>? {
        get { return _dataSourceComponentCount as? AFSPickerDataSourceComponentCount<DataSource> }
        set { _dataSourceComponentCount = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var dataSourceRowCountInComponent : AFSPickerDataSourceRowCountInComponent<DataSource>? {
        get { return _dataSourceRowCountInComponent as? AFSPickerDataSourceRowCountInComponent<DataSource> }
        set { _dataSourceRowCountInComponent = newValue }
    }
    
    // MARK: - Access Properties - UIPickerViewDelegate
    @available(iOS 2.0, *)
    fileprivate var delegateComponentWidth              : AFSPickerDelegateComponentWidth<DataSource>? {
        get { return _delegateComponentWidth as? AFSPickerDelegateComponentWidth<DataSource> }
        set { _delegateComponentWidth = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateComponentHeight             : AFSPickerDelegateComponentHeight<DataSource>? {
        get { return _delegateComponentHeight as? AFSPickerDelegateComponentHeight<DataSource> }
        set { _delegateComponentHeight = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateTitleForComponent           : AFSPickerDelegateTitleForComponent<DataSource>? {
        get { return _delegateTitleForComponent as? AFSPickerDelegateTitleForComponent<DataSource> }
        set { _delegateTitleForComponent = newValue }
    }
    @available(iOS 6.0, *)
    fileprivate var delegateAttributedTitleForComponent : AFSPickerDelegateAttributedTitleForComponent<DataSource>? {
        get { return _delegateAttributedTitleForComponent as? AFSPickerDelegateAttributedTitleForComponent<DataSource> }
        set { _delegateAttributedTitleForComponent = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateViewForRowForComponent      : AFSPickerDelegateViewForRowForComponent<DataSource>? {
        get { return _delegateViewForRowForComponent as? AFSPickerDelegateViewForRowForComponent<DataSource> }
        set { _delegateViewForRowForComponent = newValue}
    }
    @available(iOS 2.0, *)
    fileprivate var delegateSelectedRowInComponent      : AFSPickerDelegateSelectedRowInComponent<DataSource>?{
        get { return _delegateSelectedRowInComponent as? AFSPickerDelegateSelectedRowInComponent<DataSource> }
        set { _delegateSelectedRowInComponent = newValue}
    }
    
    // MARK: - Access Properties - UIPickerViewAccessibilityDelegate
    @available(iOS 2.0, *)
    fileprivate var accessibilityDelegateLabelForComponent           : AFSPickerAccessibilityDelegateString<DataSource>? {
        get { return _accessibilityDelegateLabelForComponent as? AFSPickerAccessibilityDelegateString<DataSource> }
        set { _accessibilityDelegateLabelForComponent = newValue}
    }
    @available(iOS 2.0, *)
    fileprivate var accessibilityDelegateHintForComponent            : AFSPickerAccessibilityDelegateString<DataSource>? {
        get { return _accessibilityDelegateHintForComponent as? AFSPickerAccessibilityDelegateString<DataSource>}
        set { _accessibilityDelegateHintForComponent = newValue }
    }
    @available(iOS 11.0, *)
    fileprivate var accessibilityDelegateAttributedLabelForComponent : AFSPickerAccessibilityDelegateAttributed<DataSource>?{
        get { return _accessibilityDelegateAttributedLabelForComponent as? AFSPickerAccessibilityDelegateAttributed<DataSource>}
        set { _accessibilityDelegateAttributedLabelForComponent = newValue }
    }
    @available(iOS 11.0, *)
    fileprivate var accessibilityDelegateAttributedHintForComponent  : AFSPickerAccessibilityDelegateAttributed<DataSource>? {
        get { return _accessibilityDelegateAttributedHintForComponent as? AFSPickerAccessibilityDelegateAttributed<DataSource>}
        set { _accessibilityDelegateAttributedHintForComponent = newValue}
    }
    
    // MARK: - Initialization
    public init(displayType: AFSReusableDisplayKit.DisplayType = .pickerView) {
        self.displayType = displayType
        super.init()
    }
    
    // MARK: - Object life cycle
    deinit {
        print("\(type(of: self)) was deallocated successfuly")
    }
    
    // MARK: -
    
    ///
    /// Build a new table controller object
    ///
    public func build() -> ElementsController?
    {
        let controller = AFSPickerController<DataSource>()
        controller.dataController = dataController
        applyPickerBlocks(to: controller)
        return controller
    }
    
    ///
    /// Applay delegate Blocks to picker controller
    ///
    public final func applyPickerBlocks(to controller: AFSPickerController<DataSource>)
    {
        if #available(iOS 2.0, *) {
            controller.dataSourceComponentCount      = dataSourceComponentCount
            controller.dataSourceRowCountInComponent = dataSourceRowCountInComponent
    
            controller.delegateComponentWidth         = delegateComponentWidth
            controller.delegateComponentHeight        = delegateComponentHeight
            controller.delegateTitleForComponent      = delegateTitleForComponent
            controller.delegateViewForRowForComponent = delegateViewForRowForComponent
            controller.delegateSelectedRowInComponent = delegateSelectedRowInComponent
            
            controller.accessibilityDelegateLabelForComponent = accessibilityDelegateLabelForComponent
            controller.accessibilityDelegateHintForComponent  = accessibilityDelegateHintForComponent
        }
        if #available(iOS 6.0, *) {
            controller.delegateAttributedTitleForComponent = delegateAttributedTitleForComponent
        }
        
    
        if #available(iOS 11.0, *) {
            controller.accessibilityDelegateAttributedLabelForComponent = accessibilityDelegateAttributedLabelForComponent
            controller.accessibilityDelegateAttributedHintForComponent  = accessibilityDelegateAttributedHintForComponent
        }
    }
}
// MARK: -
extension AFSPickerControllerBuilder { // MARK: UIPickerViewDataSource
    // MARK: -
    ///
    /// Set a new behavior for UITextFieldDelegate method `numberOfComponents(in:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDataSourceComponentCount(handler block: AFSPickerHandlersDataSourceComponentCount<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.dataSourceComponentCount = AFSPickerDataSourceComponentCount<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UITextFieldDelegate method `pickerView(_:numberOfRowsInComponent:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDataSourceRowCountInComponent(handler block: AFSPickerHandlersDataSourceRowCountInComponent<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.dataSourceRowCountInComponent = AFSPickerDataSourceRowCountInComponent<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
}
// MARK: -
extension AFSPickerControllerBuilder { // MARK: UIPickerViewDelegate
    // MARK: -
    ///
    /// Set a new behavior for UIPickerViewDelegate method `pickerView(_:widthForComponent:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateComponentWidth(handler block: AFSPickerHandlersDelegateComponentWidth<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateComponentWidth = AFSPickerDelegateComponentWidth<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UIPickerViewDelegate method `pickerView(_:rowHeightForComponent:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateComponentHeight(handler block: AFSPickerHandlersDelegateComponentHeight<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateComponentHeight = AFSPickerDelegateComponentHeight<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UIPickerViewDelegate method `pickerView(_:titleForRow:forComponent:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateTitleForComponent(handler block: AFSPickerHandlersDelegateTitleForComponent<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateTitleForComponent = AFSPickerDelegateTitleForComponent<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UIPickerViewDelegate method `pickerView(_:attributedTitleForRow:forComponent:)`
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegateAttributedTitleForComponent(handler block: AFSPickerHandlersDelegateAttributedTitleForComponent<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateAttributedTitleForComponent = AFSPickerDelegateAttributedTitleForComponent<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UIPickerViewDelegate method `pickerView(_:viewForRow:forComponent:reusing:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateViewForRowForComponent(handler block: AFSPickerHandlersDelegateViewForRowForComponent<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateViewForRowForComponent = AFSPickerDelegateViewForRowForComponent<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UIPickerViewDelegate method `pickerView(_:didSelectRow:inComponent:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateSelectedRowInComponent(handler block: AFSPickerHandlersDelegateSelectedRowInComponent<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateSelectedRowInComponent = AFSPickerDelegateSelectedRowInComponent<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
}
// MARK: -
extension AFSPickerControllerBuilder { // MARK: UIPickerViewAccessibilityDelegate
    // MARK: -
    ///
    /// Set a new behavior for UIPickerViewAccessibilityDelegate method `pickerView(_:accessibilityLabelForComponent:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setAccessibilityDelegateLabelForComponent(handler block: AFSPickerHandlersAccessibilityDelegateString<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.accessibilityDelegateLabelForComponent = AFSPickerAccessibilityDelegateString<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UIPickerViewAccessibilityDelegate method `pickerView(_:accessibilityHintForComponent:)`
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setAccessibilityDelegateHintForComponent(handler block: AFSPickerHandlersAccessibilityDelegateString<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.accessibilityDelegateHintForComponent = AFSPickerAccessibilityDelegateString<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UIPickerViewAccessibilityDelegate method `pickerView(_:accessibilityAttributedLabelForComponent:)`
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setAccessibilityDelegateAttributedLabelForComponent(handler block: AFSPickerHandlersAccessibilityDelegateAttributed<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.accessibilityDelegateAttributedLabelForComponent = AFSPickerAccessibilityDelegateAttributed<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UIPickerViewAccessibilityDelegate method `pickerView(_:accessibilityAttributedHintForComponent:)`
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setAccessibilityDelegateAttributedHintForComponent(handler block: AFSPickerHandlersAccessibilityDelegateAttributed<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.accessibilityDelegateAttributedHintForComponent = AFSPickerAccessibilityDelegateAttributed<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
}
