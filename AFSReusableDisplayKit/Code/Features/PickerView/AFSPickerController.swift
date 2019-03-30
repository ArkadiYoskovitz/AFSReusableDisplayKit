//
//  AFSPickerController.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/22/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

public final class AFSPickerController<DataSource>: AFSController ,
    UIPickerViewDelegate,
    UIPickerViewDataSource,
    UIPickerViewAccessibilityDelegate
    where DataSource : AFSMetadataDataSource
{
    // MARK: - Stored Properties
    public internal(set) var dataController : DataSource!
    
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
    
    // MARK: - Access Properties - UIPickerViewDataSource
    @available(iOS 2.0, *)
    internal var dataSourceComponentCount      : AFSPickerDataSourceComponentCount<DataSource>? {
        get { return _dataSourceComponentCount as? AFSPickerDataSourceComponentCount<DataSource> }
        set { _dataSourceComponentCount = newValue }
    }
    @available(iOS 2.0, *)
    internal var dataSourceRowCountInComponent : AFSPickerDataSourceRowCountInComponent<DataSource>? {
        get { return _dataSourceRowCountInComponent as? AFSPickerDataSourceRowCountInComponent<DataSource> }
        set { _dataSourceRowCountInComponent = newValue }
    }
    
    // MARK: - Access Properties - UIPickerViewDataSource
    @available(iOS 2.0, *)
    internal var delegateComponentWidth : AFSPickerDelegateComponentWidth<DataSource>? {
        get { return _delegateComponentWidth as? AFSPickerDelegateComponentWidth<DataSource> }
        set { _delegateComponentWidth = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateComponentHeight : AFSPickerDelegateComponentHeight<DataSource>? {
        get { return _delegateComponentHeight as? AFSPickerDelegateComponentHeight<DataSource> }
        set { _delegateComponentHeight = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateTitleForComponent : AFSPickerDelegateTitleForComponent<DataSource>? {
        get { return _delegateTitleForComponent as? AFSPickerDelegateTitleForComponent<DataSource> }
        set { _delegateTitleForComponent = newValue }
    }
    @available(iOS 6.0, *)
    internal var delegateAttributedTitleForComponent : AFSPickerDelegateAttributedTitleForComponent<DataSource>? {
        get { return _delegateAttributedTitleForComponent as? AFSPickerDelegateAttributedTitleForComponent<DataSource> }
        set { _delegateAttributedTitleForComponent = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateViewForRowForComponent : AFSPickerDelegateViewForRowForComponent<DataSource>? {
        get { return _delegateViewForRowForComponent as? AFSPickerDelegateViewForRowForComponent<DataSource> }
        set { _delegateViewForRowForComponent = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateSelectedRowInComponent : AFSPickerDelegateSelectedRowInComponent<DataSource>? {
        get { return _delegateSelectedRowInComponent as? AFSPickerDelegateSelectedRowInComponent<DataSource> }
        set { _delegateSelectedRowInComponent = newValue }
    }
    
    // MARK: - Access Properties - UIPickerViewAccessibilityDelegate
    @available(iOS 2.0, *)
    internal var accessibilityDelegateLabelForComponent : AFSPickerAccessibilityDelegateString<DataSource>? {
        get { return _accessibilityDelegateLabelForComponent as? AFSPickerAccessibilityDelegateString<DataSource> }
        set { _accessibilityDelegateLabelForComponent = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var accessibilityDelegateHintForComponent : AFSPickerAccessibilityDelegateString<DataSource>? {
        get { return _accessibilityDelegateHintForComponent as? AFSPickerAccessibilityDelegateString<DataSource> }
        set { _accessibilityDelegateHintForComponent = newValue }
    }
    
    @available(iOS 11.0, *)
    internal var accessibilityDelegateAttributedLabelForComponent : AFSPickerAccessibilityDelegateAttributed<DataSource>? {
        get { return _accessibilityDelegateAttributedLabelForComponent as? AFSPickerAccessibilityDelegateAttributed<DataSource> }
        set { _accessibilityDelegateAttributedLabelForComponent = newValue }
    }
    
    @available(iOS 11.0, *)
    internal var accessibilityDelegateAttributedHintForComponent  : AFSPickerAccessibilityDelegateAttributed<DataSource>? {
        get { return _accessibilityDelegateAttributedHintForComponent as? AFSPickerAccessibilityDelegateAttributed<DataSource> }
        set { _accessibilityDelegateAttributedHintForComponent = newValue }
    }
    
    // MARK: - Object life cycle
    deinit {
        print("\(type(of: self)) was deallocated successfuly")
    }
    
    // MARK: - NSObject override
    public override func responds(to aSelector: Selector!) -> Bool
    {
        guard let input = aSelector else { return super.responds(to: aSelector) }
        
        if  input.isMember(of: UIPickerViewAccessibilityDelegate.self) ||
            input.isMember(of: UIPickerViewDataSource.self) ||
            input.isMember(of: UIPickerViewDelegate  .self)
        {
            if handleDataSourceByResponding           (to: input) { return true }
            if handleDelegateByResponding             (to: input) { return true }
            if handleAccessibilityDelegateByResponding(to: input) { return true }
            return false
        }  else {
            guard let proxy = delegateProxy else { return super.responds(to: aSelector) }
            guard proxy.responds(to: input) else { return super.responds(to: aSelector) }
            return true
        }
    }
    
    public override func conforms(to aProtocol: Protocol) -> Bool
    {    
        guard protocol_conformsToProtocol(aProtocol, UIPickerViewAccessibilityDelegate.self) ||
            protocol_conformsToProtocol(aProtocol, UIPickerViewDataSource.self) ||
            protocol_conformsToProtocol(aProtocol, UIPickerViewDelegate  .self) else {
                return super.conforms(to: aProtocol)
        }
        
        guard let proxy = delegateProxy     else { return super.conforms(to: aProtocol) }
        guard proxy.conforms(to: aProtocol) else { return super.conforms(to: aProtocol) }
        return true
    }
    
    // MARK: - UIPickerViewDataSource
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return dataSourceComponentCount?.run(self,pickerView) ?? 0
    }
    
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSourceRowCountInComponent?.run(self,pickerView,component) ?? 0
    }
    
    // MARK: - UIPickerViewDelegate
    
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return delegateComponentWidth?.run(self,pickerView,component) ?? CGFloat(0)
    }
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return delegateComponentHeight?.run(self,pickerView,component) ?? CGFloat(0)
    }
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return delegateTitleForComponent?.run(self,pickerView,row,component)
    }
    @available(iOS 6.0, *)
    public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return delegateAttributedTitleForComponent?.run(self,pickerView,row,component)
    }
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        return delegateViewForRowForComponent?.run(self,pickerView,row,component,view) ?? UIView(frame: .zero)
    }
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegateSelectedRowInComponent?.run(self,pickerView,row,component)
    }
    
    // MARK: - UIPickerViewAccessibilityDelegate
    
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, accessibilityLabelForComponent component: Int) -> String? {
        return accessibilityDelegateLabelForComponent?.run(self,pickerView,component)
    }
    
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, accessibilityHintForComponent component: Int) -> String? {
        return accessibilityDelegateHintForComponent?.run(self,pickerView,component)
    }
    
    @available(iOS 11.0, *)
    public func pickerView(_ pickerView: UIPickerView, accessibilityAttributedLabelForComponent component: Int) -> NSAttributedString? {
        return accessibilityDelegateAttributedLabelForComponent?.run(self,pickerView,component)
    }
    
    @available(iOS 11.0, *)
    public func pickerView(_ pickerView: UIPickerView, accessibilityAttributedHintForComponent component: Int) -> NSAttributedString? {
        return accessibilityDelegateAttributedHintForComponent?.run(self,pickerView,component)
    }
}
// MARK: - Selector Logic
fileprivate extension AFSPickerController {
    
    func handleDataSourceByResponding(to aSelector: Selector) -> Bool {
        
        if #available(iOS 2.0, *) {
            switch aSelector {
            case #selector(UIPickerViewDataSource.numberOfComponents(in:)):
                guard dataSourceComponentCount != nil else { break }
                return true
                
            case #selector(UIPickerViewDataSource.pickerView(_:numberOfRowsInComponent:)):
                guard dataSourceRowCountInComponent != nil else { break }
                return true
                
            default:
                break
            }
        }
        return false
    }
    
    func handleDelegateByResponding(to aSelector: Selector) -> Bool {
        
        if #available(iOS 2.0, *) {
            
            switch aSelector {
            case #selector(UIPickerViewDelegate.pickerView(_:widthForComponent:)) :
                guard delegateComponentWidth != nil else { break }
                return true
                
            case #selector(UIPickerViewDelegate.pickerView(_:rowHeightForComponent:)) :
                guard delegateComponentHeight != nil else { break }
                return true
                
            case #selector(UIPickerViewDelegate.pickerView(_:titleForRow:forComponent:)):
                guard delegateTitleForComponent != nil else { break }
                return true
                
            case #selector(UIPickerViewDelegate.pickerView(_:viewForRow:forComponent:reusing:)):
                guard delegateViewForRowForComponent != nil else { break }
                return true
                
            case #selector(UIPickerViewDelegate.pickerView(_:didSelectRow:inComponent:)):
                guard delegateSelectedRowInComponent != nil else { break }
                return true
                
            default: break
            }
        }
        
        if #available(iOS 6.0, *) {
            
            switch aSelector {
            case #selector(UIPickerViewDelegate.pickerView(_:attributedTitleForRow:forComponent:)):
                guard delegateAttributedTitleForComponent != nil else { break }
                return true
                
            default: break
            }
        }
        return false
    }
    
    func handleAccessibilityDelegateByResponding(to aSelector: Selector) -> Bool {
        
        if #available(iOS 2.0, *) {
            switch aSelector {
            case #selector(UIPickerViewAccessibilityDelegate.pickerView(_:accessibilityLabelForComponent:)):
                guard accessibilityDelegateLabelForComponent != nil else { break }
                return true
                
            case #selector(UIPickerViewAccessibilityDelegate.pickerView(_:accessibilityHintForComponent:)):
                guard accessibilityDelegateHintForComponent  != nil else { break }
                return true
                
            default: break
            }
        }
        
        if #available(iOS 11.0, *) {
            switch aSelector {
            case #selector(UIPickerViewAccessibilityDelegate.pickerView(_:accessibilityAttributedLabelForComponent:)):
                guard accessibilityDelegateAttributedLabelForComponent != nil else { break }
                return true
                
            case #selector(UIPickerViewAccessibilityDelegate.pickerView(_:accessibilityAttributedHintForComponent:)):
                guard accessibilityDelegateAttributedHintForComponent  != nil else { break }
                return true
                
            default: break
            }
        }
        
        return false
    }
}
