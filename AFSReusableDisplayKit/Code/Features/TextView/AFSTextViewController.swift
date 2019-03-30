//
//  AFSTextViewController.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/22/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit
///
///
///
public final class AFSTextViewController<DataSource>: AFSController ,
    UITextViewDelegate
    where DataSource : AFSMetadataDataSource
{
    // MARK: - Stored Properties
    public internal(set) var dataController : DataSource!
    
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
    
    // MARK: - Object life cycle
    deinit
    {
        print("\(type(of: self)) was deallocated successfuly")
    }
    
    // MARK: - NSObject override
    
    public override func responds(to aSelector: Selector!) -> Bool
    {
        guard let input = aSelector else { return super.responds(to: aSelector) }
        
        if input.isMember(of: UITextViewDelegate.self) {
            return handleDelegateByResponding(to: input)
        }
        
        guard let proxy = delegateProxy else { return super.responds(to: aSelector) }
        guard proxy.responds(to: input) else { return super.responds(to: aSelector) }
        return true
    }
    
    public override func conforms(to aProtocol: Protocol) -> Bool
    {
        guard protocol_conformsToProtocol(aProtocol, UITextViewDelegate.self) else {
            return super.conforms(to: aProtocol)
        }
        
        guard let proxy = delegateProxy     else { return super.conforms(to: aProtocol) }
        guard proxy.conforms(to: aProtocol) else { return super.conforms(to: aProtocol) }
        return true
    }
    
    // MARK: - UITextViewDelegate
    @available(iOS 2.0, *)
    public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        return delegateShouldBeginEditing?.run(self,textView) ?? true
    }
    @available(iOS 2.0, *)
    public func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        
        return delegateShouldEndEditing?.run(self,textView) ?? true
    }
    @available(iOS 2.0, *)
    public func textViewDidBeginEditing(_ textView: UITextView) {
        
        delegateDidBeginEditing?.run(self,textView)
    }
    @available(iOS 2.0, *)
    public func textViewDidEndEditing(_ textView: UITextView) {
        
        delegateDidEndEditing?.run(self,textView)
    }
    @available(iOS 2.0, *)
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        return delegateShouldChangeTextInRange?.run(self,textView,range,text) ?? true
    }
    @available(iOS 2.0, *)
    public func textViewDidChange(_ textView: UITextView) {
        
        delegateDidChange?.run(self,textView)
    }
    @available(iOS 2.0, *)
    public func textViewDidChangeSelection(_ textView: UITextView) {
        
        delegateDidChangeSelection?.run(self,textView)
    }
    
    @available(iOS 10.0, *)
    public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        return delegateShouldInteractWithURLInteraction?.run(self,textView,URL,characterRange,interaction) ?? true
    }

    @available(iOS 10.0, *)
    public func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        return delegateShouldInteractWithAttachmentInteraction?.run(self,textView,textAttachment,characterRange,interaction) ?? true
    }
    
    // @available(iOS, introduced: 7.0, deprecated: 10.0, message: "Use textView:shouldInteractWithTextAttachment:inRange:forInteractionType: instead")
    // public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
    //     return delegateShouldInteractWithURLInRange?.run(self,textView,URL,characterRange) ?? true
    // }
    // @available(iOS, introduced: 7.0, deprecated: 10.0, message: "Use textView:shouldInteractWithTextAttachment:inRange:forInteractionType: instead")
    // public func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange) -> Bool {
    //     return delegateShouldInteractWithAttachmentInRange?.run(self,textView,textAttachment,characterRange) ?? true
    // }
}
extension AFSTextViewController {
    
    fileprivate func handleDelegateByResponding(to aSelector: Selector) -> Bool
    {
        if #available(iOS 2.0, *) {
            
            switch aSelector {
            case #selector(UITextViewDelegate.textViewShouldBeginEditing(_:)):
                guard delegateShouldBeginEditing != nil else { break }
                return true
                
            case #selector(UITextViewDelegate.textViewShouldEndEditing(_:)):
                guard delegateShouldEndEditing != nil else { break }
                return true
                
            case #selector(UITextViewDelegate.textViewDidBeginEditing(_:)):
                guard delegateDidBeginEditing != nil else { break }
                return true
                
            case #selector(UITextViewDelegate.textViewDidEndEditing(_:)):
                guard delegateDidEndEditing != nil else { break }
                return true
                
            case #selector(UITextViewDelegate.textView(_:shouldChangeTextIn:replacementText:)) :
                guard delegateShouldChangeTextInRange != nil else { break }
                return true
                
            case #selector(UITextViewDelegate.textViewDidChange(_:)):
                guard delegateDidChange != nil else { break }
                return true
                
            case #selector(UITextViewDelegate.textViewDidChangeSelection(_:)):
                guard delegateDidChangeSelection != nil else { break }
                return true
                
            default:
                break
            }
        }
        
        // if #available(iOS 7.0, *) {
        //
        //     switch aSelector {
        //     case #selector(UITextViewDelegate.textView(_:shouldInteractWith:in:interaction:)):
        //         guard delegateShouldInteractWithAttachmentInteraction != nil else { break }
        //         return true
        //
        //     case #selector(UITextViewDelegate.textView(_:shouldInteractWith:in:)):
        //         guard delegateShouldInteractWithAttachmentInRange != nil else { break }
        //         return true
        //
        //     default:
        //         break
        //     }
        // }
        
        // if #available(iOS 10.0, *) {
        //
        //     switch aSelector {
        //     case #selector(UITextViewDelegate.textView(_:shouldInteractWith:in:interaction:)):
        //         guard delegateShouldInteractWithURLInteraction != nil else { break }
        //         return true
        //
        //     case #selector(UITextViewDelegate.textView(_:shouldInteractWith:in:)):
        //         guard delegateShouldInteractWithAttachmentInteraction != nil else { break }
        //         return true
        //
        //     default:
        //         break
        //     }
        // }
        
        return false
    }
}
