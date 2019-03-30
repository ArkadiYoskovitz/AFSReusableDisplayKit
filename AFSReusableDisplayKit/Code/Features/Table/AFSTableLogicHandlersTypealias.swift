//
//  AFSTableLogicHandlersTypealias.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/18/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

// MARK: - UITableViewDataSource
// =====================================================================================================================
@available(iOS 2.0, *)
public typealias AFSTableHandlersDataSourceSectionsCount              <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView) -> Int
@available(iOS 2.0, *)
public typealias AFSTableHandlersDataSourceRowCountInSection          <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,Int) -> Int
@available(iOS 2.0, *)
public typealias AFSTableHandlersDataSourceCellConfiguration          <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> UITableViewCell
@available(iOS 2.0, *)
public typealias AFSTableHandlersDataSourceSectionTitle               <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,Int) -> String?
@available(iOS 2.0, *)
public typealias AFSTableHandlersDataSourceCanEditRow                 <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> Bool
@available(iOS 2.0, *)
public typealias AFSTableHandlersDataSourceCommitForRow               <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,UITableViewCell.EditingStyle,IndexPath) -> Void

@available(iOS 2.0, *)
public typealias AFSTableHandlersDataSourceSectionIndexTitles         <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView) -> [String]?
@available(iOS 2.0, *)
public typealias AFSTableHandlersDataSourceSectionForSectionIndexTitle<DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,String,Int) -> Int
@available(iOS 2.0, *)
public typealias AFSTableHandlersDataSourceCanMove                    <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> Bool
@available(iOS 2.0, *)
public typealias AFSTableHandlersDataSourceMoveRow                    <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath,IndexPath) -> Void

// MARK: - UITableViewDataSourcePrefetching
// =====================================================================================================================
@available(iOS 2.0, *)
public typealias AFSTableHandlersDataSourcePrefetch                   <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,[IndexPath]) -> Void

// MARK: - UITableViewDelegate
// =====================================================================================================================
@available(iOS 2.0, *)
public typealias AFSTableHandlersDelegateDisplayCell                  <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,UITableViewCell,IndexPath) -> Void
@available(iOS 2.0, *)
public typealias AFSTableHandlersDelegateDisplayHeader                <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,UIView,Int) -> Void
@available(iOS 2.0, *)
public typealias AFSTableHandlersDelegateDisplayFooter                <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,UIView,Int) -> Void
@available(iOS 2.0, *)
public typealias AFSTableHandlersDelegateHeightCell                   <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> CGFloat
@available(iOS 2.0, *)
public typealias AFSTableHandlersDelegateHeightHeader                 <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,Int) -> CGFloat
@available(iOS 2.0, *)
public typealias AFSTableHandlersDelegateHeightFooter                 <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,Int) -> CGFloat
@available(iOS 2.0, *)
public typealias AFSTableHandlersDelegateSectionView                  <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,Int) -> UIView?
@available(iOS 2.0, *)
public typealias AFSTableHandlersDelegateAccessoryTap                 <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> Void
@available(iOS 6.0, *)
public typealias AFSTableHandlersDelegateCellShouldHighlight          <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> Bool
@available(iOS 6.0, *)
public typealias AFSTableHandlersDelegateCellHighlightAction          <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> Void
@available(iOS 2.0, *)
public typealias AFSTableHandlersDelegateCellSelection                <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> IndexPath?
@available(iOS 3.0, *)
public typealias AFSTableHandlersDelegateCellSelectAction             <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> Void
@available(iOS 2.0, *)
public typealias AFSTableHandlersDelegateCellEditingStyle             <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> UITableViewCell.EditingStyle
@available(iOS 3.0, *)
public typealias AFSTableHandlersDelegateCellTitleForDelete           <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> String?
@available(iOS 8.0, *)
public typealias AFSTableHandlersDelegateEditActionsForRow            <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> [UITableViewRowAction]?
@available(iOS 11.0, *)
public typealias AFSTableHandlersDelegateSwipeActionsConfiguration    <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> UISwipeActionsConfiguration?
@available(iOS 2.0, *)
public typealias AFSTableHandlersDelegateShouldIndentWhileEditingRow  <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> Bool
@available(iOS 2.0, *)
public typealias AFSTableHandlersDelegateWillBeginEditingRowAt        <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> Void
@available(iOS 2.0, *)
public typealias AFSTableHandlersDelegateDidEndEditingRowAt           <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath?) -> Void
@available(iOS 2.0, *)
public typealias AFSTableHandlersDelegateMoveAction                   <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath,IndexPath) -> IndexPath
@available(iOS 2.0, *)
public typealias AFSTableHandlersDelegateIndentationLevel             <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> Int
@available(iOS 5.0, *)
public typealias AFSTableHandlersDelegateShouldShowMenu               <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> Bool
@available(iOS 5.0, *)
public typealias AFSTableHandlersDelegateCanSelectorActionForRow      <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,Selector,IndexPath,Any?) -> Bool
@available(iOS 5.0, *)
public typealias AFSTableHandlersDelegateSelectorActionForRow         <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,Selector,IndexPath,Any?) -> Void
@available(iOS 9.0, *)
public typealias AFSTableHandlersDelegateCanFocusRowAtIndexPath       <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> Bool
@available(iOS 9.0, *)
public typealias AFSTableHandlersDelegateShouldUpdateFocusInContext   <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,UITableViewFocusUpdateContext) -> Bool
@available(iOS 9.0, *)
public typealias AFSTableHandlersDelegateDidUpdateFocusInContext      <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,UITableViewFocusUpdateContext,UIFocusAnimationCoordinator) -> Void
@available(iOS 9.0, *)
public typealias AFSTableHandlersDelegateIndexPathForPreferredView    <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView) -> IndexPath?
@available(iOS 11.0, *)
public typealias AFSTableHandlersDelegateShouldSpringLoad             <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath,UISpringLoadedInteractionContext) -> Bool

// MARK: - UITableViewDragDelegate
// =====================================================================================================================
@available(iOS 11.0, *)
public typealias AFSTableHandlersDragDelegateBeginningSessionAt       <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,UIDragSession,IndexPath) -> [UIDragItem]
@available(iOS 11.0, *)
public typealias AFSTableHandlersDragDelegateAddingToSessionAtPoint   <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,UIDragSession,IndexPath,CGPoint) -> [UIDragItem]
@available(iOS 11.0, *)
public typealias AFSTableHandlersDragDelegateDragPreviewParameters    <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> UIDragPreviewParameters?
@available(iOS 11.0, *)
public typealias AFSTableHandlersDragDelegateDragSessionVoidBlock     <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,UIDragSession) -> Void
@available(iOS 11.0, *)
public typealias AFSTableHandlersDragDelegateDragSessionBoolBlock     <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,UIDragSession) -> Bool

// MARK: - UITableViewDropDelegate
// =====================================================================================================================
@available(iOS 11.0, *)
public typealias AFSTableHandlersDropDelegatePerformDropCoordinator   <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,UITableViewDropCoordinator) -> Void
@available(iOS 11.0, *)
public typealias AFSTableHandlersDropDelegateDropSessionBoolBlock     <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,UIDropSession) -> Bool
@available(iOS 11.0, *)
public typealias AFSTableHandlersDropDelegateDropSessionVoidBlock     <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,UIDropSession) -> Void
@available(iOS 11.0, *)
public typealias AFSTableHandlersDropDelegateDidUpdateWithDestination <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,UIDropSession,IndexPath?) -> UITableViewDropProposal
@available(iOS 11.0, *)
public typealias AFSTableHandlersDropDelegateDropPreviewParameters    <DS:AFSMetadataDataSource> = (AFSTableController<DS>,UITableView,IndexPath) -> UIDragPreviewParameters?
