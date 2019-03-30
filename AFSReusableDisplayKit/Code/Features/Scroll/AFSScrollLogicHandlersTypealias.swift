//
//  AFSScrollLogicHandlersTypealias.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/20/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit
///
///
///
/// ================================================================================================================ ///
@available(iOS 2.0, *)
public typealias AFSScrollHandlersDelegateDidScroll                          <DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView) -> Void
@available(iOS 3.2, *)
public typealias AFSScrollHandlersDelegateDidZoom                            <DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView) -> Void
@available(iOS 2.0, *)
public typealias AFSScrollHandlersDelegateWillBeginDragging                  <DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView) -> Void
@available(iOS 5.0, *)
public typealias AFSScrollHandlersDelegateWillEndDragging                    <DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView,CGPoint,UnsafeMutablePointer<CGPoint>) -> Void
@available(iOS 2.0, *)
public typealias AFSScrollHandlersDelegateDidEndDragging                     <DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView,Bool) -> Void
@available(iOS 2.0, *)
public typealias AFSScrollHandlersDelegateWillBeginDecelerating              <DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView) -> Void
@available(iOS 2.0, *)
public typealias AFSScrollHandlersDelegateDidEndDecelerating                 <DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView) -> Void
@available(iOS 2.0, *)
public typealias AFSScrollHandlersDelegateDidEndScrollingAnimation           <DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView) -> Void
@available(iOS 2.0, *)
public typealias AFSScrollHandlersDelegateViewForZooming                     <DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView) -> UIView?
@available(iOS 3.2, *)
public typealias AFSScrollHandlersDelegateWillBeginZooming                   <DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView,UIView?) -> Void
@available(iOS 2.0, *)
public typealias AFSScrollHandlersDelegateDidEndZooming                      <DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView,UIView?,CGFloat) -> Void
@available(iOS 2.0, *)
public typealias AFSScrollHandlersDelegateShouldScrollToTop                  <DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView) -> Bool
@available(iOS 2.0, *)
public typealias AFSScrollHandlersDelegateDidScrollToTop                     <DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView) -> Void
@available(iOS 11.0, *)
public typealias AFSScrollHandlersDelegateDidChangeAdjustedContentInset      <DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView) -> Void
///
///
///
/// ================================================================================================================ ///
@available(iOS 2.0, *)
public typealias AFSScrollHandlersAccessibilityDelegateScrollStatus          <DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView) -> String?
@available(iOS 11.0, *)
public typealias AFSScrollHandlersAccessibilityDelegateAttributedScrollStatus<DS:AFSMetadataDataSource> = (AFSScrollController<DS>,UIScrollView) -> NSAttributedString?
