//
//  AFSTextFieldController.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/22/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

public final class AFSTextFieldController<DataSource>: AFSController ,
    UITextFieldDelegate
    where DataSource : AFSMetadataDataSource
{
    
    // MARK: - Stored Properties
    public internal(set) var dataController : DataSource!
    
    // MARK: - Stored Properties - UITextFieldDelegate
    internal var _delegateShouldBeginEditing    : Any?
    internal var _delegateDidBeginEditing       : Any?
    internal var _delegateShouldEndEditing      : Any?
    internal var _delegateDidEndEditing         : Any?
    private  var _delegateDidEditingReason      : Any?
    internal var _delegateShouldChangeCharacters: Any?
    internal var _delegateShouldClear           : Any?
    internal var _delegateShouldReturn          : Any?
    
    // MARK: - Access Properties - UITextFieldDelegate
    @available(iOS 2.0, *)
    internal var delegateShouldBeginEditing     : AFSTextFieldDelegateBoolBlock<DataSource>? {
        get { return _delegateShouldBeginEditing as? AFSTextFieldDelegateBoolBlock<DataSource> }
        set { _delegateShouldBeginEditing = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var delegateDidBeginEditing        : AFSTextFieldDelegateVoidBlock<DataSource>? {
        get { return _delegateDidBeginEditing as? AFSTextFieldDelegateVoidBlock<DataSource> }
        set { _delegateDidBeginEditing = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var delegateShouldEndEditing       : AFSTextFieldDelegateBoolBlock<DataSource>? {
        get { return _delegateShouldEndEditing as? AFSTextFieldDelegateBoolBlock<DataSource> }
        set { _delegateShouldEndEditing = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var delegateDidEndEditing          : AFSTextFieldDelegateVoidBlock<DataSource>? {
        get { return _delegateDidEndEditing as? AFSTextFieldDelegateVoidBlock<DataSource> }
        set { _delegateDidEndEditing = newValue }
    }
    
    @available(iOS 10.0, *)
    internal var delegateDidEditingReason       : AFSTextFieldDelegateEditingReasonBlock<DataSource>? {
        get { return _delegateDidEditingReason as? AFSTextFieldDelegateEditingReasonBlock<DataSource> }
        set { _delegateDidEditingReason = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var delegateShouldChangeCharacters : AFSTextFieldDelegateShouldChangeCharactersBlock<DataSource>? {
        get { return _delegateShouldChangeCharacters as? AFSTextFieldDelegateShouldChangeCharactersBlock<DataSource> }
        set { _delegateShouldChangeCharacters = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var delegateShouldClear            : AFSTextFieldDelegateBoolBlock<DataSource>? {
        get { return _delegateShouldClear as? AFSTextFieldDelegateBoolBlock<DataSource> }
        set { _delegateShouldClear = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var delegateShouldReturn           : AFSTextFieldDelegateBoolBlock<DataSource>? {
        get { return _delegateShouldReturn as? AFSTextFieldDelegateBoolBlock<DataSource> }
        set { _delegateShouldReturn = newValue }
    }
    
    // MARK: - Object life cycle
    deinit
    {
        print("\(type(of: self)) was deallocated successfuly")
    }
    
    // MARK: - NSObject override
    public override func responds(to aSelector: Selector!) -> Bool
    {
        guard let input = aSelector else { return super.responds(to: aSelector) }
        
        if input.isMember(of: UITextFieldDelegate.self) {
            return handleDelegateByResponding(to: input)
        }
        
        guard let proxy = delegateProxy else { return super.responds(to: aSelector) }
        guard proxy.responds(to: input) else { return super.responds(to: aSelector) }
        return true
    }
    
    public override func conforms(to aProtocol: Protocol) -> Bool
    {
        guard protocol_conformsToProtocol(aProtocol, UITextFieldDelegate.self) else {
            return super.conforms(to: aProtocol)
        }
        
        guard let proxy = delegateProxy     else { return super.conforms(to: aProtocol) }
        guard proxy.conforms(to: aProtocol) else { return super.conforms(to: aProtocol) }
        return true
    }
    
    // MARK: - UITextFieldDelegate
    
    @available(iOS 2.0, *)
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        return delegateShouldBeginEditing?.run(self,textField) ?? true
    }
    
    @available(iOS 2.0, *)
    public func textFieldDidBeginEditing(_ textField: UITextField)
    {
        delegateDidBeginEditing?.run(self,textField)
    }
    
    @available(iOS 2.0, *)
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        return delegateShouldEndEditing?.run(self,textField) ?? true
    }
    
    @available(iOS 2.0, *)
    public func textFieldDidEndEditing(_ textField: UITextField)
    {
        delegateDidEndEditing?.run(self,textField)
    }
    
    @available(iOS 10.0, *)
    public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason)
    {
        delegateDidEditingReason?.run(self,textField,reason)
    }
    
    @available(iOS 2.0, *)
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        return delegateShouldChangeCharacters?.run(self,textField,range,string) ?? true
    }
    
    @available(iOS 2.0, *)
    public func textFieldShouldClear(_ textField: UITextField) -> Bool
    {
        return delegateShouldClear?.run(self,textField) ?? true
    }
    
    @available(iOS 2.0, *)
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        return delegateShouldReturn?.run(self,textField) ?? true
    }
}
// MARK: - Selector Logic
extension AFSTextFieldController {
    
    fileprivate func handleDelegateByResponding(to aSelector: Selector) -> Bool
    {
        if #available(iOS 2.0, *) {
            
            switch aSelector {
            case #selector(UITextFieldDelegate.textFieldShouldBeginEditing(_:)):
                guard delegateShouldBeginEditing != nil else { break }
                return true
                
            case #selector(UITextFieldDelegate.textFieldDidBeginEditing(_:)):
                guard delegateDidBeginEditing    != nil else { break }
                return true
                
            case #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:)):
                guard delegateShouldEndEditing   != nil else { break }
                return true
                
            case #selector(UITextFieldDelegate.textFieldDidEndEditing(_:)):
                guard delegateDidEndEditing      != nil else { break }
                return true
                
            case #selector(UITextFieldDelegate.textFieldShouldClear(_:)):
                guard delegateShouldClear        != nil else { break }
                return true
                
            case #selector(UITextFieldDelegate.textFieldShouldReturn(_:)):
                guard delegateShouldReturn       != nil else { break }
                return true
                
            case #selector(UITextFieldDelegate.textField(_:shouldChangeCharactersIn:replacementString:)):
                guard delegateShouldChangeCharacters != nil else { break }
                return true
                
            default: break
            }
        }
        
        if #available(iOS 10.0, *) {
            
            switch aSelector {
            case #selector(UITextFieldDelegate.textFieldDidEndEditing(_:reason:)):
                guard delegateDidEditingReason != nil else { break }
                return true
            default: break
            }
        }
        return false
    }
}
