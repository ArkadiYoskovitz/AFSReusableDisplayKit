//
//  AFSScrollController.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/20/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit
///
///
///
public class AFSScrollController<DataSource> : AFSReusableElementsController<DataSource> ,
    UIScrollViewDelegate,
    UIScrollViewAccessibilityDelegate
    where
    DataSource : AFSMetadataDataSource
{
    // MARK: - Stored Properties - UIScrollViewDelegate
    private var _delegateDidScroll                     : Any?
    private var _delegateDidZoom                       : Any?
    private var _delegateWillBeginDragging             : Any?
    private var _delegateWillEndDragging               : Any?
    private var _delegateDidEndDragging                : Any?
    private var _delegateWillBeginDecelerating         : Any?
    private var _delegateDidEndDecelerating            : Any?
    private var _delegateDidEndScrollingAnimation      : Any?
    private var _delegateViewForZooming                : Any?
    private var _delegateWillBeginZooming	           : Any?
    private var _delegateDidEndZooming                 : Any?
    private var _delegateShouldScrollToTop             : Any?
    private var _delegateDidScrollToTop                : Any?
    private var _delegateDidChangeAdjustedContentInset : Any?
    
    // MARK: - Stored Properties - UIScrollViewAccessibilityDelegate
    private var _accessibilityDelegateScrollStatus           : Any?
    private var _accessibilityDelegateAttributedScrollStatus : Any?
    
    // MARK: - Access Properties - UIScrollViewDelegate
    @available(iOS 2.0, *)
    internal var delegateDidScroll                : AFSScrollDelegateDidScroll<DataSource>? {
        get { return _delegateDidScroll as? AFSScrollDelegateDidScroll<DataSource> }
        set { _delegateDidScroll = newValue }
    }
    @available(iOS 3.2, *)
    internal var delegateDidZoom                  : AFSScrollDelegateDidZoom<DataSource>? {
        get { return _delegateDidZoom as? AFSScrollDelegateDidZoom<DataSource> }
        set { _delegateDidZoom = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateWillBeginDragging        : AFSScrollDelegateWillBeginDragging<DataSource>? {
        get { return _delegateWillBeginDragging as? AFSScrollDelegateWillBeginDragging<DataSource>}
        set { _delegateWillBeginDragging = newValue }
    }
    @available(iOS 5.0, *)
    internal var delegateWillEndDragging          : AFSScrollDelegateWillEndDragging<DataSource>? {
        get { return _delegateWillEndDragging as? AFSScrollDelegateWillEndDragging<DataSource> }
        set { _delegateWillEndDragging = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateDidEndDragging           : AFSScrollDelegateDidEndDragging<DataSource>? {
        get { return _delegateDidEndDragging as? AFSScrollDelegateDidEndDragging<DataSource> }
        set { _delegateDidEndDragging = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateWillBeginDecelerating    : AFSScrollDelegateWillBeginDecelerating<DataSource>? {
        get { return _delegateWillBeginDecelerating as? AFSScrollDelegateWillBeginDecelerating<DataSource> }
        set { _delegateWillBeginDecelerating = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateDidEndDecelerating       : AFSScrollDelegateDidEndDecelerating<DataSource>? {
        get { return _delegateDidEndDecelerating as? AFSScrollDelegateDidEndDecelerating<DataSource> }
        set { _delegateDidEndDecelerating = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateDidEndScrollingAnimation : AFSScrollDelegateDidEndScrollingAnimation<DataSource>? {
        get { return _delegateDidEndScrollingAnimation as? AFSScrollDelegateDidEndScrollingAnimation<DataSource>}
        set { _delegateDidEndScrollingAnimation = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateViewForZooming           : AFSScrollDelegateViewForZooming<DataSource>? {
        get { return _delegateViewForZooming as? AFSScrollDelegateViewForZooming<DataSource> }
        set { _delegateViewForZooming = newValue }
    }
    @available(iOS 3.2, *)
    internal var delegateWillBeginZooming         : AFSScrollDelegateWillBeginZooming<DataSource>? {
        get { return _delegateWillBeginZooming as? AFSScrollDelegateWillBeginZooming<DataSource> }
        set { _delegateViewForZooming = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateDidEndZooming            : AFSScrollDelegateDidEndZooming<DataSource>? {
        get { return _delegateDidEndZooming as? AFSScrollDelegateDidEndZooming<DataSource> }
        set { _delegateDidEndZooming = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateShouldScrollToTop        : AFSScrollDelegateShouldScrollToTop<DataSource>? {
        get { return _delegateShouldScrollToTop as? AFSScrollDelegateShouldScrollToTop<DataSource> }
        set { _delegateShouldScrollToTop = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateDidScrollToTop           : AFSScrollDelegateDidScrollToTop<DataSource>? {
        get { return _delegateDidScrollToTop as? AFSScrollDelegateDidScrollToTop<DataSource> }
        set { _delegateDidScrollToTop = newValue }
    }
    @available(iOS 11.0, *)
    internal var  delegateDidChangeAdjustedContentInset : AFSScrollDelegateDidChangeAdjustedContentInset<DataSource>? {
        get { return _delegateDidChangeAdjustedContentInset as? AFSScrollDelegateDidChangeAdjustedContentInset<DataSource>}
        set { _delegateDidChangeAdjustedContentInset = newValue }
    }
    
    // MARK: - Access Properties - UIScrollViewAccessibilityDelegate
    @available(iOS 2.0, *)
    internal var accessibilityDelegateScrollStatus           : AFSScrollAccessibilityDelegateScrollStatus          <DataSource>? {
        get { return _accessibilityDelegateScrollStatus as? AFSScrollAccessibilityDelegateScrollStatus<DataSource> }
        set { _accessibilityDelegateScrollStatus = newValue }
    }
    @available(iOS 11.0, *)
    internal var accessibilityDelegateAttributedScrollStatus : AFSScrollAccessibilityDelegateAttributedScrollStatus<DataSource>? {
        get { return _accessibilityDelegateAttributedScrollStatus as? AFSScrollAccessibilityDelegateAttributedScrollStatus<DataSource> }
        set { _accessibilityDelegateAttributedScrollStatus = newValue }
    }
    
    // MARK: - Initialization
    public override init(identifierLogic : AFSReusableIdentifier<DataSource>) {
        super.init(identifierLogic: identifierLogic)
    }
    
    // MARK: - Object life cycle
    deinit {
        print("\(type(of: self)) was deallocated successfuly")
    }
    
    // MARK: - NSObject override
    public override func responds(to aSelector: Selector!) -> Bool {
        
        guard let input = aSelector else { return super.responds(to: aSelector) }
        
        if input.isMember(of: UIScrollViewDelegate.self) {
            return canRespondsToScrollViewDelegateMethod(for: input)
        }
        
        if input.isMember(of: UIScrollViewAccessibilityDelegate.self) {
            return canRespondsToScrollViewAccessibilityDelegateMethod(for: input)
        }
        
        guard let proxy = delegateProxy else { return super.responds(to: aSelector) }
        guard proxy.responds(to: input) else { return super.responds(to: aSelector) }
        return true
    }
    
    public override func conforms(to aProtocol: Protocol) -> Bool {
        
        guard protocol_conformsToProtocol(aProtocol, UIScrollViewDelegate.self) ||
            protocol_conformsToProtocol(aProtocol, UIScrollViewAccessibilityDelegate.self) else {
                return super.conforms(to: aProtocol)
        }
        
        guard let proxy = delegateProxy     else { return super.conforms(to: aProtocol) }
        guard proxy.conforms(to: aProtocol) else { return super.conforms(to: aProtocol) }
        return true
    }
    
    // MARK: - Scroll Controller Protocols
    // =================================================================================================================
    public func connect(to scrollView: UIScrollView) {
        scrollView.delegate = self
    }
    
    // MARK: - Scroll Controller Protocols
    // =================================================================================================================
    
    // MARK: - UIScrollViewDelegate
    // =================================================================================================================
    @available(iOS 2.0, *)
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegateDidScroll?.run(self,scrollView)
    }
    
    @available(iOS 3.2, *)
    public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        delegateDidZoom?.run(self,scrollView)
    }
    
    @available(iOS 2.0, *)
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        delegateWillBeginDragging?.run(self,scrollView)
    }
    
    @available(iOS 5.0, *)
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        delegateWillEndDragging?.run(self,scrollView,velocity,targetContentOffset)
    }
    
    @available(iOS 2.0, *)
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        delegateDidEndDragging?.run(self,scrollView,decelerate)
    }
    
    @available(iOS 2.0, *)
    public func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        delegateWillBeginDecelerating?.run(self,scrollView)
    }
    
    @available(iOS 2.0, *)
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        delegateDidEndDecelerating?.run(self,scrollView)
    }
    
    @available(iOS 2.0, *)
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        delegateDidEndScrollingAnimation?.run(self,scrollView)
    }
    
    @available(iOS 2.0, *)
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return delegateViewForZooming?.run(self,scrollView)
    }
    
    @available(iOS 3.2, *)
    public func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        delegateWillBeginZooming?.run(self,scrollView,view)
    }
    
    @available(iOS 2.0, *)
    public func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        delegateDidEndZooming?.run(self,scrollView,view,scale)
    }
    
    @available(iOS 2.0, *)
    public func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return delegateShouldScrollToTop?.run(self,scrollView) ?? true
    }
    
    @available(iOS 2.0, *)
    public func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        delegateDidScrollToTop?.run(self,scrollView)
    }

    @available(iOS 11.0, *)
    public func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        delegateDidChangeAdjustedContentInset?.run(self,scrollView)
    }
    
    // MARK: - UIScrollViewAccessibilityDelegate
    @available(iOS 2.0, *)
    public func accessibilityScrollStatus(for scrollView: UIScrollView) -> String? {
        return accessibilityDelegateScrollStatus?.run(self,scrollView)
    }
    
    @available(iOS 11.0, *)
    public func accessibilityAttributedScrollStatus(for scrollView: UIScrollView) -> NSAttributedString? {
        return accessibilityDelegateAttributedScrollStatus?.run(self,scrollView)
    }
}
// MARK: - Scroll Controller Protocols
// =================================================================================================================
extension AFSScrollController {
    
    fileprivate func canRespondsToScrollViewDelegateMethod(for aSelector: Selector!) -> Bool {
        
        if #available(iOS 2.0, *) {
            
            switch aSelector {
            case #selector(UIScrollViewDelegate.scrollViewDidScroll(_:)):
                guard delegateDidScroll         != nil else { break }
                return true
                
            case #selector(UIScrollViewDelegate.scrollViewWillBeginDragging(_:)):
                guard delegateWillBeginDragging != nil else { break }
                return true
                
            case #selector(UIScrollViewDelegate.scrollViewDidEndDragging(_:willDecelerate:)):
                guard delegateDidEndDragging    != nil else { break }
                return true
                
            case #selector(UIScrollViewDelegate.scrollViewWillBeginDecelerating(_:)):
                guard delegateWillBeginDecelerating != nil else { break }
                return true
                
            case #selector(UIScrollViewDelegate.scrollViewDidEndDecelerating(_:)):
                guard delegateDidEndDecelerating != nil else { break }
                return true
                
            case #selector(UIScrollViewDelegate.scrollViewDidEndScrollingAnimation(_:)):
                guard delegateDidEndScrollingAnimation != nil else { break }
                return true
                
            case #selector(UIScrollViewDelegate.viewForZooming(in:)):
                guard delegateViewForZooming    != nil else { break }
                return true
                
            case #selector(UIScrollViewDelegate.scrollViewDidEndZooming(_:with:atScale:)):
                guard delegateDidEndZooming     != nil else { break }
                return true
                
            case #selector(UIScrollViewDelegate.scrollViewShouldScrollToTop(_:)):
                guard delegateShouldScrollToTop != nil else { break }
                return true
                
            case #selector(UIScrollViewDelegate.scrollViewDidScrollToTop(_:)):
                guard delegateDidScrollToTop    != nil else { break }
                return true
                
            default:
                break
            }
        }
        
        if #available(iOS 3.2, *) {
            
            switch aSelector {
            case #selector(UIScrollViewDelegate.scrollViewWillBeginZooming(_:with:)):
                guard delegateWillBeginZooming != nil else { break }
                return true
                
            case #selector(UIScrollViewDelegate.scrollViewDidZoom(_:)):
                guard delegateDidZoom != nil else { break }
                return true
                
            default:
                break
            }
        }
        
        if #available(iOS 5.0, *) {
            
            switch aSelector {
            case #selector(UIScrollViewDelegate.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)):
                guard delegateWillEndDragging != nil else { break }
                return true
                
            default:
                break
            }
        }
        
        if #available(iOS 11.0, *) {
            
            switch aSelector {
            case #selector(UIScrollViewDelegate.scrollViewDidChangeAdjustedContentInset(_:)):
                guard delegateDidChangeAdjustedContentInset != nil else { break }
                return true
            default:
                break
            }
        }
        
        return false
    }
    fileprivate func canRespondsToScrollViewAccessibilityDelegateMethod(for aSelector: Selector!) -> Bool {
        
        if #available(iOS 2.0, *) {
            switch aSelector {
            case #selector(UIScrollViewAccessibilityDelegate.accessibilityScrollStatus(for:)):
                guard accessibilityDelegateScrollStatus != nil else { break }
                return true
            default:
                break
            }
        }
        
        if #available(iOS 11.0, *) {
            switch aSelector {
            case #selector(UIScrollViewAccessibilityDelegate.accessibilityAttributedScrollStatus(for:)):
                guard accessibilityDelegateAttributedScrollStatus != nil else { break }
                return true
            default:
                break
            }
        }
        
        return false
    }
}
