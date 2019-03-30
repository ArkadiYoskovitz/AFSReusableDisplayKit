//
//  AFSScrollControllerBuilder.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/20/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit
///
///
///
public class AFSScrollControllerBuilder<DataSource> : AFSReusableElementsControllerBuilder<DataSource> where DataSource : AFSMetadataDataSource
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
    private var _delegateWillBeginZooming              : Any?
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
    ///
    ///
    ///
    public override init(displayType: AFSReusableDisplayKit.DisplayType = .scroll)
    {
        super.init(displayType: displayType)
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
    public func build() -> AFSScrollController<DataSource>?
    {
        
        let controller = AFSScrollController<DataSource>(identifierLogic: identifierLogic)
        applyScrollBlocks(to: controller)
        return controller
    }
    
    ///
    /// Applay delegate Blocks to scroll controller
    ///
    public final func applyScrollBlocks(to controller: AFSScrollController<DataSource>)
    {
        
        if #available(iOS 2.0, *) {
            controller.delegateDidScroll                = delegateDidScroll
            controller.delegateWillBeginDragging        = delegateWillBeginDragging
            controller.delegateDidEndDragging           = delegateDidEndDragging
            controller.delegateWillBeginDecelerating    = delegateWillBeginDecelerating
            controller.delegateDidEndDecelerating       = delegateDidEndDecelerating
            controller.delegateDidEndScrollingAnimation = delegateDidEndScrollingAnimation
            controller.delegateViewForZooming           = delegateViewForZooming
            controller.delegateDidEndZooming            = delegateDidEndZooming
            controller.delegateShouldScrollToTop        = delegateShouldScrollToTop
            controller.delegateDidScrollToTop           = delegateDidScrollToTop
        }
        if #available(iOS 3.2, *) {
            controller.delegateDidZoom          = delegateDidZoom
            controller.delegateWillBeginZooming = delegateWillBeginZooming
        }
        
        if #available(iOS 5.0, *) {
            controller.delegateWillEndDragging = delegateWillEndDragging
        }
        if #available(iOS 11.0, *) {
            controller.delegateDidChangeAdjustedContentInset = delegateDidChangeAdjustedContentInset
        }
    }
}
// MARK: -
extension AFSScrollControllerBuilder { // MARK: UIScrollDelegate
    
    // MARK: -
    
    ///
    /// Set a new behavior for UIScrollDelegate method `scrollViewDidScroll(_:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateDidScroll(handler block: AFSScrollHandlersDelegateDidScroll<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateDidScroll = AFSScrollDelegateDidScroll<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UIScrollDelegate method `scrollViewDidZoom(_:)`.
    ///
    @available(iOS 3.2, *)
    @discardableResult public func setDelegateDidZoom(handler block: AFSScrollHandlersDelegateDidZoom<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateDidZoom = AFSScrollDelegateDidZoom<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UIScrollDelegate method `scrollViewWillBeginDragging(_:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateWillBeginDragging(handler block: AFSScrollHandlersDelegateWillBeginDragging<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateWillBeginDragging = AFSScrollDelegateWillBeginDragging<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UIScrollDelegate method `scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)`.
    ///
    @available(iOS 5.0, *)
    @discardableResult public func setDelegateWillEndDragging(handler block: AFSScrollHandlersDelegateWillEndDragging<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateWillEndDragging = AFSScrollDelegateWillEndDragging<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UIScrollDelegate method `scrollViewDidEndDragging(_:willDecelerate:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateDidEndDragging(handler block: AFSScrollHandlersDelegateDidEndDragging<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateDidEndDragging = AFSScrollDelegateDidEndDragging<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UIScrollDelegate method `scrollViewWillBeginDecelerating(_:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateWillBeginDecelerating(handler block: AFSScrollHandlersDelegateWillBeginDecelerating<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateWillBeginDecelerating = AFSScrollDelegateWillBeginDecelerating<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UIScrollDelegate method `scrollViewDidEndDecelerating(_:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateDidEndDecelerating(handler block: AFSScrollHandlersDelegateDidEndDecelerating<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateDidEndDecelerating = AFSScrollDelegateDidEndDecelerating<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UIScrollDelegate method `scrollViewDidEndScrollingAnimation(_:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateDidEndScrollingAnimation(handler block: AFSScrollHandlersDelegateDidEndScrollingAnimation<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateDidEndScrollingAnimation = AFSScrollDelegateDidEndScrollingAnimation<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UIScrollDelegate method `viewForZooming(in:) -> UIView?`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateViewForZooming(handler block: AFSScrollHandlersDelegateViewForZooming<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateViewForZooming = AFSScrollDelegateViewForZooming<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UIScrollDelegate method `scrollViewWillBeginZooming(_:with:)`.
    ///
    @available(iOS 3.2, *)
    @discardableResult public func setDelegateWillBeginZooming(handler block: AFSScrollHandlersDelegateWillBeginZooming<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateWillBeginZooming = AFSScrollDelegateWillBeginZooming<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UIScrollDelegate method `scrollViewDidEndZooming(_:with:atScale:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateDidEndZooming(handler block: AFSScrollHandlersDelegateDidEndZooming<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateDidEndZooming = AFSScrollDelegateDidEndZooming<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UIScrollDelegate method `scrollViewShouldScrollToTop(_:) -> Bool`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateShouldScrollToTop(handler block: AFSScrollHandlersDelegateShouldScrollToTop<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateShouldScrollToTop = AFSScrollDelegateShouldScrollToTop<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UIScrollDelegate method `scrollViewDidScrollToTop(_:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateDidScrollToTop(handler block: AFSScrollHandlersDelegateDidScrollToTop<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateDidScrollToTop = AFSScrollDelegateDidScrollToTop<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UIScrollDelegate method `scrollViewDidChangeAdjustedContentInset(_:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDidChangeAdjustedContentInset(handler block: AFSScrollHandlersDelegateDidChangeAdjustedContentInset<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.delegateDidChangeAdjustedContentInset = AFSScrollDelegateDidChangeAdjustedContentInset<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///// UIScrollViewAccessibilityDelegate
    
    ///
    /// Set a new behavior for UIScrollDelegate method `scrollViewDidChangeAdjustedContentInset(_:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setAccessibilityDelegateScrollStatus(handler block: AFSScrollHandlersAccessibilityDelegateScrollStatus<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.accessibilityDelegateScrollStatus = AFSScrollAccessibilityDelegateScrollStatus<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Set a new behavior for UIScrollDelegate method `scrollViewDidChangeAdjustedContentInset(_:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setAccessibilityDelegateAttributedScrollStatus(handler block: AFSScrollHandlersAccessibilityDelegateAttributedScrollStatus<DataSource>?) -> Self {
        
        if let handlerBlock = block {
            self.accessibilityDelegateAttributedScrollStatus = AFSScrollAccessibilityDelegateAttributedScrollStatus<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
}

