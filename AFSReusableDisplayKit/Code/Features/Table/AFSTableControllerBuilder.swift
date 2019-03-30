//
//  AFSTableControllerBuilder.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/18/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//
import UIKit
///
///
///
public protocol AFSTableControllerBuilderProtocol : AFSReusableElementsControllerBuilderProtocol {
    
    // MARK: Header
    func   registerHeader<Element,ViewModel>(via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String, displayElement: Element.Type, displayModel: ViewModel.Type, displayConfiguration handler: @escaping ElementConfiguration<Element,ViewModel>)
    
    func unregisterHeader(via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String)
    
    // MARK: Cells
    func   registerCell<Element,ViewModel>(via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String, displayElement: Element.Type, displayModel: ViewModel.Type, displayConfiguration handler: @escaping ElementConfiguration<Element,ViewModel>)
    
    func unregisterCell(via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String)
    
    // MARK: Footer
    func   registerFooter<Element,ViewModel>(via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String, displayElement: Element.Type, displayModel: ViewModel.Type, displayConfiguration handler: @escaping ElementConfiguration<Element,ViewModel>)
    
    func unregisterFooter(via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String)
}
///
///
///
public final class AFSTableControllerBuilder<DataSource> : AFSScrollControllerBuilder<DataSource>
    where DataSource : AFSMetadataDataSource
{
    /// MARK: - typealias
    public typealias ElementsController = AFSTableController<DataSource>
    public typealias TableBehavior = AFSTableController<DataSource>.TableBehavior
    
    // MARK: - Stored Properties
    public internal(set) var configurator    : AFSTableElementsConfigurator! {
        get { return super.baseConfigurator as? AFSTableElementsConfigurator }
        set { super.baseConfigurator = newValue                                       }
    }
    
    public internal(set) var currentBehavior : TableBehavior = [.dataSourceBasic] {
        willSet { assert(newValue.contains(.dataSourceBasic), "Input paramater must contain .dataSourceBasic. It may contain additional Behaviors as needed") }
    }
    
    // MARK: Logic holder - UITableViewDataSource
    // MARK: - Stored Properties - UITableViewDataSource
    private var _dataSourceNumberOfSections                   : Any?
    private var _dataSourceNumberOfRowsInSection              : Any?
    private var _dataSourceCellForRawAtIndexPath              : Any?
    private var _dataSourceTitleForHeaderInSection            : Any?
    private var _dataSourceTitleForFooterInSection            : Any?
    private var _dataSourceCanEditRowAtIndexPath              : Any?
    private var _dataSourceCommitForRowAtIndexPath            : Any?
    private var _dataSourceSectionIndexTitles                 : Any?
    private var _dataSourceSectionForSectionIndexTitleAtIndex : Any?
    private var _dataSourceCanMoveRowAtIndexPath              : Any?
    private var _dataSourceMoveRowFromSourceToDestination     : Any?
    
    // MARK: - Access Properties - UITableViewDataSource
    @available(iOS 2.0, *)
    fileprivate var dataSourceNumberOfSections                   : AFSTableDataSourceSectionsCount<DataSource>? {
        get { return _dataSourceNumberOfSections as? AFSTableDataSourceSectionsCount<DataSource> }
        set { _dataSourceNumberOfSections = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var dataSourceNumberOfRowsInSection              : AFSTableDataSourceRowCountInSection<DataSource>? {
        get { return _dataSourceNumberOfRowsInSection as? AFSTableDataSourceRowCountInSection<DataSource> }
        set { _dataSourceNumberOfRowsInSection = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var dataSourceCellForRawAtIndexPath              : AFSTableDataSourceCellConfiguration<DataSource>? {
        get { return _dataSourceCellForRawAtIndexPath as? AFSTableDataSourceCellConfiguration<DataSource> }
        set { _dataSourceCellForRawAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var dataSourceTitleForHeaderInSection            : AFSTableDataSourceSectionTitle<DataSource>? {
        get { return _dataSourceTitleForHeaderInSection as? AFSTableDataSourceSectionTitle<DataSource> }
        set { _dataSourceTitleForHeaderInSection = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var dataSourceTitleForFooterInSection            : AFSTableDataSourceSectionTitle<DataSource>? {
        get { return _dataSourceTitleForFooterInSection as? AFSTableDataSourceSectionTitle<DataSource> }
        set { _dataSourceTitleForFooterInSection = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var dataSourceCanEditRowAtIndexPath              : AFSTableDataSourceCanEditRow<DataSource>? {
        get { return _dataSourceCanEditRowAtIndexPath as? AFSTableDataSourceCanEditRow<DataSource> }
        set { _dataSourceCanEditRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var dataSourceCommitForRowAtIndexPath            : AFSTableDataSourceCommitForRow<DataSource>? {
        get { return _dataSourceCommitForRowAtIndexPath as? AFSTableDataSourceCommitForRow<DataSource> }
        set { _dataSourceCommitForRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var dataSourceSectionIndexTitles                 : AFSTableDataSourceSectionIndexTitles<DataSource>?{
        get { return _dataSourceSectionIndexTitles as? AFSTableDataSourceSectionIndexTitles<DataSource> }
        set { _dataSourceSectionIndexTitles = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var dataSourceSectionForSectionIndexTitleAtIndex : AFSTableDataSourceSectionForSectionIndexTitle<DataSource>? {
        get { return _dataSourceSectionForSectionIndexTitleAtIndex as? AFSTableDataSourceSectionForSectionIndexTitle<DataSource> }
        set { _dataSourceSectionForSectionIndexTitleAtIndex = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var dataSourceCanMoveRowAtIndexPath              : AFSTableDataSourceCanMove<DataSource>? {
        get { return _dataSourceCanMoveRowAtIndexPath as? AFSTableDataSourceCanMove<DataSource> }
        set { _dataSourceCanMoveRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var dataSourceMoveRowFromSourceToDestination     : AFSTableDataSourceMoveRow<DataSource>? {
        get { return _dataSourceMoveRowFromSourceToDestination as? AFSTableDataSourceMoveRow<DataSource> }
        set { _dataSourceMoveRowFromSourceToDestination = newValue }
    }
    
    // MARK: - Stored Properties - UITableViewDataSourcePrefetching
    private var _prefetchingDataSourcePrefetchRowsAtIndexPaths             : Any?
    private var _prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths : Any?
    
    // MARK: - Access Properties - UITableViewDataSourcePrefetching
    @available(iOS 2.0, *)
    fileprivate var prefetchingDataSourcePrefetchRowsAtIndexPaths             : AFSTableDataSourcePrefetch<DataSource>? {
        get { return _prefetchingDataSourcePrefetchRowsAtIndexPaths as? AFSTableDataSourcePrefetch<DataSource> }
        set { _prefetchingDataSourcePrefetchRowsAtIndexPaths = newValue }
    }
    
    @available(iOS 2.0, *)
    fileprivate var prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths : AFSTableDataSourcePrefetch<DataSource>? {
        get { return _prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths as? AFSTableDataSourcePrefetch<DataSource> }
        set { _prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths = newValue }
    }
    
    // MARK: Logic holder - UITableViewDelegate
    // MARK: - Stored Properties - UITableViewDelegate
    private var _delegateWillDisplayCellForRowAtIndexPath    : Any?
    private var _delegateWillDisplayHeaderViewForSection     : Any?
    private var _delegateWillDisplayFooterViewForSection     : Any?
    
    private var _delegateEndDisplayingCellForRowAtIndexPath  : Any?
    private var _delegateEndDisplayingHeaderViewForSection   : Any?
    private var _delegateEndDisplayingFooterViewForSection   : Any?
    
    private var _delegateHeightForRowAtIndexPath             : Any?
    private var _delegateHeightForHeaderInSection            : Any?
    private var _delegateHeightForFooterInSection            : Any?
    
    private var _delegateEstimatedHeightForRowAtIndexPath    : Any?
    private var _delegateEstimatedHeightForHeaderInSection   : Any?
    private var _delegateEstimatedHeightForFooterInSection   : Any?
    
    private var _delegateViewForHeaderInSection              : Any?
    private var _delegateViewForFooterInSection              : Any?
    
    private var _delegateAccessoryButtonTappedForRowWithIndexPath : Any?
    
    private var _delegateShouldHighlightRowAtIndexPath       : Any?
    private var _delegateDidHighlightRowAtIndexPath          : Any?
    private var _delegateDidUnhighlightRowAtIndexPath        : Any?
    
    private var _delegateWillSelectRowAtIndexPath            : Any?
    private var _delegateWillDeselectRowAtIndexPath          : Any?
    private var _delegateDidSelectRowAtIndexPath             : Any?
    private var _delegateDidDeselectRowAtIndexPath           : Any?
    
    private var _delegateEditingStyleForRowAtIndexPath                      : Any?
    private var _delegateTitleForDeleteConfirmationButtonForRowAtIndexPath  : Any?
    private var _delegateEditActionsForRowAtIndexPath                       : Any?
    
    private var _delegateLeadingSwipeActionsConfigurationForRowAtIndexPath  : Any?
    private var _delegateTrailingSwipeActionsConfigurationForRowAtIndexPath : Any?
    
    private var _delegateShouldIndentWhileEditingRowAtIndexPath : Any?
    
    private var _delegateWillBeginEditingRowAtIndexPath : Any?
    private var _delegateDidEndEditingRowAtIndexPath    : Any?
    
    private var _delegateTargetIndexPathForMovement : Any?
    
    private var _delegateIndentationLevelForRowAtIndexPath : Any?
    private var _delegateShouldShowMenuForRowAtIndexPath   : Any?
    
    private var _delegateCanPerformActionForRowAtIndexPathWithSender : Any?
    private var _delegatePerformActionForRowAtIndexPathWithSender    : Any?
    
    private var _delegateCanFocusRowAtIndexPath     : Any?
    private var _delegateShouldUpdateFocusInContext : Any?
    
    private var _delegateDidUpdateFocusInContextWithCoordinator    : Any?
    private var _delegateIndexPathForPreferredFocusedView          : Any?
    
    private var _delegateShouldSpringLoadRowAtIndexPathWithContext : Any?
    
    // MARK: - Access Properties - UITableViewDelegate
    @available(iOS 2.0, *)
    fileprivate var delegateWillDisplayCellForRowAtIndexPath    : AFSTableDelegateDisplayCell<DataSource>? {
        get { return _delegateWillDisplayCellForRowAtIndexPath as? AFSTableDelegateDisplayCell<DataSource> }
        set { _delegateWillDisplayCellForRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateWillDisplayHeaderViewForSection     : AFSTableDelegateDisplayHeader<DataSource>? {
        get { return _delegateWillDisplayHeaderViewForSection as? AFSTableDelegateDisplayHeader<DataSource> }
        set { _delegateWillDisplayHeaderViewForSection = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateWillDisplayFooterViewForSection     : AFSTableDelegateDisplayFooter<DataSource>? {
        get { return _delegateWillDisplayFooterViewForSection as? AFSTableDelegateDisplayFooter<DataSource> }
        set { _delegateWillDisplayFooterViewForSection = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateEndDisplayingCellForRowAtIndexPath  : AFSTableDelegateDisplayCell<DataSource>? {
        get { return _delegateEndDisplayingCellForRowAtIndexPath as? AFSTableDelegateDisplayCell<DataSource> }
        set { _delegateEndDisplayingCellForRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateEndDisplayingHeaderViewForSection   : AFSTableDelegateDisplayHeader<DataSource>? {
        get { return _delegateEndDisplayingHeaderViewForSection as? AFSTableDelegateDisplayHeader<DataSource> }
        set { _delegateEndDisplayingHeaderViewForSection = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateEndDisplayingFooterViewForSection   : AFSTableDelegateDisplayFooter<DataSource>? {
        get { return _delegateEndDisplayingFooterViewForSection as? AFSTableDelegateDisplayFooter<DataSource> }
        set { _delegateEndDisplayingFooterViewForSection = newValue }
    }
    
    @available(iOS 2.0, *)
    fileprivate var delegateHeightForRowAtIndexPath             : AFSTableDelegateHeightCell<DataSource>? {
        get { return _delegateHeightForRowAtIndexPath as? AFSTableDelegateHeightCell<DataSource> }
        set { _delegateHeightForRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateHeightForHeaderInSection            : AFSTableDelegateHeightHeader<DataSource>? {
        get { return _delegateHeightForHeaderInSection as? AFSTableDelegateHeightHeader<DataSource> }
        set { _delegateHeightForHeaderInSection = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateHeightForFooterInSection            : AFSTableDelegateHeightFooter<DataSource>? {
        get { return _delegateHeightForFooterInSection as? AFSTableDelegateHeightFooter<DataSource> }
        set { _delegateHeightForFooterInSection = newValue }
    }
    
    @available(iOS 2.0, *)
    fileprivate var delegateEstimatedHeightForRowAtIndexPath    : AFSTableDelegateHeightCell<DataSource>? {
        get { return _delegateEstimatedHeightForRowAtIndexPath as? AFSTableDelegateHeightCell<DataSource> }
        set { _delegateEstimatedHeightForRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateEstimatedHeightForHeaderInSection   : AFSTableDelegateHeightHeader<DataSource>? {
        get { return _delegateEstimatedHeightForHeaderInSection as? AFSTableDelegateHeightHeader<DataSource> }
        set { _delegateEstimatedHeightForHeaderInSection = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateEstimatedHeightForFooterInSection   : AFSTableDelegateHeightFooter<DataSource>? {
        get { return _delegateEstimatedHeightForFooterInSection as? AFSTableDelegateHeightFooter<DataSource> }
        set { _delegateEstimatedHeightForFooterInSection = newValue }
    }
    
    @available(iOS 2.0, *)
    fileprivate var delegateViewForHeaderInSection : AFSTableDelegateSectionView<DataSource>?{
        get { return _delegateViewForHeaderInSection as? AFSTableDelegateSectionView<DataSource> }
        set { _delegateViewForHeaderInSection = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateViewForFooterInSection : AFSTableDelegateSectionView<DataSource>?{
        get { return _delegateViewForFooterInSection as? AFSTableDelegateSectionView<DataSource> }
        set { _delegateViewForFooterInSection = newValue }
    }
    
    @available(iOS 2.0, *)
    fileprivate var delegateAccessoryButtonTappedForRowWithIndexPath : AFSTableDelegateAccessoryTap<DataSource>? {
        get { return _delegateAccessoryButtonTappedForRowWithIndexPath as? AFSTableDelegateAccessoryTap<DataSource> }
        set { _delegateAccessoryButtonTappedForRowWithIndexPath = newValue }
    }
    
    @available(iOS 6.0, *)
    fileprivate var delegateShouldHighlightRowAtIndexPath : AFSTableDelegateCellShouldHighlight<DataSource>? {
        get { return _delegateShouldHighlightRowAtIndexPath as? AFSTableDelegateCellShouldHighlight<DataSource> }
        set { _delegateShouldHighlightRowAtIndexPath = newValue }
    }
    @available(iOS 6.0, *)
    fileprivate var delegateDidHighlightRowAtIndexPath    : AFSTableDelegateCellHighlightAction<DataSource>? {
        get { return _delegateDidHighlightRowAtIndexPath as? AFSTableDelegateCellHighlightAction<DataSource> }
        set { _delegateDidHighlightRowAtIndexPath = newValue }
    }
    @available(iOS 6.0, *)
    fileprivate var delegateDidUnhighlightRowAtIndexPath  : AFSTableDelegateCellHighlightAction<DataSource>? {
        get { return _delegateDidUnhighlightRowAtIndexPath as? AFSTableDelegateCellHighlightAction<DataSource> }
        set { _delegateDidUnhighlightRowAtIndexPath = newValue }
    }
    
    @available(iOS 2.0, *)
    fileprivate var delegateWillSelectRowAtIndexPath   : AFSTableDelegateCellSelection<DataSource>? {
        get { return _delegateWillSelectRowAtIndexPath as? AFSTableDelegateCellSelection<DataSource> }
        set { _delegateWillSelectRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateWillDeselectRowAtIndexPath : AFSTableDelegateCellSelection<DataSource>? {
        get { return _delegateWillDeselectRowAtIndexPath as? AFSTableDelegateCellSelection<DataSource> }
        set { _delegateWillDeselectRowAtIndexPath = newValue }
    }
    @available(iOS 3.0, *)
    fileprivate var delegateDidSelectRowAtIndexPath    : AFSTableDelegateCellSelectAction<DataSource>? {
        get { return _delegateDidSelectRowAtIndexPath as? AFSTableDelegateCellSelectAction<DataSource> }
        set { _delegateDidSelectRowAtIndexPath = newValue }
    }
    @available(iOS 3.0, *)
    fileprivate var delegateDidDeselectRowAtIndexPath  : AFSTableDelegateCellSelectAction<DataSource>? {
        get { return _delegateDidDeselectRowAtIndexPath as? AFSTableDelegateCellSelectAction<DataSource> }
        set { _delegateDidDeselectRowAtIndexPath = newValue }
    }
    
    @available(iOS 2.0, *)
    fileprivate var delegateEditingStyleForRowAtIndexPath                      : AFSTableDelegateCellEditingStyle<DataSource>? {
        get { return _delegateEditingStyleForRowAtIndexPath as? AFSTableDelegateCellEditingStyle<DataSource> }
        set { _delegateEditingStyleForRowAtIndexPath = newValue }
    }
    @available(iOS 3.0, *)
    fileprivate var delegateTitleForDeleteConfirmationButtonForRowAtIndexPath  : AFSTableDelegateCellTitleForDelete<DataSource>? {
        get { return _delegateTitleForDeleteConfirmationButtonForRowAtIndexPath as? AFSTableDelegateCellTitleForDelete<DataSource> }
        set { _delegateTitleForDeleteConfirmationButtonForRowAtIndexPath = newValue }
    }
    @available(iOS 8.0, *)
    fileprivate var delegateEditActionsForRowAtIndexPath                       : AFSTableDelegateEditActionsForRow<DataSource>? {
        get { return _delegateEditActionsForRowAtIndexPath as? AFSTableDelegateEditActionsForRow<DataSource> }
        set { _delegateEditActionsForRowAtIndexPath = newValue }
    }
    
    @available(iOS 11.0, *)
    fileprivate var delegateLeadingSwipeActionsConfigurationForRowAtIndexPath  : AFSTableDelegateSwipeActionsConfiguration<DataSource>? {
        get { return _delegateLeadingSwipeActionsConfigurationForRowAtIndexPath as? AFSTableDelegateSwipeActionsConfiguration<DataSource> }
        set { _delegateLeadingSwipeActionsConfigurationForRowAtIndexPath = newValue }
    }
    @available(iOS 11.0, *)
    fileprivate var delegateTrailingSwipeActionsConfigurationForRowAtIndexPath : AFSTableDelegateSwipeActionsConfiguration<DataSource>? {
        get { return _delegateTrailingSwipeActionsConfigurationForRowAtIndexPath as? AFSTableDelegateSwipeActionsConfiguration<DataSource> }
        set { _delegateTrailingSwipeActionsConfigurationForRowAtIndexPath = newValue }
    }
    
    @available(iOS 2.0, *)
    fileprivate var delegateShouldIndentWhileEditingRowAtIndexPath : AFSTableDelegateShouldIndentWhileEditingRow<DataSource>? {
        get { return _delegateShouldIndentWhileEditingRowAtIndexPath as? AFSTableDelegateShouldIndentWhileEditingRow<DataSource> }
        set { _delegateShouldIndentWhileEditingRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateWillBeginEditingRowAtIndexPath : AFSTableDelegateWillBeginEditingRowAt<DataSource>? {
        get { return _delegateWillBeginEditingRowAtIndexPath as? AFSTableDelegateWillBeginEditingRowAt<DataSource> }
        set { _delegateWillBeginEditingRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateDidEndEditingRowAtIndexPath    : AFSTableDelegateDidEndEditingRowAt<DataSource>? {
        get { return _delegateDidEndEditingRowAtIndexPath as? AFSTableDelegateDidEndEditingRowAt<DataSource> }
        set { _delegateDidEndEditingRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    fileprivate var delegateTargetIndexPathForMovement : AFSTableDelegateMoveAction<DataSource>? {
        get { return _delegateTargetIndexPathForMovement as? AFSTableDelegateMoveAction<DataSource> }
        set { _delegateTargetIndexPathForMovement = newValue }
    }
    
    @available(iOS 2.0, *)
    fileprivate var delegateIndentationLevelForRowAtIndexPath : AFSTableDelegateIndentationLevel<DataSource>? {
        get { return _delegateIndentationLevelForRowAtIndexPath as? AFSTableDelegateIndentationLevel<DataSource> }
        set { _delegateIndentationLevelForRowAtIndexPath = newValue }
    }
    
    @available(iOS 5.0, *)
    fileprivate var delegateShouldShowMenuForRowAtIndexPath   : AFSTableDelegateShouldShowMenu<DataSource>? {
        get { return _delegateShouldShowMenuForRowAtIndexPath as? AFSTableDelegateShouldShowMenu<DataSource> }
        set { _delegateShouldShowMenuForRowAtIndexPath = newValue }
    }
    @available(iOS 5.0, *)
    fileprivate var delegateCanPerformActionForRowAtIndexPathWithSender : AFSTableDelegateCanSelectorActionForRow<DataSource>? {
        get { return _delegateCanPerformActionForRowAtIndexPathWithSender as? AFSTableDelegateCanSelectorActionForRow<DataSource> }
        set { _delegateCanPerformActionForRowAtIndexPathWithSender = newValue }
    }
    @available(iOS 5.0, *)
    fileprivate var delegatePerformActionForRowAtIndexPathWithSender    : AFSTableDelegateSelectorActionForRow<DataSource>? {
        get { return _delegatePerformActionForRowAtIndexPathWithSender as? AFSTableDelegateSelectorActionForRow<DataSource> }
        set { _delegatePerformActionForRowAtIndexPathWithSender = newValue }
    }
    
    @available(iOS 9.0, *)
    fileprivate var delegateCanFocusRowAtIndexPath     : AFSTableDelegateCanFocusRowAtIndexPath<DataSource>? {
        get { return _delegateCanFocusRowAtIndexPath as? AFSTableDelegateCanFocusRowAtIndexPath<DataSource> }
        set { _delegateCanFocusRowAtIndexPath = newValue }
    }
    @available(iOS 9.0, *)
    fileprivate var delegateShouldUpdateFocusInContext : AFSTableDelegateShouldUpdateFocusInContext<DataSource>? {
        get { return _delegateShouldUpdateFocusInContext as? AFSTableDelegateShouldUpdateFocusInContext<DataSource> }
        set { _delegateShouldUpdateFocusInContext = newValue }
    }
    @available(iOS 9.0, *)
    fileprivate var delegateDidUpdateFocusInContextWithCoordinator    : AFSTableDelegateDidUpdateFocusInContext<DataSource>? {
        get { return _delegateDidUpdateFocusInContextWithCoordinator as? AFSTableDelegateDidUpdateFocusInContext<DataSource> }
        set { _delegateDidUpdateFocusInContextWithCoordinator = newValue }
    }
    @available(iOS 9.0, *)
    fileprivate var delegateIndexPathForPreferredFocusedView          : AFSTableDelegateIndexPathForPreferredView<DataSource>? {
        get { return _delegateIndexPathForPreferredFocusedView as? AFSTableDelegateIndexPathForPreferredView<DataSource> }
        set { _delegateIndexPathForPreferredFocusedView = newValue }
    }
    
    @available(iOS 11.0, *)
    fileprivate var delegateShouldSpringLoadRowAtIndexPathWithContext : AFSTableDelegateShouldSpringLoad<DataSource>? {
        get { return _delegateShouldSpringLoadRowAtIndexPathWithContext as? AFSTableDelegateShouldSpringLoad<DataSource> }
        set { _delegateShouldSpringLoadRowAtIndexPathWithContext = newValue }
    }
    
    // MARK: - Stored Properties - UITableViewDragDelegate
    private var _dragDelegateItemsForBeginningSessionAtIndexPath          : Any?
    private var _dragDelegateItemsForAddingToSessionAtIndexPathPoint      : Any?
    private var _dragDelegateDragPreviewParametersForRowAtIndexPath       : Any?
    private var _dragDelegateDragSessionWillBeginSession                  : Any?
    private var _dragDelegateDragSessionDidEndSession                     : Any?
    private var _dragDelegateDragSessionAllowsMoveOperation               : Any?
    private var _dragDelegateDragSessionIsRestrictedToDraggingApplication : Any?
    
    // MARK: - Access Properties - UITableViewDragDelegate
    @available(iOS 11.0, *)
    fileprivate var dragDelegateItemsForBeginningSessionAtIndexPath          : AFSTableDragDelegateBeginningSessionAt<DataSource>? {
        get { return _dragDelegateItemsForBeginningSessionAtIndexPath as? AFSTableDragDelegateBeginningSessionAt<DataSource> }
        set { _dragDelegateItemsForBeginningSessionAtIndexPath  = newValue }
    }
    @available(iOS 11.0, *)
    fileprivate var dragDelegateItemsForAddingToSessionAtIndexPathPoint      : AFSTableDragDelegateAddingToSessionAtPoint<DataSource>? {
        get { return _dragDelegateItemsForAddingToSessionAtIndexPathPoint as? AFSTableDragDelegateAddingToSessionAtPoint<DataSource>}
        set { _dragDelegateItemsForAddingToSessionAtIndexPathPoint = newValue }
    }
    @available(iOS 11.0, *)
    fileprivate var dragDelegateDragPreviewParametersForRowAtIndexPath       : AFSTableDragDelegateDragPreviewParameters<DataSource>? {
        get { return _dragDelegateDragPreviewParametersForRowAtIndexPath as? AFSTableDragDelegateDragPreviewParameters<DataSource> }
        set { _dragDelegateDragPreviewParametersForRowAtIndexPath = newValue }
    }
    @available(iOS 11.0, *)
    fileprivate var dragDelegateDragSessionWillBeginSession                  : AFSTableDragDelegateDragSessionVoidBlock<DataSource>? {
        get { return _dragDelegateDragSessionWillBeginSession as? AFSTableDragDelegateDragSessionVoidBlock<DataSource>}
        set { _dragDelegateDragSessionWillBeginSession = newValue }
    }
    @available(iOS 11.0, *)
    fileprivate var dragDelegateDragSessionDidEndSession                     : AFSTableDragDelegateDragSessionVoidBlock<DataSource>? {
        get { return _dragDelegateDragSessionDidEndSession as? AFSTableDragDelegateDragSessionVoidBlock<DataSource>}
        set { _dragDelegateDragSessionDidEndSession = newValue }
    }
    @available(iOS 11.0, *)
    fileprivate var dragDelegateDragSessionAllowsMoveOperation               : AFSTableDragDelegateDragSessionBoolBlock<DataSource>? {
        get { return _dragDelegateDragSessionAllowsMoveOperation as? AFSTableDragDelegateDragSessionBoolBlock<DataSource>}
        set { _dragDelegateDragSessionAllowsMoveOperation = newValue }
    }
    @available(iOS 11.0, *)
    fileprivate var dragDelegateDragSessionIsRestrictedToDraggingApplication : AFSTableDragDelegateDragSessionBoolBlock<DataSource>? {
        get { return _dragDelegateDragSessionIsRestrictedToDraggingApplication as? AFSTableDragDelegateDragSessionBoolBlock<DataSource>}
        set { _dragDelegateDragSessionIsRestrictedToDraggingApplication = newValue }
    }
    
    // MARK: - Stored Properties - UITableViewDropDelegate
    private var _dropDelegatePerformDropWithCoordinator                   : Any?
    private var _dropDelegateCanHandleSession                             : Any?
    private var _dropDelegateDropSessionDidEnterSession                   : Any?
    private var _dropDelegateDropSessionDidUpdateWithDestinationIndexPath : Any?
    private var _dropDelegateDropSessionDidExitSession                    : Any?
    private var _dropDelegateDropSessionDidEndSession                     : Any?
    private var _dropDelegateDropPreviewParametersForRowAtIndexPath       : Any?
    
    // MARK: - Access Properties - UITableViewDropDelegate
    @available(iOS 11.0, *)
    fileprivate var dropDelegatePerformDropWithCoordinator                   : AFSTableDropDelegatePerformDropCoordinator<DataSource>? {
        get { return _dropDelegatePerformDropWithCoordinator as? AFSTableDropDelegatePerformDropCoordinator<DataSource> }
        set { _dropDelegatePerformDropWithCoordinator = newValue }
    }
    @available(iOS 11.0, *)
    fileprivate var dropDelegateCanHandleSession                             : AFSTableDropDelegateDropSessionBoolBlock<DataSource>? {
        get { return _dropDelegateCanHandleSession as? AFSTableDropDelegateDropSessionBoolBlock<DataSource> }
        set { _dropDelegateCanHandleSession = newValue }
    }
    @available(iOS 11.0, *)
    fileprivate var dropDelegateDropSessionDidEnterSession                   : AFSTableDropDelegateDropSessionVoidBlock<DataSource>? {
        get { return _dropDelegateDropSessionDidEnterSession as? AFSTableDropDelegateDropSessionVoidBlock<DataSource> }
        set { _dropDelegateDropSessionDidEnterSession = newValue }
    }
    @available(iOS 11.0, *)
    fileprivate var dropDelegateDropSessionDidUpdateWithDestinationIndexPath : AFSTableDropDelegateDidUpdateWithDestination<DataSource>? {
        get { return _dropDelegateDropSessionDidUpdateWithDestinationIndexPath as? AFSTableDropDelegateDidUpdateWithDestination<DataSource> }
        set { _dropDelegateDropSessionDidUpdateWithDestinationIndexPath = newValue }
    }
    @available(iOS 11.0, *)
    fileprivate var dropDelegateDropSessionDidExitSession                    : AFSTableDropDelegateDropSessionVoidBlock<DataSource>? {
        get { return _dropDelegateDropSessionDidExitSession as? AFSTableDropDelegateDropSessionVoidBlock<DataSource> }
        set { _dropDelegateDropSessionDidExitSession = newValue }
    }
    @available(iOS 11.0, *)
    fileprivate var dropDelegateDropSessionDidEndSession                     : AFSTableDropDelegateDropSessionVoidBlock<DataSource>? {
        get { return _dropDelegateDropSessionDidEndSession as? AFSTableDropDelegateDropSessionVoidBlock<DataSource> }
        set { _dropDelegateDropSessionDidEndSession = newValue }
    }
    @available(iOS 11.0, *)
    fileprivate var dropDelegateDropPreviewParametersForRowAtIndexPath       : AFSTableDropDelegateDropPreviewParameters<DataSource>? {
        get { return _dropDelegateDropPreviewParametersForRowAtIndexPath as? AFSTableDropDelegateDropPreviewParameters<DataSource> }
        set { _dropDelegateDropPreviewParametersForRowAtIndexPath = newValue }
    }
    
    // MARK: - Initialization
    public override init(displayType: AFSReusableDisplayKit.DisplayType = .table) {
        super.init(displayType: displayType)
        self.configurator = AFSTableElementsConfigurator.init()
    }
    
    // MARK: - Object life cycle
    deinit {
        print("\(type(of: self)) was deallocated successfuly")
    }
    
    // MARK: - Object setters
    
    ///
    ///
    ///
    @discardableResult public func setBehavior(_ behaviorToSet: TableBehavior) -> Self {
        self.currentBehavior = behaviorToSet
        return self
    }
    
    // MARK: -
    
    ///
    /// Build a new table controller object
    ///
    public override func build() -> ElementsController? {
        
        let controller = AFSTableController<DataSource>(identifierLogic: identifierLogic, behavior: currentBehavior)
        controller.dataController = dataController
        controller.configurator   = configurator
        applyScrollBlocks(to: controller)
        applyTableBlocks(to: controller)
        return controller
    }
    
    ///
    /// Applay delegate Blocks to scroll controller
    ///
    public final func applyTableBlocks(to controller: AFSTableController<DataSource>) {
        
        if #available(iOS 2.0, *) {
            // MARK: Logic holder - UITableViewDataSource
            controller.dataSourceNumberOfSections                                 = dataSourceNumberOfSections
            controller.dataSourceNumberOfRowsInSection                            = dataSourceNumberOfRowsInSection
            controller.dataSourceCellForRawAtIndexPath                            = dataSourceCellForRawAtIndexPath
            controller.dataSourceTitleForHeaderInSection                          = dataSourceTitleForHeaderInSection
            controller.dataSourceTitleForFooterInSection                          = dataSourceTitleForFooterInSection
            controller.dataSourceCanEditRowAtIndexPath                            = dataSourceCanEditRowAtIndexPath
            controller.dataSourceCommitForRowAtIndexPath                          = dataSourceCommitForRowAtIndexPath
            controller.dataSourceSectionIndexTitles                               = dataSourceSectionIndexTitles
            controller.dataSourceSectionForSectionIndexTitleAtIndex               = dataSourceSectionForSectionIndexTitleAtIndex
            controller.dataSourceCanMoveRowAtIndexPath                            = dataSourceCanMoveRowAtIndexPath
            controller.dataSourceMoveRowFromSourceToDestination                   = dataSourceMoveRowFromSourceToDestination
            
            // MARK: Logic holder - UITableViewDataSourcePrefetching
            controller.prefetchingDataSourcePrefetchRowsAtIndexPaths              = prefetchingDataSourcePrefetchRowsAtIndexPaths
            controller.prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths  = prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths
    
            // MARK: Logic holder - UITableViewDelegate
            controller.delegateWillDisplayCellForRowAtIndexPath                   = delegateWillDisplayCellForRowAtIndexPath
            controller.delegateWillDisplayHeaderViewForSection                    = delegateWillDisplayHeaderViewForSection
            controller.delegateWillDisplayFooterViewForSection                    = delegateWillDisplayFooterViewForSection
            controller.delegateEndDisplayingCellForRowAtIndexPath                 = delegateEndDisplayingCellForRowAtIndexPath
            controller.delegateEndDisplayingHeaderViewForSection                  = delegateEndDisplayingHeaderViewForSection
            controller.delegateEndDisplayingFooterViewForSection                  = delegateEndDisplayingFooterViewForSection
            controller.delegateHeightForRowAtIndexPath                            = delegateHeightForRowAtIndexPath
            controller.delegateHeightForHeaderInSection                           = delegateHeightForHeaderInSection
            controller.delegateHeightForFooterInSection                           = delegateHeightForFooterInSection
            controller.delegateEstimatedHeightForRowAtIndexPath                   = delegateEstimatedHeightForRowAtIndexPath
            controller.delegateEstimatedHeightForHeaderInSection                  = delegateEstimatedHeightForHeaderInSection
            controller.delegateEstimatedHeightForFooterInSection                  = delegateEstimatedHeightForFooterInSection
            controller.delegateViewForHeaderInSection                             = delegateViewForHeaderInSection
            controller.delegateViewForFooterInSection                             = delegateViewForFooterInSection
            controller.delegateAccessoryButtonTappedForRowWithIndexPath           = delegateAccessoryButtonTappedForRowWithIndexPath
    
            controller.delegateWillSelectRowAtIndexPath                           = delegateWillSelectRowAtIndexPath
            controller.delegateWillDeselectRowAtIndexPath                         = delegateWillDeselectRowAtIndexPath
            controller.delegateEditingStyleForRowAtIndexPath                      = delegateEditingStyleForRowAtIndexPath
            controller.delegateShouldIndentWhileEditingRowAtIndexPath             = delegateShouldIndentWhileEditingRowAtIndexPath
            controller.delegateWillBeginEditingRowAtIndexPath                     = delegateWillBeginEditingRowAtIndexPath
            controller.delegateDidEndEditingRowAtIndexPath                        = delegateDidEndEditingRowAtIndexPath
            controller.delegateTargetIndexPathForMovement                         = delegateTargetIndexPathForMovement
            controller.delegateIndentationLevelForRowAtIndexPath                  = delegateIndentationLevelForRowAtIndexPath
        }
        
        if #available(iOS 3.0, *) {
            controller.delegateDidSelectRowAtIndexPath                            = delegateDidSelectRowAtIndexPath
            controller.delegateDidDeselectRowAtIndexPath                          = delegateDidDeselectRowAtIndexPath
            controller.delegateTitleForDeleteConfirmationButtonForRowAtIndexPath  = delegateTitleForDeleteConfirmationButtonForRowAtIndexPath
        }
        
        if #available(iOS 5.0, *) {
            controller.delegateShouldShowMenuForRowAtIndexPath                    = delegateShouldShowMenuForRowAtIndexPath
            controller.delegateCanPerformActionForRowAtIndexPathWithSender        = delegateCanPerformActionForRowAtIndexPathWithSender
            controller.delegatePerformActionForRowAtIndexPathWithSender           = delegatePerformActionForRowAtIndexPathWithSender
        }
        
        if #available(iOS 6.0, *) {
            controller.delegateShouldHighlightRowAtIndexPath                      = delegateShouldHighlightRowAtIndexPath
            controller.delegateDidHighlightRowAtIndexPath                         = delegateDidHighlightRowAtIndexPath
            controller.delegateDidUnhighlightRowAtIndexPath                       = delegateDidUnhighlightRowAtIndexPath
        }
        
        if #available(iOS 8.0, *) {
            controller.delegateEditActionsForRowAtIndexPath                       = delegateEditActionsForRowAtIndexPath
        }
        
        if #available(iOS 9.0, *) {
            controller.delegateCanFocusRowAtIndexPath                             = delegateCanFocusRowAtIndexPath
            controller.delegateShouldUpdateFocusInContext                         = delegateShouldUpdateFocusInContext
            controller.delegateDidUpdateFocusInContextWithCoordinator             = delegateDidUpdateFocusInContextWithCoordinator
            controller.delegateIndexPathForPreferredFocusedView                   = delegateIndexPathForPreferredFocusedView
        }
        
        if #available(iOS 11.0, *) {
            controller.delegateLeadingSwipeActionsConfigurationForRowAtIndexPath  = delegateLeadingSwipeActionsConfigurationForRowAtIndexPath
            controller.delegateTrailingSwipeActionsConfigurationForRowAtIndexPath = delegateTrailingSwipeActionsConfigurationForRowAtIndexPath
            controller.delegateShouldSpringLoadRowAtIndexPathWithContext          = delegateShouldSpringLoadRowAtIndexPathWithContext
        
            // MARK: Logic holder - UITableViewDragDelegate
            controller.dragDelegateItemsForBeginningSessionAtIndexPath            = dragDelegateItemsForBeginningSessionAtIndexPath
            controller.dragDelegateItemsForAddingToSessionAtIndexPathPoint        = dragDelegateItemsForAddingToSessionAtIndexPathPoint
            controller.dragDelegateDragPreviewParametersForRowAtIndexPath         = dragDelegateDragPreviewParametersForRowAtIndexPath
            controller.dragDelegateDragSessionWillBeginSession                    = dragDelegateDragSessionWillBeginSession
            controller.dragDelegateDragSessionDidEndSession                       = dragDelegateDragSessionDidEndSession
            controller.dragDelegateDragSessionAllowsMoveOperation                 = dragDelegateDragSessionAllowsMoveOperation
            controller.dragDelegateDragSessionIsRestrictedToDraggingApplication   = dragDelegateDragSessionIsRestrictedToDraggingApplication
            
            // MARK: Logic holder - UITableViewDropDelegate
            controller.dropDelegatePerformDropWithCoordinator                     = dropDelegatePerformDropWithCoordinator
            controller.dropDelegateCanHandleSession                               = dropDelegateCanHandleSession
            controller.dropDelegateDropSessionDidEnterSession                     = dropDelegateDropSessionDidEnterSession
            controller.dropDelegateDropSessionDidUpdateWithDestinationIndexPath   = dropDelegateDropSessionDidUpdateWithDestinationIndexPath
            controller.dropDelegateDropSessionDidExitSession                      = dropDelegateDropSessionDidExitSession
            controller.dropDelegateDropSessionDidEndSession                       = dropDelegateDropSessionDidEndSession
            controller.dropDelegateDropPreviewParametersForRowAtIndexPath         = dropDelegateDropPreviewParametersForRowAtIndexPath
        }
    }
}
// MARK: -
extension AFSTableControllerBuilder : AFSTableControllerBuilderProtocol { // MARK: - AFSTableControllerBuilderProtocol
    
    // MARK: -
    
    /// Header
    ///
    ///
    ///
    public func   registerHeader<Element,ViewModel>(via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String, displayElement: Element.Type, displayModel: ViewModel.Type, displayConfiguration handler: @escaping ElementConfiguration<Element,ViewModel>) {
        
        if delegateViewForHeaderInSection == nil {
            setDelegateViewForHeaderInSection(handler: AFSTableDelegateSectionView<DataSource>.defaultHeader.run)
        }
        registerElement(of: .tableHeader(0), elementKind: .supplementary, displayElementKind: String(), via: method, withReuse: identifier,
                        displayElement: displayElement, displayModel: displayModel, displayConfiguration: handler)
    }
    
    ///
    ///
    ///
    public func unregisterHeader(via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String) {
        
        unregisterElement(of: .tableHeader(0), elementKind: .supplementary, displayElementKind: String(), via: method, withReuse: identifier)
    }
    
    /// Cells
    ///
    ///
    ///
    public func   registerCell<Element,ViewModel>(via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String, displayElement: Element.Type, displayModel: ViewModel.Type, displayConfiguration handler: @escaping ElementConfiguration<Element,ViewModel>) {
        
        if dataSourceCellForRawAtIndexPath == nil {
            setDataSourceCellForRawAtIndexPath(handler: AFSTableDataSourceCellConfiguration<DataSource>.default.run)
        }
        registerElement(of: .tableCell(IndexPath()), elementKind: .cell, displayElementKind: String(), via: method, withReuse: identifier,
                        displayElement: displayElement, displayModel: displayModel, displayConfiguration: handler)
    }
    
    ///
    ///
    ///
    public func unregisterCell(via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String) {
        
        unregisterElement(of: .tableCell(IndexPath()), elementKind: .cell, displayElementKind: String(), via: method, withReuse: identifier)
    }
    
    
    /// Footer
    ///
    ///
    ///
    public func   registerFooter<Element,ViewModel>(via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String, displayElement: Element.Type, displayModel: ViewModel.Type, displayConfiguration handler: @escaping ElementConfiguration<Element,ViewModel>) {
        
        if delegateViewForFooterInSection == nil {
            setDelegateViewForFooterInSection(handler: AFSTableDelegateSectionView<DataSource>.defaultFooter.run)
        }
        registerElement(of: .tableFooter(0), elementKind: .supplementary, displayElementKind: String(), via: method, withReuse: identifier,
                        displayElement: displayElement, displayModel: displayModel, displayConfiguration: handler)
    }
    
    ///
    ///
    ///
    public func unregisterFooter(via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String) {
        
        unregisterElement(of: .tableFooter(0), elementKind: .supplementary, displayElementKind: String(), via: method, withReuse: identifier)
    }
    
}
// MARK: -
extension AFSTableControllerBuilder { // MARK: UITableViewDataSource
    
    // MARK: -
    
    ///
    /// Set a new behavior for UITableViewDataSource method `numberOfSections(in:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDataSourceNumberOfSections(handler block: AFSTableHandlersDataSourceSectionsCount<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceNumberOfSections = AFSTableDataSourceSectionsCount<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UITableViewDataSource method `tableView(_:numberOfRowsInSection:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDataSourceNumberOfRowsInSection(handler block: AFSTableHandlersDataSourceRowCountInSection<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceNumberOfRowsInSection = AFSTableDataSourceRowCountInSection<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UITableViewDataSource method `tableView(_:cellForRowAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDataSourceCellForRawAtIndexPath(handler block: AFSTableHandlersDataSourceCellConfiguration<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceCellForRawAtIndexPath = AFSTableDataSourceCellConfiguration<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UITableViewDataSource method `tableView(_:titleForHeaderInSection:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDataSourceTitleForHeaderInSection(handler block: AFSTableHandlersDataSourceSectionTitle<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceTitleForHeaderInSection = AFSTableDataSourceSectionTitle<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UITableViewDataSource method `tableView(_:titleForFooterInSection:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDataSourceTitleForFooterInSection(handler block: AFSTableHandlersDataSourceSectionTitle<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceTitleForFooterInSection = AFSTableDataSourceSectionTitle<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UITableViewDataSource method `tableView(_:canEditRowAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDataSourceCanEditRowAtIndexPath(handler block: AFSTableHandlersDataSourceCanEditRow<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceCanEditRowAtIndexPath = AFSTableDataSourceCanEditRow<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UITableViewDataSource method `tableView(_:commit:forRowAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDataSourceCommitForRowAtIndexPath(handler block: AFSTableHandlersDataSourceCommitForRow<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceCommitForRowAtIndexPath = AFSTableDataSourceCommitForRow<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UITableViewDataSource method `tableView(_:sectionForSectionIndexTitle:at:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDataSourceSectionIndexTitles(handler block: AFSTableHandlersDataSourceSectionIndexTitles<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceSectionIndexTitles = AFSTableDataSourceSectionIndexTitles<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UITableViewDataSource method `tableView(_:sectionForSectionIndexTitle:at:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDataSourceSectionForSectionIndexTitleAtIndex(handler block: AFSTableHandlersDataSourceSectionForSectionIndexTitle<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceSectionForSectionIndexTitleAtIndex = AFSTableDataSourceSectionForSectionIndexTitle<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UITableViewDataSource method `tableView(_:canMoveRowAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDataSourceCanMoveRowAtIndexPath(handler block: AFSTableHandlersDataSourceCanMove<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceCanMoveRowAtIndexPath = AFSTableDataSourceCanMove<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UITableViewDataSource method `tableView(_:moveRowAt:to:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDataSourceMoveRowFromSourceToDestination(handler block: AFSTableHandlersDataSourceMoveRow<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceMoveRowFromSourceToDestination = AFSTableDataSourceMoveRow<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
}
// MARK: -
extension AFSTableControllerBuilder { // MARK: UITableViewDataSourcePrefetching
    
    // MARK: -
    
    ///
    /// Overrides default behavior for UITableViewDataSourcePrefetching method `tableView(_:prefetchRowsAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setPrefetchingDataSourcePrefetchRowsAtIndexPaths(handler block: AFSTableHandlersDataSourcePrefetch<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.prefetchingDataSourcePrefetchRowsAtIndexPaths = AFSTableDataSourcePrefetch<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDataSourcePrefetching method `tableView(_:cancelPrefetchingForRowsAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setPrefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths(handler block: AFSTableHandlersDataSourcePrefetch<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths = AFSTableDataSourcePrefetch<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
}
// MARK: -
extension AFSTableControllerBuilder { // MARK: UITableViewDelegate
    
    // MARK: -
    
    /// MARK: - willDisplay
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:willDisplay:forRowAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateWillDisplayCellForRowAtIndexPath(handler block: AFSTableHandlersDelegateDisplayCell<DataSource>?) -> Self
    {
        
        if let handlerBlock = block {
            self.delegateWillDisplayCellForRowAtIndexPath = AFSTableDelegateDisplayCell<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:willDisplayHeaderView:forSection:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateWillDisplayHeaderViewForSection(handler block: AFSTableHandlersDelegateDisplayHeader<DataSource>?) -> Self
    {
        
        if let handlerBlock = block {
            self.delegateWillDisplayHeaderViewForSection = AFSTableDelegateDisplayHeader<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:willDisplayFooterView:forSection:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateWillDisplayFooterViewForSection(handler block: AFSTableHandlersDelegateDisplayFooter<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateWillDisplayFooterViewForSection = AFSTableDelegateDisplayFooter<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    /// MARK: - didEndDisplaying
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:didEndDisplaying:forRowAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateEndDisplayingCellForRowAtIndexPath(handler block: AFSTableHandlersDelegateDisplayCell<DataSource>?) -> Self
    {
        
        if let handlerBlock = block {
            self.delegateEndDisplayingCellForRowAtIndexPath = AFSTableDelegateDisplayCell<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:didEndDisplayingHeaderView:forSection:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateEndDisplayingHeaderViewForSection(handler block: AFSTableHandlersDelegateDisplayHeader<DataSource>?) -> Self
    {
        
        if let handlerBlock = block {
            self.delegateEndDisplayingHeaderViewForSection = AFSTableDelegateDisplayHeader<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:didEndDisplayingFooterView:forSection:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateEndDisplayingFooterViewForSection(handler block: AFSTableHandlersDelegateDisplayFooter<DataSource>?) -> Self
    {
        
        if let handlerBlock = block {
            self.delegateEndDisplayingFooterViewForSection = AFSTableDelegateDisplayFooter<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    /// MARK: - height
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:heightForRowAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateHeightForRowAtIndexPath(handler block: AFSTableHandlersDelegateHeightCell<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateHeightForRowAtIndexPath = AFSTableDelegateHeightCell<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:heightForHeaderInSection:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateHeightForHeaderInSection(handler block: AFSTableHandlersDelegateHeightHeader<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateHeightForHeaderInSection = AFSTableDelegateHeightHeader<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:heightForFooterInSection:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateHeightForFooterInSection(handler block: AFSTableHandlersDelegateHeightFooter<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateHeightForFooterInSection = AFSTableDelegateHeightFooter<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    /// MARK: - estimatedHeight
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:estimatedHeightForRowAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateEstimatedHeightForRowAtIndexPath(handler block: AFSTableHandlersDelegateHeightCell<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateEstimatedHeightForRowAtIndexPath = AFSTableDelegateHeightCell<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:estimatedHeightForHeaderInSection:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateEstimatedHeightForHeaderInSection(handler block: AFSTableHandlersDelegateHeightHeader<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateEstimatedHeightForHeaderInSection = AFSTableDelegateHeightHeader<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:estimatedHeightForFooterInSection:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateEstimatedHeightForFooterInSection(handler block: AFSTableHandlersDelegateHeightFooter<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateEstimatedHeightForFooterInSection = AFSTableDelegateHeightFooter<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    /// MARK: -
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:viewForHeaderInSection:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateViewForHeaderInSection(handler block: AFSTableHandlersDelegateSectionView<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateViewForHeaderInSection = AFSTableDelegateSectionView<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:viewForFooterInSection:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateViewForFooterInSection(handler block: AFSTableHandlersDelegateSectionView<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateViewForFooterInSection = AFSTableDelegateSectionView<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    /// MARK: -
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:accessoryButtonTappedForRowWith:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateAccessoryButtonTappedForRowWithIndexPath(handler block: AFSTableHandlersDelegateAccessoryTap<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateAccessoryButtonTappedForRowWithIndexPath = AFSTableDelegateAccessoryTap<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    /// MARK: - highlight
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:shouldHighlightRowAt:)`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegateShouldHighlightRowAtIndexPath(handler block: AFSTableHandlersDelegateCellShouldHighlight<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateShouldHighlightRowAtIndexPath = AFSTableDelegateCellShouldHighlight<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:didHighlightRowAt:)`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegateDidHighlightRowAtIndexPath(handler block: AFSTableHandlersDelegateCellHighlightAction<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateDidHighlightRowAtIndexPath = AFSTableDelegateCellHighlightAction<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:didUnhighlightRowAt:)`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegateDidUnhighlightRowAtIndexPath(handler block: AFSTableHandlersDelegateCellHighlightAction<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateDidUnhighlightRowAtIndexPath = AFSTableDelegateCellHighlightAction<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    /// MARK: - Select action
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:willSelectRowAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateWillSelectRowAtIndexPath(handler block: AFSTableHandlersDelegateCellSelection<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateWillSelectRowAtIndexPath = AFSTableDelegateCellSelection<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:willDeselectRowAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateWillDeselectRowAtIndexPath(handler block: AFSTableHandlersDelegateCellSelection<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateWillDeselectRowAtIndexPath = AFSTableDelegateCellSelection<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:didSelectRowAt:)`.
    ///
    @available(iOS 3.0, *)
    @discardableResult public func setDelegateDidSelectRowAtIndexPath(handler block: AFSTableHandlersDelegateCellSelectAction<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateDidSelectRowAtIndexPath = AFSTableDelegateCellSelectAction<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:didDeselectRowAt:)`.
    ///
    @available(iOS 3.0, *)
    @discardableResult public func setDelegateDidDeselectRowAtIndexPath(handler block: AFSTableHandlersDelegateCellSelectAction<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateDidDeselectRowAtIndexPath = AFSTableDelegateCellSelectAction<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    /// MARK: -
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:editingStyleForRowAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateDidDeselectRowAtIndexPath(handler block: AFSTableHandlersDelegateCellEditingStyle<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateEditingStyleForRowAtIndexPath = AFSTableDelegateCellEditingStyle<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:titleForDeleteConfirmationButtonForRowAt:)`.
    ///
    @available(iOS 3.0, *)
    @discardableResult public func setDelegateDidDeselectRowAtIndexPath(handler block: AFSTableHandlersDelegateCellTitleForDelete<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateTitleForDeleteConfirmationButtonForRowAtIndexPath = AFSTableDelegateCellTitleForDelete<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:editActionsForRowAt:)`.
    ///
    @available(iOS 8.0, *)
    @discardableResult public func setDelegateDidDeselectRowAtIndexPath(handler block: AFSTableHandlersDelegateEditActionsForRow<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateEditActionsForRowAtIndexPath = AFSTableDelegateEditActionsForRow<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    /// MARK: -
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:leadingSwipeActionsConfigurationForRowAt:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateLeadingSwipeActionsConfigurationForRowAtIndexPath(handler block: AFSTableHandlersDelegateSwipeActionsConfiguration<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateLeadingSwipeActionsConfigurationForRowAtIndexPath = AFSTableDelegateSwipeActionsConfiguration<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:trailingSwipeActionsConfigurationForRowAt:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateTrailingSwipeActionsConfigurationForRowAtIndexPath(handler block: AFSTableHandlersDelegateSwipeActionsConfiguration<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateTrailingSwipeActionsConfigurationForRowAtIndexPath = AFSTableDelegateSwipeActionsConfiguration<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    /// MARK: -
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:shouldIndentWhileEditingRowAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateShouldIndentWhileEditingRowAtIndexPath(handler block: AFSTableHandlersDelegateShouldIndentWhileEditingRow<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateShouldIndentWhileEditingRowAtIndexPath = AFSTableDelegateShouldIndentWhileEditingRow<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    /// MARK: -
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:willBeginEditingRowAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateWillBeginEditingRowAtIndexPath(handler block: AFSTableHandlersDelegateWillBeginEditingRowAt<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateWillBeginEditingRowAtIndexPath = AFSTableDelegateWillBeginEditingRowAt<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:didEndEditingRowAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateDidEndEditingRowAtIndexPath(handler block: AFSTableHandlersDelegateDidEndEditingRowAt<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateDidEndEditingRowAtIndexPath = AFSTableDelegateDidEndEditingRowAt<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    /// MARK: -
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:targetIndexPathForMoveFromRowAt:toProposedIndexPath:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateTargetIndexPathForMoveFromSourceIndexPathToProposedIndexPath(handler block: AFSTableHandlersDelegateMoveAction<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateTargetIndexPathForMovement = AFSTableDelegateMoveAction<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:indentationLevelForRowAt:)`.
    ///
    @available(iOS 2.0, *)
    @discardableResult public func setDelegateIndentationLevelForRowAtIndexPath(handler block: AFSTableHandlersDelegateIndentationLevel<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateIndentationLevelForRowAtIndexPath = AFSTableDelegateIndentationLevel<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:shouldShowMenuForRowAt:)`.
    ///
    @available(iOS 5.0, *)
    @discardableResult public func setDelegateShouldShowMenuForRowAtIndexPath(handler block: AFSTableHandlersDelegateShouldShowMenu<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateShouldShowMenuForRowAtIndexPath = AFSTableDelegateShouldShowMenu<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    /// MARK: -
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:canPerformAction:forRowAt:withSender:)`.
    ///
    @available(iOS 5.0, *)
    @discardableResult public func setDelegateShouldShowMenuForRowAtIndexPath(handler block: AFSTableHandlersDelegateCanSelectorActionForRow<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateCanPerformActionForRowAtIndexPathWithSender = AFSTableDelegateCanSelectorActionForRow<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:performAction:forRowAt:withSender:)`.
    ///
    @available(iOS 5.0, *)
    @discardableResult public func setDelegateShouldShowMenuForRowAtIndexPath(handler block: AFSTableHandlersDelegateSelectorActionForRow<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegatePerformActionForRowAtIndexPathWithSender = AFSTableDelegateSelectorActionForRow<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:canFocusRowAt:)`.
    ///
    @available(iOS 9.0, *)
    @discardableResult public func setDelegateCanFocusRowAtIndexPath(handler block: AFSTableHandlersDelegateCanFocusRowAtIndexPath<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateCanFocusRowAtIndexPath = AFSTableDelegateCanFocusRowAtIndexPath<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:shouldUpdateFocusIn:)`.
    ///
    @available(iOS 9.0, *)
    @discardableResult public func setDelegateShouldUpdateFocusInContext(handler block: AFSTableHandlersDelegateShouldUpdateFocusInContext<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateShouldUpdateFocusInContext = AFSTableDelegateShouldUpdateFocusInContext<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:didUpdateFocusIn:with:)`.
    ///
    @available(iOS 9.0, *)
    @discardableResult public func setDelegateDidUpdateFocusInContextWithCoordinator(handler block: AFSTableHandlersDelegateDidUpdateFocusInContext<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateDidUpdateFocusInContextWithCoordinator = AFSTableDelegateDidUpdateFocusInContext<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `indexPathForPreferredFocusedView(in:)`.
    ///
    @available(iOS 9.0, *)
    @discardableResult public func setDelegateIndexPathForPreferredFocusedView(handler block: AFSTableHandlersDelegateIndexPathForPreferredView<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateIndexPathForPreferredFocusedView = AFSTableDelegateIndexPathForPreferredView<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDelegate method `tableView(_:shouldSpringLoadRowAt:with:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateShouldSpringLoadRowAtIndexPathWithContext(handler block: AFSTableHandlersDelegateShouldSpringLoad<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateShouldSpringLoadRowAtIndexPathWithContext = AFSTableDelegateShouldSpringLoad<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
}
// MARK: -
@available(iOS 11.0, *)
extension AFSTableControllerBuilder { // MARK: UITableViewDragDelegate
    
    // MARK: -
    
    ///
    /// Overrides default behavior for UITableViewDragDelegate method `tableView(_:itemsForBeginning:at:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateItemsForBeginningSessionAtIndexPath(handler block: AFSTableHandlersDragDelegateBeginningSessionAt<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dragDelegateItemsForBeginningSessionAtIndexPath = AFSTableDragDelegateBeginningSessionAt<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDragDelegate method `tableView(_:itemsForAddingTo:at:point)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateItemsForAddingToSessionAtIndexPathPoint(handler block: AFSTableHandlersDragDelegateAddingToSessionAtPoint<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dragDelegateItemsForAddingToSessionAtIndexPathPoint = AFSTableDragDelegateAddingToSessionAtPoint<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDragDelegate method `tableView(_:dragPreviewParametersForRowAt:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDragPreviewParametersForRowAtIndexPath(handler block: AFSTableHandlersDragDelegateDragPreviewParameters<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dragDelegateDragPreviewParametersForRowAtIndexPath = AFSTableDragDelegateDragPreviewParameters<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDragDelegate method `tableView(_:dragSessionWillBegin:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDragSessionWillBeginSession(handler block: AFSTableHandlersDragDelegateDragSessionVoidBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dragDelegateDragSessionWillBeginSession = AFSTableDragDelegateDragSessionVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDragDelegate method `tableView(_:dragSessionDidEnd:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDragSessionDidEndSession(handler block: AFSTableHandlersDragDelegateDragSessionVoidBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dragDelegateDragSessionDidEndSession = AFSTableDragDelegateDragSessionVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDragDelegate method `tableView(_:dragSessionAllowsMoveOperation:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDragSessionAllowsMoveOperation(handler block: AFSTableHandlersDragDelegateDragSessionBoolBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dragDelegateDragSessionAllowsMoveOperation = AFSTableDragDelegateDragSessionBoolBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDragDelegate method `tableView(_:dragSessionIsRestrictedToDraggingApplication:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDragSessionIsRestrictedToDraggingApplication(handler block: AFSTableHandlersDragDelegateDragSessionBoolBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dragDelegateDragSessionIsRestrictedToDraggingApplication = AFSTableDragDelegateDragSessionBoolBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
}
// MARK: -
@available(iOS 11.0, *)
extension AFSTableControllerBuilder { // MARK: UITableViewDropDelegate
    
    // MARK: -
    
    ///
    /// Overrides default behavior for UITableViewDropDelegate method `tableView(_:performDropWith:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateShouldSpringLoadRowAtIndexPathWithContext(handler block: AFSTableHandlersDropDelegatePerformDropCoordinator<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dropDelegatePerformDropWithCoordinator = AFSTableDropDelegatePerformDropCoordinator<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDropDelegate method `tableView(_:canHandle:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateCanHandleSession(handler block: AFSTableHandlersDropDelegateDropSessionBoolBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dropDelegateCanHandleSession = AFSTableDropDelegateDropSessionBoolBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDropDelegate method `tableView(_:dropSessionDidEnter:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDropSessionDidEnterSession(handler block: AFSTableHandlersDropDelegateDropSessionVoidBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dropDelegateDropSessionDidEnterSession = AFSTableDropDelegateDropSessionVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDropDelegate method `tableView(_:dropSessionDidUpdate:withDestinationIndexPath:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDropSessionDidUpdateWithDestinationIndexPath(handler block: AFSTableHandlersDropDelegateDidUpdateWithDestination<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dropDelegateDropSessionDidUpdateWithDestinationIndexPath = AFSTableDropDelegateDidUpdateWithDestination<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDropDelegate method `tableView(_:dropSessionDidExit:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDropSessionDidExitSession(handler block: AFSTableHandlersDropDelegateDropSessionVoidBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dropDelegateDropSessionDidExitSession = AFSTableDropDelegateDropSessionVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDropDelegate method `tableView(_:dropSessionDidEnd:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDropSessionDidEndSession(handler block: AFSTableHandlersDropDelegateDropSessionVoidBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dropDelegateDropSessionDidEndSession = AFSTableDropDelegateDropSessionVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDropDelegate method `tableView(_:dropPreviewParametersForRowAt:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDropPreviewParametersForRowAtIndexPath(handler block: AFSTableHandlersDropDelegateDropPreviewParameters<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dropDelegateDropPreviewParametersForRowAtIndexPath = AFSTableDropDelegateDropPreviewParameters<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
}
