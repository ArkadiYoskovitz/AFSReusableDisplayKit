//
//  AFSCollectionLogicHandlersTypealias.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/19/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit
//
// MARK: - UICollectionViewDataSource
// =====================================================================================================================
@available(iOS 6.0, *)
public typealias AFSCollectionHandlersDataSourceSectionsCount              <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView) -> Int
@available(iOS 6.0, *)
public typealias AFSCollectionHandlersDataSourceItemCountInSection         <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,Int) -> Int
@available(iOS 6.0, *)
public typealias AFSCollectionHandlersDataSourceItemConfiguration          <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,IndexPath) -> UICollectionViewCell
@available(iOS 6.0, *)
public typealias AFSCollectionHandlersDataSourceSupplementary              <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,String,IndexPath) -> UICollectionReusableView
@available(iOS 9.0, *)
public typealias AFSCollectionHandlersDataSourceCanMove                    <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,IndexPath) -> Bool
@available(iOS 9.0, *)
public typealias AFSCollectionHandlersDataSourceMoveRow                    <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,IndexPath,IndexPath) -> Void
@available(iOS 6.0, *)
public typealias AFSCollectionHandlersDataSourceSectionIndexTitles         <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView) -> [String]?
@available(iOS 6.0, *)
public typealias AFSCollectionHandlersDataSourceSectionForSectionIndexTitle<DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,String,Int) -> IndexPath

// MARK: - UICollectionViewDataSourcePrefetching
// =====================================================================================================================
@available(iOS 10.0, *)
public typealias AFSCollectionHandlersDataSourcePrefetch<DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,[IndexPath]) -> Void

// MARK: - UICollectionViewDelegate
// =====================================================================================================================
@available(iOS 6.0, *)
public typealias AFSCollectionHandlersDelegateItemShouldHighlight       <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,IndexPath) -> Bool
@available(iOS 6.0, *)
public typealias AFSCollectionHandlersDelegateItemHighlightAction       <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,IndexPath) -> Void
@available(iOS 6.0, *)
public typealias AFSCollectionHandlersDelegateItemShouldSelection       <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,IndexPath) -> Bool
@available(iOS 6.0, *)
public typealias AFSCollectionHandlersDelegateItemSelectAction          <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,IndexPath) -> Void
@available(iOS 8.0, *)
public typealias AFSCollectionHandlersDelegateWillDisplayItem           <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,UICollectionViewCell,IndexPath) -> Void
@available(iOS 8.0, *)
public typealias AFSCollectionHandlersDelegateWillDisplaySupplementary  <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,UICollectionReusableView,String,IndexPath) -> Void
@available(iOS 6.0, *)
public typealias AFSCollectionHandlersDelegateDidEndDisplayItem         <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,UICollectionViewCell,IndexPath) -> Void
@available(iOS 6.0, *)
public typealias AFSCollectionHandlersDelegateDidEndDisplaySupplementary<DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,UICollectionReusableView,String,IndexPath) -> Void
@available(iOS 6.0, *)
public typealias AFSCollectionHandlersDelegateShouldShowMenu            <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,IndexPath) -> Bool
@available(iOS 6.0, *)
public typealias AFSCollectionHandlersDelegateCanSelectorActionForRow   <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,Selector,IndexPath,Any?) -> Bool
@available(iOS 6.0, *)
public typealias AFSCollectionHandlersDelegateSelectorActionForRow      <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,Selector,IndexPath,Any?) -> Void
@available(iOS 7.0, *)
public typealias AFSCollectionHandlersDelegateTransitionLayoutFromTo    <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,UICollectionViewLayout,UICollectionViewLayout) -> UICollectionViewTransitionLayout
@available(iOS 9.0, *)
public typealias AFSCollectionHandlersDelegateCanFocusRowAtIndexPath    <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,IndexPath) -> Bool
@available(iOS 9.0, *)
public typealias AFSCollectionHandlersDelegateShouldUpdateFocusInContext<DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,UICollectionViewFocusUpdateContext) -> Bool
@available(iOS 9.0, *)
public typealias AFSCollectionHandlersDelegateDidUpdateFocusInContext   <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,UICollectionViewFocusUpdateContext,UIFocusAnimationCoordinator) -> Void
@available(iOS 9.0, *)
public typealias AFSCollectionHandlersDelegateIndexPathForPreferredView <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView) -> IndexPath?
@available(iOS 9.0, *)
public typealias AFSCollectionHandlersDelegateRowFromSourceToDestination<DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,IndexPath,IndexPath) -> IndexPath
@available(iOS 9.0, *)
public typealias AFSCollectionHandlersDelegateTargetContentOffset       <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,CGPoint) -> CGPoint
@available(iOS 11.0, *)
public typealias AFSCollectionHandlersDelegateShouldSpringLoad          <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,IndexPath,UISpringLoadedInteractionContext) -> Bool

// MARK: - UICollectionViewDragDelegate
// =====================================================================================================================
@available(iOS 11.0, *)
public typealias AFSCollectionHandlersDragDelegateBeginningSessionAt    <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,UIDragSession,IndexPath) -> [UIDragItem]
@available(iOS 11.0, *)
public typealias AFSCollectionHandlersDragDelegateAddingToSessionAtPoint<DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,UIDragSession,IndexPath,CGPoint) -> [UIDragItem]
@available(iOS 11.0, *)
public typealias AFSCollectionHandlersDragDelegateDragSessionVoidBlock  <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,UIDragSession) -> Void
@available(iOS 11.0, *)
public typealias AFSCollectionHandlersDragDelegateDragSessionBoolBlock  <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,UIDragSession) -> Bool
@available(iOS 11.0, *)
public typealias AFSCollectionHandlersDragDelegateDragPreviewParameters <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,IndexPath) -> UIDragPreviewParameters?

// MARK: - UICollectionViewDropDelegate
// =====================================================================================================================
@available(iOS 11.0, *)
public typealias AFSCollectionHandlersDropDelegatePerformDropCoordinator  <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,UICollectionViewDropCoordinator) -> Void
@available(iOS 11.0, *)
public typealias AFSCollectionHandlersDropDelegateDropSessionBoolBlock    <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,UIDropSession) -> Bool
@available(iOS 11.0, *)
public typealias AFSCollectionHandlersDropDelegateDropSessionVoidBlock    <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,UIDropSession) -> Void
@available(iOS 11.0, *)
public typealias AFSCollectionHandlersDropDelegateDidUpdateWithDestination<DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,UIDropSession,IndexPath?) -> UICollectionViewDropProposal
@available(iOS 11.0, *)
public typealias AFSCollectionHandlersDropDelegateDropPreviewParameters   <DS:AFSMetadataDataSource> = (AFSCollectionController<DS>,UICollectionView,IndexPath) -> UIDragPreviewParameters?
