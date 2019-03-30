//
//  AFSTableController.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/17/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit
///
///
///
extension AFSTableController.TableBehavior {
    
    // MARK: - DataSource
    public static var dataSourceBasic          : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 00) }
    public static var dataSourceSectionHeader  : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 01) }
    public static var dataSourceSectionFooter  : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 02) }
    public static var dataSourceSectionIndex   : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 03) }
    public static var dataSourceEditItem       : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 04) }
    public static var dataSourceMoveItem       : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 05) }
    
    // MARK: - Prefetching
    public static var dataSourcePrefetching    : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 06) }
    
    // MARK: - Delegate
    public static var delegateWillDisplay      : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 07)}
    public static var delegateDidEndDisplaying : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 08)}
    public static var delegateHeight           : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 09)}
    public static var delegateEstimatedHeight  : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 10)}
    public static var delegateViewForHeader    : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 11)}
    public static var delegateViewForFooter    : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 12)}
    public static var delegateAccessoryButton  : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 13)}
    public static var delegateHighlight        : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 14)}
    public static var delegateSelect           : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 15)}
    public static var delegateDeselect         : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 16)}
    public static var delegateEditing          : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 17)}
    public static var delegateEditActions      : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 18)}
    public static var delegateSwipeActions     : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 19)}
    public static var delegateEditingState     : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 20)}
    public static var delegateIndentation      : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 21)}
    public static var delegateMenu             : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 22)}
    public static var delegateFocus            : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 23)}
    public static var delegateSpringLoad       : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 24)}
    
    // MARK: - Prefetching
    public static var delegateDragDelegate     : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 10) }
    
    // MARK: - Prefetching
    public static var delegateDropDelegate     : AFSTableController.TableBehavior { return AFSTableController.TableBehavior(rawValue: 1 << 11) }
}
// =====================================================================================================================
//
// =====================================================================================================================
public final class AFSTableController<DataSource> : AFSScrollController<DataSource> ,
    UITableViewDataSource,
    UITableViewDataSourcePrefetching,
    UITableViewDelegate,
    UITableViewDragDelegate,
    UITableViewDropDelegate
    where
    DataSource : AFSMetadataDataSource
{
    // MARK: - Typealias
    
    // MARK: - Enum Types
    
    // MARK: - Struct Types
    public struct TableBehavior : OptionSet {
        
        public let  rawValue: Int
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
    
    // MARK: - Stored Properties
    public internal(set) var configurator    : AFSTableElementsConfigurator! {
        get { return super.baseConfigurator as? AFSTableElementsConfigurator }
        set { super.baseConfigurator = newValue                                       }
    }
    
    public internal(set) var currentBehavior : AFSTableController.TableBehavior = [] {
        willSet { assert(newValue.contains(.dataSourceBasic), "Input paramater must contain .dataSourceBasic. It may contain additional Behaviors as needed") }
    }
    
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
    internal var dataSourceNumberOfSections                   : AFSTableDataSourceSectionsCount<DataSource>? {
        get { return _dataSourceNumberOfSections as? AFSTableDataSourceSectionsCount<DataSource> }
        set { _dataSourceNumberOfSections = newValue }
    }
    @available(iOS 2.0, *)
    internal var dataSourceNumberOfRowsInSection              : AFSTableDataSourceRowCountInSection<DataSource>? {
        get { return _dataSourceNumberOfRowsInSection as? AFSTableDataSourceRowCountInSection<DataSource> }
        set { _dataSourceNumberOfRowsInSection = newValue }
    }
    @available(iOS 2.0, *)
    internal var dataSourceCellForRawAtIndexPath              : AFSTableDataSourceCellConfiguration<DataSource>? {
        get { return _dataSourceCellForRawAtIndexPath as? AFSTableDataSourceCellConfiguration<DataSource> }
        set { _dataSourceCellForRawAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    internal var dataSourceTitleForHeaderInSection            : AFSTableDataSourceSectionTitle<DataSource>? {
        get { return _dataSourceTitleForHeaderInSection as? AFSTableDataSourceSectionTitle<DataSource> }
        set { _dataSourceTitleForHeaderInSection = newValue }
    }
    @available(iOS 2.0, *)
    internal var dataSourceTitleForFooterInSection            : AFSTableDataSourceSectionTitle<DataSource>? {
        get { return _dataSourceTitleForFooterInSection as? AFSTableDataSourceSectionTitle<DataSource> }
        set { _dataSourceTitleForFooterInSection = newValue }
    }
    @available(iOS 2.0, *)
    internal var dataSourceCanEditRowAtIndexPath              : AFSTableDataSourceCanEditRow<DataSource>? {
        get { return _dataSourceCanEditRowAtIndexPath as? AFSTableDataSourceCanEditRow<DataSource> }
        set { _dataSourceCanEditRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    internal var dataSourceCommitForRowAtIndexPath            : AFSTableDataSourceCommitForRow<DataSource>? {
        get { return _dataSourceCommitForRowAtIndexPath as? AFSTableDataSourceCommitForRow<DataSource> }
        set { _dataSourceCommitForRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    internal var dataSourceSectionIndexTitles                 : AFSTableDataSourceSectionIndexTitles<DataSource>?{
        get { return _dataSourceSectionIndexTitles as? AFSTableDataSourceSectionIndexTitles<DataSource> }
        set { _dataSourceSectionIndexTitles = newValue }
    }
    @available(iOS 2.0, *)
    internal var dataSourceSectionForSectionIndexTitleAtIndex : AFSTableDataSourceSectionForSectionIndexTitle<DataSource>? {
        get { return _dataSourceSectionForSectionIndexTitleAtIndex as? AFSTableDataSourceSectionForSectionIndexTitle<DataSource> }
        set { _dataSourceSectionForSectionIndexTitleAtIndex = newValue }
    }
    @available(iOS 2.0, *)
    internal var dataSourceCanMoveRowAtIndexPath              : AFSTableDataSourceCanMove<DataSource>? {
        get { return _dataSourceCanMoveRowAtIndexPath as? AFSTableDataSourceCanMove<DataSource> }
        set { _dataSourceCanMoveRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    internal var dataSourceMoveRowFromSourceToDestination     : AFSTableDataSourceMoveRow<DataSource>? {
        get { return _dataSourceMoveRowFromSourceToDestination as? AFSTableDataSourceMoveRow<DataSource> }
        set { _dataSourceMoveRowFromSourceToDestination = newValue }
    }
    
    // MARK: - Stored Properties - UITableViewDataSourcePrefetching
    private var _prefetchingDataSourcePrefetchRowsAtIndexPaths             : Any?
    private var _prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths : Any?
    
    // MARK: - Access Properties - UITableViewDataSourcePrefetching
    @available(iOS 2.0, *)
    internal var prefetchingDataSourcePrefetchRowsAtIndexPaths             : AFSTableDataSourcePrefetch<DataSource>? {
        get { return _prefetchingDataSourcePrefetchRowsAtIndexPaths as? AFSTableDataSourcePrefetch<DataSource> }
        set { _prefetchingDataSourcePrefetchRowsAtIndexPaths = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths : AFSTableDataSourcePrefetch<DataSource>? {
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
    internal var delegateWillDisplayCellForRowAtIndexPath    : AFSTableDelegateDisplayCell<DataSource>? {
        get { return _delegateWillDisplayCellForRowAtIndexPath as? AFSTableDelegateDisplayCell<DataSource> }
        set { _delegateWillDisplayCellForRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateWillDisplayHeaderViewForSection     : AFSTableDelegateDisplayHeader<DataSource>? {
        get { return _delegateWillDisplayHeaderViewForSection as? AFSTableDelegateDisplayHeader<DataSource> }
        set { _delegateWillDisplayHeaderViewForSection = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateWillDisplayFooterViewForSection     : AFSTableDelegateDisplayFooter<DataSource>? {
        get { return _delegateWillDisplayFooterViewForSection as? AFSTableDelegateDisplayFooter<DataSource> }
        set { _delegateWillDisplayFooterViewForSection = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateEndDisplayingCellForRowAtIndexPath  : AFSTableDelegateDisplayCell<DataSource>? {
        get { return _delegateEndDisplayingCellForRowAtIndexPath as? AFSTableDelegateDisplayCell<DataSource> }
        set { _delegateEndDisplayingCellForRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateEndDisplayingHeaderViewForSection   : AFSTableDelegateDisplayHeader<DataSource>? {
        get { return _delegateEndDisplayingHeaderViewForSection as? AFSTableDelegateDisplayHeader<DataSource> }
        set { _delegateEndDisplayingHeaderViewForSection = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateEndDisplayingFooterViewForSection   : AFSTableDelegateDisplayFooter<DataSource>? {
        get { return _delegateEndDisplayingFooterViewForSection as? AFSTableDelegateDisplayFooter<DataSource> }
        set { _delegateEndDisplayingFooterViewForSection = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var delegateHeightForRowAtIndexPath             : AFSTableDelegateHeightCell<DataSource>? {
        get { return _delegateHeightForRowAtIndexPath as? AFSTableDelegateHeightCell<DataSource> }
        set { _delegateHeightForRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateHeightForHeaderInSection            : AFSTableDelegateHeightHeader<DataSource>? {
        get { return _delegateHeightForHeaderInSection as? AFSTableDelegateHeightHeader<DataSource> }
        set { _delegateHeightForHeaderInSection = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateHeightForFooterInSection            : AFSTableDelegateHeightFooter<DataSource>? {
        get { return _delegateHeightForFooterInSection as? AFSTableDelegateHeightFooter<DataSource> }
        set { _delegateHeightForFooterInSection = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var delegateEstimatedHeightForRowAtIndexPath    : AFSTableDelegateHeightCell<DataSource>? {
        get { return _delegateEstimatedHeightForRowAtIndexPath as? AFSTableDelegateHeightCell<DataSource> }
        set { _delegateEstimatedHeightForRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateEstimatedHeightForHeaderInSection   : AFSTableDelegateHeightHeader<DataSource>? {
        get { return _delegateEstimatedHeightForHeaderInSection as? AFSTableDelegateHeightHeader<DataSource> }
        set { _delegateEstimatedHeightForHeaderInSection = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateEstimatedHeightForFooterInSection   : AFSTableDelegateHeightFooter<DataSource>? {
        get { return _delegateEstimatedHeightForFooterInSection as? AFSTableDelegateHeightFooter<DataSource> }
        set { _delegateEstimatedHeightForFooterInSection = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var delegateViewForHeaderInSection : AFSTableDelegateSectionView<DataSource>?{
        get { return _delegateViewForHeaderInSection as? AFSTableDelegateSectionView<DataSource> }
        set { _delegateViewForHeaderInSection = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateViewForFooterInSection : AFSTableDelegateSectionView<DataSource>?{
        get { return _delegateViewForFooterInSection as? AFSTableDelegateSectionView<DataSource> }
        set { _delegateViewForFooterInSection = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var delegateAccessoryButtonTappedForRowWithIndexPath : AFSTableDelegateAccessoryTap<DataSource>? {
        get { return _delegateAccessoryButtonTappedForRowWithIndexPath as? AFSTableDelegateAccessoryTap<DataSource> }
        set { _delegateAccessoryButtonTappedForRowWithIndexPath = newValue }
    }
    
    @available(iOS 6.0, *)
    internal var delegateShouldHighlightRowAtIndexPath : AFSTableDelegateCellShouldHighlight<DataSource>? {
        get { return _delegateShouldHighlightRowAtIndexPath as? AFSTableDelegateCellShouldHighlight<DataSource> }
        set { _delegateShouldHighlightRowAtIndexPath = newValue }
    }
    @available(iOS 6.0, *)
    internal var delegateDidHighlightRowAtIndexPath    : AFSTableDelegateCellHighlightAction<DataSource>? {
        get { return _delegateDidHighlightRowAtIndexPath as? AFSTableDelegateCellHighlightAction<DataSource> }
        set { _delegateDidHighlightRowAtIndexPath = newValue }
    }
    @available(iOS 6.0, *)
    internal var delegateDidUnhighlightRowAtIndexPath  : AFSTableDelegateCellHighlightAction<DataSource>? {
        get { return _delegateDidUnhighlightRowAtIndexPath as? AFSTableDelegateCellHighlightAction<DataSource> }
        set { _delegateDidUnhighlightRowAtIndexPath = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var delegateWillSelectRowAtIndexPath   : AFSTableDelegateCellSelection<DataSource>? {
        get { return _delegateWillSelectRowAtIndexPath as? AFSTableDelegateCellSelection<DataSource> }
        set { _delegateWillSelectRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateWillDeselectRowAtIndexPath : AFSTableDelegateCellSelection<DataSource>? {
        get { return _delegateWillDeselectRowAtIndexPath as? AFSTableDelegateCellSelection<DataSource> }
        set { _delegateWillDeselectRowAtIndexPath = newValue }
    }
    @available(iOS 3.0, *)
    internal var delegateDidSelectRowAtIndexPath    : AFSTableDelegateCellSelectAction<DataSource>? {
        get { return _delegateDidSelectRowAtIndexPath as? AFSTableDelegateCellSelectAction<DataSource> }
        set { _delegateDidSelectRowAtIndexPath = newValue }
    }
    @available(iOS 3.0, *)
    internal var delegateDidDeselectRowAtIndexPath  : AFSTableDelegateCellSelectAction<DataSource>? {
        get { return _delegateDidDeselectRowAtIndexPath as? AFSTableDelegateCellSelectAction<DataSource> }
        set { _delegateDidDeselectRowAtIndexPath = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var delegateEditingStyleForRowAtIndexPath                      : AFSTableDelegateCellEditingStyle<DataSource>? {
        get { return _delegateEditingStyleForRowAtIndexPath as? AFSTableDelegateCellEditingStyle<DataSource> }
        set { _delegateEditingStyleForRowAtIndexPath = newValue }
    }
    @available(iOS 3.0, *)
    internal var delegateTitleForDeleteConfirmationButtonForRowAtIndexPath  : AFSTableDelegateCellTitleForDelete<DataSource>? {
        get { return _delegateTitleForDeleteConfirmationButtonForRowAtIndexPath as? AFSTableDelegateCellTitleForDelete<DataSource> }
        set { _delegateTitleForDeleteConfirmationButtonForRowAtIndexPath = newValue }
    }
    @available(iOS 8.0, *)
    internal var delegateEditActionsForRowAtIndexPath                       : AFSTableDelegateEditActionsForRow<DataSource>? {
        get { return _delegateEditActionsForRowAtIndexPath as? AFSTableDelegateEditActionsForRow<DataSource> }
        set { _delegateEditActionsForRowAtIndexPath = newValue }
    }
    
    @available(iOS 11.0, *)
    internal var delegateLeadingSwipeActionsConfigurationForRowAtIndexPath  : AFSTableDelegateSwipeActionsConfiguration<DataSource>? {
        get { return _delegateLeadingSwipeActionsConfigurationForRowAtIndexPath as? AFSTableDelegateSwipeActionsConfiguration<DataSource> }
        set { _delegateLeadingSwipeActionsConfigurationForRowAtIndexPath = newValue }
    }
    @available(iOS 11.0, *)
    internal var delegateTrailingSwipeActionsConfigurationForRowAtIndexPath : AFSTableDelegateSwipeActionsConfiguration<DataSource>? {
        get { return _delegateTrailingSwipeActionsConfigurationForRowAtIndexPath as? AFSTableDelegateSwipeActionsConfiguration<DataSource> }
        set { _delegateTrailingSwipeActionsConfigurationForRowAtIndexPath = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var delegateShouldIndentWhileEditingRowAtIndexPath : AFSTableDelegateShouldIndentWhileEditingRow<DataSource>? {
        get { return _delegateShouldIndentWhileEditingRowAtIndexPath as? AFSTableDelegateShouldIndentWhileEditingRow<DataSource> }
        set { _delegateShouldIndentWhileEditingRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateWillBeginEditingRowAtIndexPath : AFSTableDelegateWillBeginEditingRowAt<DataSource>? {
        get { return _delegateWillBeginEditingRowAtIndexPath as? AFSTableDelegateWillBeginEditingRowAt<DataSource> }
        set { _delegateWillBeginEditingRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateDidEndEditingRowAtIndexPath    : AFSTableDelegateDidEndEditingRowAt<DataSource>? {
        get { return _delegateDidEndEditingRowAtIndexPath as? AFSTableDelegateDidEndEditingRowAt<DataSource> }
        set { _delegateDidEndEditingRowAtIndexPath = newValue }
    }
    @available(iOS 2.0, *)
    internal var delegateTargetIndexPathForMovement : AFSTableDelegateMoveAction<DataSource>? {
        get { return _delegateTargetIndexPathForMovement as? AFSTableDelegateMoveAction<DataSource> }
        set { _delegateTargetIndexPathForMovement = newValue }
    }
    
    @available(iOS 2.0, *)
    internal var delegateIndentationLevelForRowAtIndexPath : AFSTableDelegateIndentationLevel<DataSource>? {
        get { return _delegateIndentationLevelForRowAtIndexPath as? AFSTableDelegateIndentationLevel<DataSource> }
        set { _delegateIndentationLevelForRowAtIndexPath = newValue }
    }
    
    @available(iOS 5.0, *)
    internal var delegateShouldShowMenuForRowAtIndexPath   : AFSTableDelegateShouldShowMenu<DataSource>? {
        get { return _delegateShouldShowMenuForRowAtIndexPath as? AFSTableDelegateShouldShowMenu<DataSource> }
        set { _delegateShouldShowMenuForRowAtIndexPath = newValue }
    }
    @available(iOS 5.0, *)
    internal var delegateCanPerformActionForRowAtIndexPathWithSender : AFSTableDelegateCanSelectorActionForRow<DataSource>? {
        get { return _delegateCanPerformActionForRowAtIndexPathWithSender as? AFSTableDelegateCanSelectorActionForRow<DataSource> }
        set { _delegateCanPerformActionForRowAtIndexPathWithSender = newValue }
    }
    @available(iOS 5.0, *)
    internal var delegatePerformActionForRowAtIndexPathWithSender    : AFSTableDelegateSelectorActionForRow<DataSource>? {
        get { return _delegatePerformActionForRowAtIndexPathWithSender as? AFSTableDelegateSelectorActionForRow<DataSource> }
        set { _delegatePerformActionForRowAtIndexPathWithSender = newValue }
    }
    
    @available(iOS 9.0, *)
    internal var delegateCanFocusRowAtIndexPath     : AFSTableDelegateCanFocusRowAtIndexPath<DataSource>? {
        get { return _delegateCanFocusRowAtIndexPath as? AFSTableDelegateCanFocusRowAtIndexPath<DataSource> }
        set { _delegateCanFocusRowAtIndexPath = newValue }
    }
    @available(iOS 9.0, *)
    internal var delegateShouldUpdateFocusInContext : AFSTableDelegateShouldUpdateFocusInContext<DataSource>? {
        get { return _delegateShouldUpdateFocusInContext as? AFSTableDelegateShouldUpdateFocusInContext<DataSource> }
        set { _delegateShouldUpdateFocusInContext = newValue }
    }
    @available(iOS 9.0, *)
    internal var delegateDidUpdateFocusInContextWithCoordinator    : AFSTableDelegateDidUpdateFocusInContext<DataSource>? {
        get { return _delegateDidUpdateFocusInContextWithCoordinator as? AFSTableDelegateDidUpdateFocusInContext<DataSource> }
        set { _delegateDidUpdateFocusInContextWithCoordinator = newValue }
    }
    @available(iOS 9.0, *)
    internal var delegateIndexPathForPreferredFocusedView          : AFSTableDelegateIndexPathForPreferredView<DataSource>? {
        get { return _delegateIndexPathForPreferredFocusedView as? AFSTableDelegateIndexPathForPreferredView<DataSource> }
        set { _delegateIndexPathForPreferredFocusedView = newValue }
    }
    
    @available(iOS 11.0, *)
    internal var delegateShouldSpringLoadRowAtIndexPathWithContext : AFSTableDelegateShouldSpringLoad<DataSource>? {
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
    internal var dragDelegateItemsForBeginningSessionAtIndexPath          : AFSTableDragDelegateBeginningSessionAt<DataSource>? {
        get { return _dragDelegateItemsForBeginningSessionAtIndexPath as? AFSTableDragDelegateBeginningSessionAt<DataSource> }
        set { _dragDelegateItemsForBeginningSessionAtIndexPath  = newValue }
    }
    @available(iOS 11.0, *)
    internal var dragDelegateItemsForAddingToSessionAtIndexPathPoint      : AFSTableDragDelegateAddingToSessionAtPoint<DataSource>? {
        get { return _dragDelegateItemsForAddingToSessionAtIndexPathPoint as? AFSTableDragDelegateAddingToSessionAtPoint<DataSource>}
        set { _dragDelegateItemsForAddingToSessionAtIndexPathPoint = newValue }
    }
    @available(iOS 11.0, *)
    internal var dragDelegateDragPreviewParametersForRowAtIndexPath       : AFSTableDragDelegateDragPreviewParameters<DataSource>? {
        get { return _dragDelegateDragPreviewParametersForRowAtIndexPath as? AFSTableDragDelegateDragPreviewParameters<DataSource> }
        set { _dragDelegateDragPreviewParametersForRowAtIndexPath = newValue }
    }
    @available(iOS 11.0, *)
    internal var dragDelegateDragSessionWillBeginSession                  : AFSTableDragDelegateDragSessionVoidBlock<DataSource>? {
        get { return _dragDelegateDragSessionWillBeginSession as? AFSTableDragDelegateDragSessionVoidBlock<DataSource>}
        set { _dragDelegateDragSessionWillBeginSession = newValue }
    }
    @available(iOS 11.0, *)
    internal var dragDelegateDragSessionDidEndSession                     : AFSTableDragDelegateDragSessionVoidBlock<DataSource>? {
        get { return _dragDelegateDragSessionDidEndSession as? AFSTableDragDelegateDragSessionVoidBlock<DataSource>}
        set { _dragDelegateDragSessionDidEndSession = newValue }
    }
    @available(iOS 11.0, *)
    internal var dragDelegateDragSessionAllowsMoveOperation               : AFSTableDragDelegateDragSessionBoolBlock<DataSource>? {
        get { return _dragDelegateDragSessionAllowsMoveOperation as? AFSTableDragDelegateDragSessionBoolBlock<DataSource>}
        set { _dragDelegateDragSessionAllowsMoveOperation = newValue }
    }
    @available(iOS 11.0, *)
    internal var dragDelegateDragSessionIsRestrictedToDraggingApplication : AFSTableDragDelegateDragSessionBoolBlock<DataSource>? {
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
    internal var dropDelegatePerformDropWithCoordinator                   : AFSTableDropDelegatePerformDropCoordinator<DataSource>? {
        get { return _dropDelegatePerformDropWithCoordinator as? AFSTableDropDelegatePerformDropCoordinator<DataSource> }
        set { _dropDelegatePerformDropWithCoordinator = newValue }
    }
    @available(iOS 11.0, *)
    internal var dropDelegateCanHandleSession                             : AFSTableDropDelegateDropSessionBoolBlock<DataSource>? {
        get { return _dropDelegateCanHandleSession as? AFSTableDropDelegateDropSessionBoolBlock<DataSource> }
        set { _dropDelegateCanHandleSession = newValue }
    }
    @available(iOS 11.0, *)
    internal var dropDelegateDropSessionDidEnterSession                   : AFSTableDropDelegateDropSessionVoidBlock<DataSource>? {
        get { return _dropDelegateDropSessionDidEnterSession as? AFSTableDropDelegateDropSessionVoidBlock<DataSource> }
        set { _dropDelegateDropSessionDidEnterSession = newValue }
    }
    @available(iOS 11.0, *)
    internal var dropDelegateDropSessionDidUpdateWithDestinationIndexPath : AFSTableDropDelegateDidUpdateWithDestination<DataSource>? {
        get { return _dropDelegateDropSessionDidUpdateWithDestinationIndexPath as? AFSTableDropDelegateDidUpdateWithDestination<DataSource> }
        set { _dropDelegateDropSessionDidUpdateWithDestinationIndexPath = newValue }
    }
    @available(iOS 11.0, *)
    internal var dropDelegateDropSessionDidExitSession                    : AFSTableDropDelegateDropSessionVoidBlock<DataSource>? {
        get { return _dropDelegateDropSessionDidExitSession as? AFSTableDropDelegateDropSessionVoidBlock<DataSource> }
        set { _dropDelegateDropSessionDidExitSession = newValue }
    }
    @available(iOS 11.0, *)
    internal var dropDelegateDropSessionDidEndSession                     : AFSTableDropDelegateDropSessionVoidBlock<DataSource>? {
        get { return _dropDelegateDropSessionDidEndSession as? AFSTableDropDelegateDropSessionVoidBlock<DataSource> }
        set { _dropDelegateDropSessionDidEndSession = newValue }
    }
    @available(iOS 11.0, *)
    internal var dropDelegateDropPreviewParametersForRowAtIndexPath       : AFSTableDropDelegateDropPreviewParameters<DataSource>? {
        get { return _dropDelegateDropPreviewParametersForRowAtIndexPath as? AFSTableDropDelegateDropPreviewParameters<DataSource> }
        set { _dropDelegateDropPreviewParametersForRowAtIndexPath = newValue }
    }
    // MARK: - Subscript
    
    // MARK: - Initialization
    public init(identifierLogic : AFSReusableIdentifier<DataSource>, behavior: AFSTableController.TableBehavior = .dataSourceBasic) {
        assert(behavior.contains(.dataSourceBasic), "behavior paramater must contain .dataSourceBasic, it may contain additional Behaviors as needed")
        self.currentBehavior = behavior
        super.init(identifierLogic: identifierLogic)
    }
    
    // MARK: - Object life cycle
    deinit {
        print("\(type(of: self)) was deallocated successfuly")
    }
    
    // MARK: - NSObject override
    public override func responds(to aSelector: Selector!) -> Bool {
        
        guard let input = aSelector else { return super.responds(to: aSelector) }
        
        if #available(iOS 11.0, *) {
            
            if  input.isMember(of: UITableViewDelegate    .self) ||
                input.isMember(of: UITableViewDropDelegate.self) ||
                input.isMember(of: UITableViewDragDelegate.self) ||
                input.isMember(of: UITableViewDataSource  .self) ||
                input.isMember(of: UITableViewDataSourcePrefetching.self)
            {
                guard responds(to: input, for: currentBehavior) else { return false }
                return true
            }
            
        } else if #available(iOS 10.0, *) {
            
            if  input.isMember(of: UITableViewDelegate  .self) ||
                input.isMember(of: UITableViewDataSource.self) ||
                input.isMember(of: UITableViewDataSourcePrefetching.self)
            {
                guard responds(to: input, for: currentBehavior) else { return false }
                return true
            }
            
        } else {
            
            if  input.isMember(of: UITableViewDelegate  .self) ||
                input.isMember(of: UITableViewDataSource.self)
            {
                guard responds(to: input, for: currentBehavior) else { return false }
                return true
            }
        }
        
        guard let proxy = delegateProxy else { return super.responds(to: aSelector) }
        guard proxy.responds(to: input) else { return super.responds(to: aSelector) }
        return true
    }
    
    public override func conforms(to aProtocol: Protocol) -> Bool {
        
        if #available(iOS 11.0, *) {
            
            guard protocol_conformsToProtocol(aProtocol, UITableViewDelegate  .self) ||
                protocol_conformsToProtocol(aProtocol, UITableViewDropDelegate.self) ||
                protocol_conformsToProtocol(aProtocol, UITableViewDragDelegate.self) ||
                protocol_conformsToProtocol(aProtocol, UITableViewDataSource  .self) ||
                protocol_conformsToProtocol(aProtocol, UITableViewDataSourcePrefetching.self) else {
                    return super.conforms(to: aProtocol)
            }
            
        } else if #available(iOS 10.0, *) {
            
            guard protocol_conformsToProtocol(aProtocol, UITableViewDelegate  .self) ||
                protocol_conformsToProtocol(aProtocol, UITableViewDataSource  .self) ||
                protocol_conformsToProtocol(aProtocol, UITableViewDataSourcePrefetching.self) else {
                    return super.conforms(to: aProtocol)
            }
            
        } else {
            
            guard protocol_conformsToProtocol(aProtocol, UITableViewDelegate.self) ||
                protocol_conformsToProtocol(aProtocol, UITableViewDataSource.self) else {
                    return super.conforms(to: aProtocol)
            }
            
        }
        
        guard let proxy = delegateProxy     else { return super.conforms(to: aProtocol) }
        guard proxy.conforms(to: aProtocol) else { return super.conforms(to: aProtocol) }
        return true
    }
    
    // MARK: - Table Controller Protocols
    // =================================================================================================================
    public func connect(to tableView: UITableView) {
        configurator.registerElements(to: tableView)
        if #available(iOS 10.0, *) {
            tableView.prefetchDataSource = self
        }
        tableView.dataSource         = self
        tableView.delegate           = self
        if #available(iOS 11.0, *) {
            tableView.dragDelegate       = self
            tableView.dropDelegate       = self
        }
    }
    
    // MARK: - Table Controller Protocols
    // =================================================================================================================
    
    // MARK: - UITableViewDataSource
    // =================================================================================================================
    
    // MARK: - Basic
    public func numberOfSections(in tableView: UITableView) -> Int {
        return dataSourceNumberOfSections?.run(self,tableView) ?? 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceNumberOfRowsInSection?.run(self,tableView,section) ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSourceCellForRawAtIndexPath?.run(self,tableView,indexPath) ?? UITableViewCell.init()
    }
    
    // MARK: - Header
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSourceTitleForHeaderInSection?.run(self,tableView,section) ?? String()
    }
    
    // MARK: - Footer
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return dataSourceTitleForFooterInSection?.run(self,tableView,section) ?? String()
    }
    
    // MARK: -
    
    // MARK: - Editing
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return dataSourceCanEditRowAtIndexPath?.run(self,tableView,indexPath) ?? true
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        dataSourceCommitForRowAtIndexPath?.run(self,tableView,editingStyle,indexPath)
    }
    
    // MARK: - Index
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return dataSourceSectionIndexTitles?.run(self,tableView) ?? nil
    }
    
    public func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return dataSourceSectionForSectionIndexTitleAtIndex?.run(self,tableView,title,index) ?? 0
    }
    
    // MARK: - Moving / Reordering support
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return dataSourceCanMoveRowAtIndexPath?.run(self,tableView,indexPath) ?? true
    }
    
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        dataSourceMoveRowFromSourceToDestination?.run(self,tableView,sourceIndexPath,destinationIndexPath)
    }
    
    // MARK: - UITableViewDataSourcePrefetching Overrides
    public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        prefetchingDataSourcePrefetchRowsAtIndexPaths?.run(self,tableView,indexPaths)
    }
    
    public func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths?.run(self,tableView,indexPaths)
    }
    
    // MARK: - UITableViewDelegate
    
    // MARK: - willDisplay
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegateWillDisplayCellForRowAtIndexPath?.run(self,tableView,cell,indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        delegateWillDisplayHeaderViewForSection?.run(self,tableView,view,section)
    }

    public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        delegateWillDisplayFooterViewForSection?.run(self,tableView,view,section)
    }
    
    // MARK: - didEndDisplaying
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegateEndDisplayingCellForRowAtIndexPath?.run(self,tableView,cell,indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        delegateEndDisplayingHeaderViewForSection?.run(self,tableView,view,section)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        delegateEndDisplayingFooterViewForSection?.run(self,tableView,view,section)
    }

    // MARK: - height
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return delegateHeightForRowAtIndexPath?.run(self,tableView,indexPath) ?? UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return delegateHeightForHeaderInSection?.run(self,tableView,section) ?? UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return delegateHeightForFooterInSection?.run(self,tableView,section) ?? UITableView.automaticDimension
    }
    
    // MARK: - estimatedHeight
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return delegateEstimatedHeightForRowAtIndexPath?.run(self,tableView,indexPath) ?? CGFloat(44.0)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return delegateEstimatedHeightForHeaderInSection?.run(self,tableView,section) ?? CGFloat(44.0)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return delegateEstimatedHeightForFooterInSection?.run(self,tableView,section) ?? CGFloat(44.0)
    }
    
    // MARK: -
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return delegateViewForHeaderInSection?.run(self,tableView,section)
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return delegateViewForFooterInSection?.run(self,tableView,section)
    }
    
    // MARK: -
    
    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        delegateAccessoryButtonTappedForRowWithIndexPath?.run(self,tableView,indexPath)
    }
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return delegateShouldHighlightRowAtIndexPath?.run(self,tableView,indexPath) ?? true
    }
    
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        delegateDidHighlightRowAtIndexPath?.run(self,tableView,indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        delegateDidUnhighlightRowAtIndexPath?.run(self,tableView,indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return delegateWillSelectRowAtIndexPath?.run(self,tableView,indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        return delegateWillDeselectRowAtIndexPath?.run(self,tableView,indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegateDidSelectRowAtIndexPath?.run(self,tableView,indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        delegateDidDeselectRowAtIndexPath?.run(self,tableView,indexPath)
    }
    
    // MARK: -
    
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return delegateEditingStyleForRowAtIndexPath?.run(self,tableView,indexPath) ?? .delete
    }
    
    public func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return delegateTitleForDeleteConfirmationButtonForRowAtIndexPath?.run(self,tableView,indexPath)
    }
    
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return delegateEditActionsForRowAtIndexPath?.run(self,tableView,indexPath)
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return delegateLeadingSwipeActionsConfigurationForRowAtIndexPath?.run(self,tableView,indexPath)
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return delegateTrailingSwipeActionsConfigurationForRowAtIndexPath?.run(self,tableView,indexPath)
    }
    
    // MARK: -
    
    public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return delegateShouldIndentWhileEditingRowAtIndexPath?.run(self,tableView,indexPath) ?? true
    }
    
    // MARK: -
    
    public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        delegateWillBeginEditingRowAtIndexPath?.run(self,tableView,indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        delegateDidEndEditingRowAtIndexPath?.run(self,tableView,indexPath)
    }
    
    // MARK: -
    
    public func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        let source      = sourceIndexPath
        let destination = proposedDestinationIndexPath
        return delegateTargetIndexPathForMovement?.run(self,tableView,source,destination) ?? destination
    }
    
    public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return delegateIndentationLevelForRowAtIndexPath?.run(self,tableView,indexPath) ?? 0
    }
    
    public func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return delegateShouldShowMenuForRowAtIndexPath?.run(self,tableView,indexPath) ?? false
    }
    
    // MARK: -
    
    public func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return delegateCanPerformActionForRowAtIndexPathWithSender?.run(self,tableView,action,indexPath,sender) ?? false
    }
    
    public func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        delegatePerformActionForRowAtIndexPathWithSender?.run(self,tableView,action,indexPath,sender)
    }
    
    public func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return delegateCanFocusRowAtIndexPath?.run(self,tableView,indexPath) ?? true
    }
    
    public func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool {
        return delegateShouldUpdateFocusInContext?.run(self,tableView,context) ?? true
    }
    
    public func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        delegateDidUpdateFocusInContextWithCoordinator?.run(self,tableView,context,coordinator)
    }
    
    public func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {
        return delegateIndexPathForPreferredFocusedView?.run(self,tableView)
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        return delegateShouldSpringLoadRowAtIndexPathWithContext?.run(self,tableView,indexPath,context) ?? true
    }
    
    // MARK: - UITableViewDragDelegate Overrides
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return dragDelegateItemsForBeginningSessionAtIndexPath?.run(self,tableView,session,indexPath) ?? [UIDragItem]()
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        return dragDelegateItemsForAddingToSessionAtIndexPathPoint?.run(self,tableView,session,indexPath,point) ?? [UIDragItem]()
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, dragPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        return dragDelegateDragPreviewParametersForRowAtIndexPath?.run(self,tableView,indexPath)
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, dragSessionWillBegin session: UIDragSession) {
        dragDelegateDragSessionWillBeginSession?.run(self,tableView,session)
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, dragSessionDidEnd session: UIDragSession) {
        dragDelegateDragSessionDidEndSession?.run(self,tableView,session)
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, dragSessionAllowsMoveOperation session: UIDragSession) -> Bool {
        return dragDelegateDragSessionAllowsMoveOperation?.run(self,tableView,session) ?? true
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, dragSessionIsRestrictedToDraggingApplication session: UIDragSession) -> Bool {
        return dragDelegateDragSessionIsRestrictedToDraggingApplication?.run(self,tableView,session) ?? false
    }
    
    // MARK: - UITableViewDropDelegate Overrides
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        dropDelegatePerformDropWithCoordinator?.run(self,tableView,coordinator)
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool {
        return dropDelegateCanHandleSession?.run(self,tableView,session) ?? true
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, dropSessionDidEnter session: UIDropSession) {
        dropDelegateDropSessionDidEnterSession?.run(self,tableView,session)
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        return dropDelegateDropSessionDidUpdateWithDestinationIndexPath?.run(self,tableView,session,destinationIndexPath) ?? UITableViewDropProposal(operation: .cancel)
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, dropSessionDidExit session: UIDropSession) {
        dropDelegateDropSessionDidExitSession?.run(self,tableView,session)
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, dropSessionDidEnd session: UIDropSession) {
        dropDelegateDropSessionDidEndSession?.run(self,tableView,session)
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, dropPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        return dropDelegateDropPreviewParametersForRowAtIndexPath?.run(self,tableView,indexPath)
    }
}
// =====================================================================================================================
// MARK: - AFSTableController.TableBehavior Logic
// =====================================================================================================================
fileprivate extension AFSTableController {
    
    func responds(to aSelector: Selector, for behavior: AFSTableController.TableBehavior) -> Bool {
        
        /// UITableViewDataSource
        if behavior.contains(.dataSourceBasic         ) && handleDataSourceBasicByResponding         (to: aSelector) {
            return true
        }
        if behavior.contains(.dataSourceSectionHeader ) && handleDataSourceSectionHeaderByResponding (to: aSelector) {
            return true
        }
        if behavior.contains(.dataSourceSectionFooter ) && handleDataSourceSectionFooterByResponding (to: aSelector) {
            return true
        }
        if behavior.contains(.dataSourceSectionIndex  ) && handleDataSourceSectionIndexByResponding  (to: aSelector) {
            return true
        }
        if behavior.contains(.dataSourceEditItem      ) && handleDataSourceEditItemByResponding      (to: aSelector) {
            return true
        }
        if behavior.contains(.dataSourceMoveItem      ) && handleDataSourceMoveItemByResponding      (to: aSelector) {
            return true
        }
        /// UITableViewDelegatePrefetching
        if behavior.contains(.dataSourcePrefetching   ) && handleDataSourcePrefetchingByResponding   (to: aSelector) {
            return true
        }
        /// UITableViewDelegate
        if behavior.contains(.delegateWillDisplay     ) && handleDelegateWillDisplayByResponding     (to: aSelector) {
            return true
        }
        if behavior.contains(.delegateDidEndDisplaying) && handleDelegateDidEndDisplayingByResponding(to: aSelector) {
            return true
        }
        if behavior.contains(.delegateHeight          ) && handleDelegateHeightByResponding          (to: aSelector) {
            return true
        }
        if behavior.contains(.delegateEstimatedHeight ) && handleDelegateEstimatedHeightByResponding (to: aSelector) {
            return true
        }
        if behavior.contains(.delegateViewForHeader   ) && handleDelegateViewForHeaderByResponding   (to: aSelector) {
            return true
        }
        if behavior.contains(.delegateViewForFooter   ) && handleDelegateViewForFooterByResponding   (to: aSelector) {
            return true
        }
        if behavior.contains(.delegateAccessoryButton ) && handleDelegateAccessoryButtonByResponding (to: aSelector) {
            return true
        }
        if behavior.contains(.delegateHighlight       ) && handleDelegateHighlightByResponding       (to: aSelector) {
            return true
        }
        if behavior.contains(.delegateSelect          ) && handleDelegateSelectByResponding          (to: aSelector) {
            return true
        }
        if behavior.contains(.delegateDeselect        ) && handleDelegateDeselectByResponding        (to: aSelector) {
            return true
        }
        if behavior.contains(.delegateEditing         ) && handleDelegateEditingByResponding         (to: aSelector) {
            return true
        }
        if behavior.contains(.delegateEditActions     ) && handleDelegateEditActionsByResponding     (to: aSelector) {
            return true
        }
        if #available(iOS 11.0, *) {
            if behavior.contains(.delegateSwipeActions    ) && handleDelegateSwipeActionsByResponding    (to: aSelector) {
                return true
            }
        }
        if behavior.contains(.delegateEditingState    ) && handleDelegateEditingStateByResponding    (to: aSelector) {
            return true
        }
        if behavior.contains(.delegateIndentation     ) && handleDelegateIndentationByResponding     (to: aSelector) {
            return true
        }
        if behavior.contains(.delegateMenu            ) && handleDelegateMenuByResponding            (to: aSelector) {
            return true
        }
        if behavior.contains(.delegateFocus           ) && handleDelegateFocusByResponding           (to: aSelector) {
            return true
        }
        if #available(iOS 11.0, *) {
            if behavior.contains(.delegateSpringLoad      ) && handleDelegateSpringLoadByResponding      (to: aSelector) {
                return true
            }
        }
        if #available(iOS 11.0, *) {
            /// UITableViewDragDelegate
            if behavior.contains(.delegateDragDelegate    ) && handleDragDelegateByResponding            (to: aSelector) {
                return true
            }
            /// UITableViewDropDelegate
            if behavior.contains(.delegateDropDelegate    ) && handleDropDelegateByResponding            (to: aSelector) {
                return true
            }
        }
        return false
    }
}
// =====================================================================================================================
// MARK: - AFSTableController.TableBehavior UITableViewDataSource Logic
// =====================================================================================================================
fileprivate extension AFSTableController {
    
    func handleDataSourceBasicByResponding(to aSelector: Selector) -> Bool {
        
        if  sel_isEqual(aSelector, #selector(UITableViewDataSource.numberOfSections(in:))) ||
            sel_isEqual(aSelector, #selector(UITableViewDataSource.tableView(_:numberOfRowsInSection:))) ||
            sel_isEqual(aSelector, #selector(UITableViewDataSource.tableView(_:cellForRowAt:)))
        {
            guard dataSourceNumberOfSections      != nil else {
                fatalError("You must set dataSourceNumberOfSections for this TableBehavior set")
            }
            guard dataSourceNumberOfRowsInSection != nil else {
                fatalError("You must set dataSourceNumberOfRowsInSection for this TableBehavior set")
            }
            guard dataSourceCellForRawAtIndexPath != nil else {
                fatalError("You must set dataSourceCellForRawAtIndexPath for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDataSourceSectionHeaderByResponding(to aSelector: Selector) -> Bool {
        
        if sel_isEqual(aSelector, #selector(UITableViewDataSource.tableView(_:titleForHeaderInSection:)))
        {
            guard dataSourceTitleForHeaderInSection != nil else {
                fatalError("You must set dataSourceTitleForHeaderInSection for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDataSourceSectionFooterByResponding(to aSelector: Selector) -> Bool {
        
        if  sel_isEqual(aSelector, #selector(UITableViewDataSource.tableView(_:titleForFooterInSection:)))
        {
            guard dataSourceTitleForFooterInSection != nil else {
                fatalError("You must set dataSourceTitleForFooterInSection for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDataSourceSectionIndexByResponding(to aSelector: Selector) -> Bool {
        
        if  sel_isEqual(aSelector, #selector(UITableViewDataSource.sectionIndexTitles(for:))) ||
            sel_isEqual(aSelector, #selector(UITableViewDataSource.tableView(_:sectionForSectionIndexTitle:at:)))
        {
            guard dataSourceSectionIndexTitles                 != nil else {
                fatalError("You must set dataSourceSectionIndexTitles for this TableBehavior set")
            }
            guard dataSourceSectionForSectionIndexTitleAtIndex != nil else {
                fatalError("You must set dataSourceSectionForSectionIndexTitleAtIndex for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDataSourceEditItemByResponding(to aSelector: Selector) -> Bool {
        
        if  sel_isEqual(aSelector, #selector(UITableViewDataSource.tableView(_:canEditRowAt:))) ||
            sel_isEqual(aSelector, #selector(UITableViewDataSource.tableView(_:commit:forRowAt:)))
        {
            guard dataSourceCanEditRowAtIndexPath   != nil else {
                fatalError("You must set dataSourceCanEditRowAtIndexPath for this TableBehavior set")
            }
            guard dataSourceCommitForRowAtIndexPath != nil else {
                fatalError("You must set dataSourceCommitForRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDataSourceMoveItemByResponding(to aSelector: Selector) -> Bool {
        
        if  sel_isEqual(aSelector, #selector(UITableViewDataSource.tableView(_:canMoveRowAt:))) ||
            sel_isEqual(aSelector, #selector(UITableViewDataSource.tableView(_:moveRowAt:to:)))
        {
            guard dataSourceCanMoveRowAtIndexPath          != nil else {
                fatalError("You must set dataSourceCanMoveRowAtIndexPath for this TableBehavior set")
            }
            guard dataSourceMoveRowFromSourceToDestination != nil else {
                fatalError("You must set dataSourceMoveRowFromSourceToDestination for this TableBehavior set")
            }
            return true
        }
        return false
    }
}
// =====================================================================================================================
// MARK: - AFSTableController.TableBehavior UITableViewDataSourcePrefetching Logic
// =====================================================================================================================
fileprivate extension AFSTableController {
    
    func handleDataSourcePrefetchingByResponding(to aSelector: Selector) -> Bool {
        
        if sel_isEqual(aSelector, #selector(UITableViewDataSourcePrefetching.tableView(_:prefetchRowsAt:)))
        {
            guard prefetchingDataSourcePrefetchRowsAtIndexPaths != nil else {
                fatalError("You must set prefetchingDataSourcePrefetchRowsAtIndexPaths for this TableBehavior set")
            }
            return true
        }
        
        if sel_isEqual(aSelector, #selector(UITableViewDataSourcePrefetching.tableView(_:cancelPrefetchingForRowsAt:)))
        {
            guard prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths != nil else {
                fatalError("You must set prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths for this TableBehavior set")
            }
            return true
        }
        return false
    }
}
// =====================================================================================================================
// MARK: - AFSTableController.TableBehavior UITableViewDelegate Logic
// =====================================================================================================================
fileprivate extension AFSTableController {
    
    func handleDelegateWillDisplayByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
        // public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
        // public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int)
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:willDisplay:forRowAt:)))
        {
            guard delegateWillDisplayCellForRowAtIndexPath != nil else {
                fatalError("You must set delegateWillDisplayCellForRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:willDisplayHeaderView:forSection:)))
        {
            guard delegateWillDisplayHeaderViewForSection != nil else {
                fatalError("You must set delegateWillDisplayHeaderViewForSection for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:willDisplayFooterView:forSection:)))
        {
            guard delegateWillDisplayFooterViewForSection != nil else {
                fatalError("You must set delegateWillDisplayFooterViewForSection for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDelegateDidEndDisplayingByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath)
        // public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int)
        // public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int)
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:didEndDisplaying:forRowAt:)))
        {
            guard delegateEndDisplayingCellForRowAtIndexPath != nil else {
                fatalError("You must set delegateEndDisplayingCellForRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:didEndDisplayingHeaderView:forSection:)))
        {
            guard delegateEndDisplayingHeaderViewForSection != nil else {
                fatalError("You must set delegateEndDisplayingHeaderViewForSection for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:didEndDisplayingFooterView:forSection:)))
        {
            guard delegateEndDisplayingFooterViewForSection != nil else {
                fatalError("You must set delegateEndDisplayingFooterViewForSection for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDelegateHeightByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
        // public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
        // public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:heightForRowAt:)))
        {
            guard delegateHeightForRowAtIndexPath != nil else {
                fatalError("You must set delegateHeightForRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:heightForHeaderInSection:)))
        {
            guard delegateHeightForHeaderInSection != nil else {
                fatalError("You must set delegateHeightForHeaderInSection for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:heightForFooterInSection:)))
        {
            guard delegateHeightForFooterInSection != nil else {
                fatalError("You must set delegateHeightForFooterInSection for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDelegateEstimatedHeightByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
        // public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat
        // public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:estimatedHeightForRowAt:)))
        {
            guard delegateEstimatedHeightForRowAtIndexPath != nil else {
                fatalError("You must set delegateEstimatedHeightForRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:estimatedHeightForHeaderInSection:)))
        {
            guard delegateEstimatedHeightForHeaderInSection != nil else {
                fatalError("You must set delegateEstimatedHeightForHeaderInSection for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:estimatedHeightForFooterInSection:)))
        {
            guard delegateEstimatedHeightForFooterInSection != nil else {
                fatalError("You must set delegateEstimatedHeightForFooterInSection for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDelegateViewForHeaderByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:viewForHeaderInSection:)))
        {
            guard delegateViewForHeaderInSection != nil else {
                fatalError("You must set delegateViewForHeaderInSection for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDelegateViewForFooterByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:viewForFooterInSection:)))
        {
            guard delegateViewForFooterInSection != nil else {
                fatalError("You must set delegateViewForFooterInSection for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDelegateAccessoryButtonByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath)
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:accessoryButtonTappedForRowWith:)))
        {
            guard delegateAccessoryButtonTappedForRowWithIndexPath != nil else {
                fatalError("You must set delegateAccessoryButtonTappedForRowWithIndexPath for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDelegateHighlightByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool
        // public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath)
        // public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath)
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:shouldHighlightRowAt:)))
        {
            guard delegateShouldHighlightRowAtIndexPath != nil else {
                fatalError("You must set delegateShouldHighlightRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:didHighlightRowAt:)))
        {
            guard delegateDidHighlightRowAtIndexPath != nil else {
                fatalError("You must set delegateDidHighlightRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:didUnhighlightRowAt:)))
        {
            guard delegateDidUnhighlightRowAtIndexPath != nil else {
                fatalError("You must set delegateDidUnhighlightRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDelegateSelectByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
        // public func tableView(_ tableView: UITableView,  didSelectRowAt indexPath: IndexPath)
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:willSelectRowAt:)))
        {
            guard delegateWillSelectRowAtIndexPath != nil else {
                fatalError("You must set delegateWillSelectRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:didSelectRowAt:)))
        {
            guard delegateDidSelectRowAtIndexPath != nil else {
                fatalError("You must set delegateDidSelectRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDelegateDeselectByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath?
        // public func tableView(_ tableView: UITableView,  didDeselectRowAt indexPath: IndexPath)
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:willDeselectRowAt:)))
        {
            guard delegateWillDeselectRowAtIndexPath != nil else {
                fatalError("You must set delegateWillDeselectRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:didDeselectRowAt:)))
        {
            guard delegateDidDeselectRowAtIndexPath != nil else {
                fatalError("You must set delegateDidDeselectRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDelegateEditingByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle
        // public func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:editingStyleForRowAt:)))
        {
            guard delegateEditingStyleForRowAtIndexPath != nil else {
                fatalError("You must set delegateEditingStyleForRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:titleForDeleteConfirmationButtonForRowAt:)))
        {
            guard delegateTitleForDeleteConfirmationButtonForRowAtIndexPath != nil else {
                fatalError("You must set delegateTitleForDeleteConfirmationButtonForRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDelegateEditActionsByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:editActionsForRowAt:)))
        {
            guard delegateEditActionsForRowAtIndexPath != nil else {
                fatalError("You must set delegateEditActionsForRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    @available(iOS 11.0, *)
    func handleDelegateSwipeActionsByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
        // public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:leadingSwipeActionsConfigurationForRowAt:)))
        {
            guard delegateLeadingSwipeActionsConfigurationForRowAtIndexPath != nil else {
                fatalError("You must set delegateLeadingSwipeActionsConfigurationForRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:trailingSwipeActionsConfigurationForRowAt:)))
        {
            guard delegateTrailingSwipeActionsConfigurationForRowAtIndexPath != nil else {
                fatalError("You must set delegateTrailingSwipeActionsConfigurationForRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDelegateEditingStateByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool
        // public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath)
        // public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?)
        // public func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:shouldIndentWhileEditingRowAt:)))
        {
            guard delegateShouldIndentWhileEditingRowAtIndexPath != nil else {
                fatalError("You must set delegateShouldIndentWhileEditingRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:willBeginEditingRowAt:)))
        {
            guard delegateWillBeginEditingRowAtIndexPath != nil else {
                fatalError("You must set delegateWillBeginEditingRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:didEndEditingRowAt:)))
        {
            guard delegateDidEndEditingRowAtIndexPath != nil else {
                fatalError("You must set delegateDidEndEditingRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:targetIndexPathForMoveFromRowAt:toProposedIndexPath:)))
        {
            guard delegateTargetIndexPathForMovement != nil else {
                fatalError("You must set delegateTargetIndexPathForMovement for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDelegateIndentationByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:indentationLevelForRowAt:)))
        {
            guard delegateIndentationLevelForRowAtIndexPath != nil else {
                fatalError("You must set delegateIndentationLevelForRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDelegateMenuByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool
        // public func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool
        // public func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?)
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:shouldShowMenuForRowAt:)))
        {
            guard delegateShouldShowMenuForRowAtIndexPath != nil else {
                fatalError("You must set delegateShouldShowMenuForRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:canPerformAction:forRowAt:withSender:)))
        {
            guard delegateCanPerformActionForRowAtIndexPathWithSender != nil else {
                fatalError("You must set delegateCanPerformActionForRowAtIndexPathWithSender for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:performAction:forRowAt:withSender:)))
        {
            guard delegatePerformActionForRowAtIndexPathWithSender != nil else {
                fatalError("You must set delegatePerformActionForRowAtIndexPathWithSender for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    func handleDelegateFocusByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool
        // public func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool
        // public func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator)
        // public func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath?
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:canFocusRowAt:)))
        {
            guard delegateCanFocusRowAtIndexPath != nil else {
                fatalError("You must set delegateCanFocusRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:shouldUpdateFocusIn:)))
        {
            guard delegateShouldUpdateFocusInContext != nil else {
                fatalError("You must set delegateShouldUpdateFocusInContext for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:didUpdateFocusIn:with:)))
        {
            guard delegateDidUpdateFocusInContextWithCoordinator != nil else {
                fatalError("You must set delegateDidUpdateFocusInContextWithCoordinator for this TableBehavior set")
            }
            return true
        }
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.indexPathForPreferredFocusedView(in:)))
        {
            guard delegateIndexPathForPreferredFocusedView != nil else {
                fatalError("You must set delegateIndexPathForPreferredFocusedView for this TableBehavior set")
            }
            return true
        }
        return false
    }
    
    @available(iOS 11.0, *)
    func handleDelegateSpringLoadByResponding(to aSelector: Selector) -> Bool {
        // =============================================================================================================
        // public func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool
        // =============================================================================================================
        if sel_isEqual(aSelector, #selector(UITableViewDelegate.tableView(_:shouldSpringLoadRowAt:with:)))
        {
            guard delegateShouldSpringLoadRowAtIndexPathWithContext != nil else {
                fatalError("You must set delegateShouldSpringLoadRowAtIndexPathWithContext for this TableBehavior set")
            }
            return true
        }
        return false
    }
}
// =====================================================================================================================
// MARK: - AFSTableController.TableBehavior UITableViewDragDelegate Logic
// =====================================================================================================================
@available(iOS 11.0, *)
fileprivate extension AFSTableController {
    
    func handleDragDelegateByResponding(to aSelector: Selector) -> Bool {
        
        if sel_isEqual(aSelector, #selector(UITableViewDragDelegate.tableView(_:itemsForBeginning:at:)))
        {
            guard dragDelegateItemsForBeginningSessionAtIndexPath != nil else {
                fatalError("You must set dragDelegateItemsForBeginningSessionAtIndexPath for this TableBehavior set")
            }
            return true
        }
        
        if sel_isEqual(aSelector, #selector(UITableViewDragDelegate.tableView(_:itemsForAddingTo:at:point:)))
        {
            guard dragDelegateItemsForAddingToSessionAtIndexPathPoint != nil else {
                fatalError("You must set dragDelegateItemsForAddingToSessionAtIndexPathPoint for this TableBehavior set")
            }
            return true
        }
        
        if sel_isEqual(aSelector, #selector(UITableViewDragDelegate.tableView(_:dragPreviewParametersForRowAt:)))
        {
            guard dragDelegateDragPreviewParametersForRowAtIndexPath != nil else {
                fatalError("You must set dragDelegateDragPreviewParametersForRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        
        if sel_isEqual(aSelector, #selector(UITableViewDragDelegate.tableView(_:dragSessionWillBegin:)))
        {
            guard dragDelegateDragSessionWillBeginSession != nil else {
                fatalError("You must set dragDelegateDragSessionWillBeginSession for this TableBehavior set")
            }
            return true
        }
        
        if sel_isEqual(aSelector, #selector(UITableViewDragDelegate.tableView(_:dragSessionDidEnd:)))
        {
            guard dragDelegateDragSessionDidEndSession != nil else {
                fatalError("You must set dragDelegateDragSessionDidEndSession for this TableBehavior set")
            }
            return true
        }
        
        if sel_isEqual(aSelector, #selector(UITableViewDragDelegate.tableView(_:dragSessionAllowsMoveOperation:)))
        {
            guard dragDelegateDragSessionAllowsMoveOperation != nil else {
                fatalError("You must set dragDelegateDragSessionAllowsMoveOperation for this TableBehavior set")
            }
            return true
        }
        
        if sel_isEqual(aSelector, #selector(UITableViewDragDelegate.tableView(_:dragSessionIsRestrictedToDraggingApplication:)))
        {
            guard dragDelegateDragSessionIsRestrictedToDraggingApplication != nil else {
                fatalError("You must set dragDelegateDragSessionIsRestrictedToDraggingApplication for this TableBehavior set")
            }
            return true
        }
        
        return false
    }
}
// =====================================================================================================================
// MARK: - AFSTableController.TableBehavior UITableViewDragDelegate Logic
// =====================================================================================================================
@available(iOS 11.0, *)
fileprivate extension AFSTableController {
    
    func handleDropDelegateByResponding(to aSelector: Selector) -> Bool {
        
        if sel_isEqual(aSelector, #selector(UITableViewDropDelegate.tableView(_:performDropWith:)))
        {
            guard dropDelegatePerformDropWithCoordinator != nil else {
                fatalError("You must set dropDelegatePerformDropWithCoordinator for this TableBehavior set")
            }
            return true
        }
        
        if sel_isEqual(aSelector, #selector(UITableViewDropDelegate.tableView(_:canHandle:)))
        {
            guard dropDelegateCanHandleSession != nil else {
                fatalError("You must set dropDelegateCanHandleSession for this TableBehavior set")
            }
            return true
        }
        
        if sel_isEqual(aSelector, #selector(UITableViewDropDelegate.tableView(_:dropSessionDidEnter:)))
        {
            guard dropDelegateDropSessionDidEnterSession != nil else {
                fatalError("You must set dropDelegateDropSessionDidEnterSession for this TableBehavior set")
            }
            return true
        }
        
        if sel_isEqual(aSelector, #selector(UITableViewDropDelegate.tableView(_:dropSessionDidUpdate:withDestinationIndexPath:)))
        {
            guard dropDelegateDropSessionDidUpdateWithDestinationIndexPath != nil else {
                fatalError("You must set dropDelegateDropSessionDidUpdateWithDestinationIndexPath for this TableBehavior set")
            }
            return true
        }
        
        if sel_isEqual(aSelector, #selector(UITableViewDropDelegate.tableView(_:dropSessionDidExit:)))
        {
            guard dropDelegateDropSessionDidExitSession != nil else {
                fatalError("You must set dropDelegateDropSessionDidExitSession for this TableBehavior set")
            }
            return true
        }
        
        if sel_isEqual(aSelector, #selector(UITableViewDropDelegate.tableView(_:dropSessionDidEnd:)))
        {
            guard dropDelegateDropSessionDidEndSession != nil else {
                fatalError("You must set dropDelegateDropSessionDidEndSession for this TableBehavior set")
            }
            return true
        }
        
        if sel_isEqual(aSelector, #selector(UITableViewDropDelegate.tableView(_:dropPreviewParametersForRowAt:)))
        {
            guard dropDelegateDropPreviewParametersForRowAtIndexPath != nil else {
                fatalError("You must set dropDelegateDropPreviewParametersForRowAtIndexPath for this TableBehavior set")
            }
            return true
        }
        return false
    }
}
// =====================================================================================================================
