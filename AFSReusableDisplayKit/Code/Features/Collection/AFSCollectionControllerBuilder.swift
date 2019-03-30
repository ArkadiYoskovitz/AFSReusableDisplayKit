//
//  AFSCollectionControllerBuilder.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/19/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit
///
///
///
public protocol AFSCollectionControllerBuilderProtocol : AFSReusableElementsControllerBuilderProtocol {
    
    /// Cells
    func   registerCell<Element,ViewModel>(via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String, displayElement: Element.Type, displayModel: ViewModel.Type, displayConfiguration handler: @escaping ElementConfiguration<Element,ViewModel>)
    
    func unregisterCell(via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String)
    
    /// Supplementary
    func   registerSupplementary<Element,ViewModel>(displayElementKind displayKind: String, via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String, displayElement: Element.Type, displayModel: ViewModel.Type, displayConfiguration handler: @escaping ElementConfiguration<Element,ViewModel>)
    
    func unregisterSupplementary(displayElementKind displayKind: String, via method: AFSReusableDisplayKit.RegistrationMethod, withReuse identifier: String)
}
///
///
///
public final class AFSCollectionControllerBuilder<DataSource> : AFSScrollControllerBuilder<DataSource>
    where DataSource : AFSMetadataDataSource
{
    // MARK: - typealias
    public typealias ElementsController = AFSCollectionController<DataSource>
    public typealias CollectionBehavior = AFSCollectionController<DataSource>.CollectionBehavior
    
    // MARK: - Stored Properties
    public internal(set) var configurator    : AFSCollectionElementsConfigurator! {
        get { return super.baseConfigurator as? AFSCollectionElementsConfigurator }
        set { super.baseConfigurator = newValue                                            }
    }
    
    public internal(set) var currentBehavior : CollectionBehavior = [.dataSourceBasic] {
        willSet { assert(newValue.contains(.dataSourceBasic), "Input paramater must contain .dataSourceBasic. It may contain additional Behaviors as needed") }
    }
    
    // MARK: Logic holder -
    // MARK: - Stored Properties - UICollectionViewDataSource
    private var _dataSourceNumberOfSections                   : Any?
    private var _dataSourceNumberOfItemInSection              : Any?
    private var _dataSourceCellForItemAtIndexPath             : Any?
    private var _dataSourceSupplementaryAtIndexPath           : Any?
    private var _dataSourceCanMoveRowAtIndexPath              : Any?
    private var _dataSourceMoveRowFromSourceToDestination     : Any?
    private var _dataSourceSectionIndexTitles                 : Any?
    private var _dataSourceSectionForSectionIndexTitleAtIndex : Any?
    
    // MARK: - Access Properties - UICollectionViewDataSource
    @available(iOS 6.0, *)
    internal var dataSourceNumberOfSections : AFSCollectionDataSourceSectionsCount<DataSource>? {
        get { return _dataSourceNumberOfSections as? AFSCollectionDataSourceSectionsCount<DataSource> }
        set { _dataSourceNumberOfSections = newValue }
    }
    
    @available(iOS 6.0, *)
    internal var dataSourceNumberOfItemInSection : AFSCollectionDataSourceItemCountInSection<DataSource>? {
        get { return _dataSourceNumberOfItemInSection as? AFSCollectionDataSourceItemCountInSection<DataSource> }
        set { _dataSourceNumberOfItemInSection = newValue }
    }
    
    @available(iOS 6.0, *)
    internal var dataSourceCellForItemAtIndexPath : AFSCollectionDataSourceItemConfiguration<DataSource>? {
        get { return _dataSourceCellForItemAtIndexPath as? AFSCollectionDataSourceItemConfiguration<DataSource> }
        set { _dataSourceCellForItemAtIndexPath = newValue }
    }
    
    @available(iOS 6.0, *)
    internal var dataSourceSupplementaryAtIndexPath : AFSCollectionDataSourceSupplementary<DataSource>? {
        get { return _dataSourceSupplementaryAtIndexPath as? AFSCollectionDataSourceSupplementary<DataSource> }
        set { _dataSourceSupplementaryAtIndexPath = newValue }
    }
    @available(iOS 9.0, *)
    internal var dataSourceCanMoveRowAtIndexPath : AFSCollectionDataSourceCanMove<DataSource>? {
        get { return _dataSourceCanMoveRowAtIndexPath as? AFSCollectionDataSourceCanMove<DataSource> }
        set { _dataSourceCanMoveRowAtIndexPath = newValue }
    }
    @available(iOS 9.0, *)
    internal var dataSourceMoveRowFromSourceToDestination : AFSCollectionDataSourceMoveRow<DataSource>? {
        get { return _dataSourceMoveRowFromSourceToDestination as? AFSCollectionDataSourceMoveRow<DataSource> }
        set { _dataSourceMoveRowFromSourceToDestination = newValue }
    }
    @available(iOS 6.0, *)
    internal var dataSourceSectionIndexTitles : AFSCollectionDataSourceSectionIndexTitles<DataSource>? {
        get { return _dataSourceSectionIndexTitles as? AFSCollectionDataSourceSectionIndexTitles<DataSource> }
        set { _dataSourceSectionIndexTitles = newValue }
    }
    @available(iOS 6.0, *)
    internal var dataSourceSectionForSectionIndexTitleAtIndex : AFSCollectionDataSourceSectionForSectionIndexTitle<DataSource>? {
        get { return _dataSourceSectionForSectionIndexTitleAtIndex as? AFSCollectionDataSourceSectionForSectionIndexTitle<DataSource> }
        set { _dataSourceSectionForSectionIndexTitleAtIndex = newValue }
    }
    
    // MARK: - Stored Properties - UICollectionViewDelegate
    private var _delegateShouldHighlightItemAtIndexPath               : Any?
    private var _delegateDidHighlightItemAtIndexPath                  : Any?
    private var _delegateDidUnhighlightItemAtIndexPath                : Any?
    private var _delegateShouldSelectItemAt                           : Any?
    private var _delegateShouldDeselectItemAt                         : Any?
    private var _delegateDidSelectItemAtIndexPath                     : Any?
    private var _delegateDidDeselectItemAtIndexPath                   : Any?
    private var _delegateWillDisplayItemAtIndexPath                   : Any?
    private var _delegateWillDisplaySupplementaryAtIndexPath          : Any?
    private var _delegateDidEndDisplayingAtIndexPath                  : Any?
    private var _delegateDidEndDisplayingSupplementaryAtIndexPath     : Any?
    private var _delegateShouldShowMenuForItemAtIndexPath             : Any?
    private var _delegateCanPerformActionForItemAtIndexPathWithSender : Any?
    private var _delegatePerformActionForItemAtIndexPathWithSender    : Any?
    private var _delegateTransitionLayoutFromTo                       : Any?
    private var _delegateCanFocusItemAtIndexPath                      : Any?
    private var _delegateShouldUpdateFocusInContext                   : Any?
    private var _delegateDidUpdateFocusInContextWithCoordinator       : Any?
    private var _delegateIndexPathForPreferredFocusedView             : Any?
    private var _delegateTargetIndexPathForMovement                   : Any?
    private var _delegateTargetContentOffset                          : Any?
    private var _delegateShouldSpringLoadRowAtIndexPathWithContext    : Any?
    
    // MARK: - Access Properties - UICollectionViewDelegate
    @available(iOS 6.0, *)
    internal var delegateShouldHighlightItemAtIndexPath               : AFSCollectionDelegateItemShouldHighlight<DataSource>? {
        get { return _delegateShouldHighlightItemAtIndexPath as? AFSCollectionDelegateItemShouldHighlight<DataSource> }
        set { _delegateShouldHighlightItemAtIndexPath = newValue }
    }
    
    @available(iOS 6.0, *)
    internal var delegateDidHighlightItemAtIndexPath                  : AFSCollectionDelegateItemHighlightAction<DataSource>? {
        get { return _delegateDidHighlightItemAtIndexPath as? AFSCollectionDelegateItemHighlightAction<DataSource> }
        set { _delegateDidHighlightItemAtIndexPath = newValue }
    }
    
    @available(iOS 6.0, *)
    internal var delegateDidUnhighlightItemAtIndexPath                : AFSCollectionDelegateItemHighlightAction<DataSource>? {
        get { return _delegateDidUnhighlightItemAtIndexPath as? AFSCollectionDelegateItemHighlightAction<DataSource> }
        set { _delegateDidUnhighlightItemAtIndexPath = newValue }
    }
    
    @available(iOS 6.0, *)
    internal var delegateShouldSelectItemAt                           : AFSCollectionDelegateItemShouldSelection<DataSource>? {
        get { return _delegateShouldSelectItemAt as? AFSCollectionDelegateItemShouldSelection<DataSource> }
        set { _delegateShouldSelectItemAt = newValue }
    }
    
    @available(iOS 6.0, *)
    internal var delegateShouldDeselectItemAt                         : AFSCollectionDelegateItemShouldSelection<DataSource>? {
        get { return _delegateShouldDeselectItemAt as? AFSCollectionDelegateItemShouldSelection<DataSource> }
        set { _delegateShouldDeselectItemAt = newValue }
    }
    
    @available(iOS 6.0, *)
    internal var delegateDidSelectItemAtIndexPath                     : AFSCollectionDelegateItemSelectAction<DataSource>? {
        get { return _delegateDidSelectItemAtIndexPath as? AFSCollectionDelegateItemSelectAction<DataSource> }
        set { _delegateDidSelectItemAtIndexPath = newValue }
    }
    @available(iOS 6.0, *)
    internal var delegateDidDeselectItemAtIndexPath                   : AFSCollectionDelegateItemSelectAction<DataSource>? {
        get { return _delegateDidDeselectItemAtIndexPath as? AFSCollectionDelegateItemSelectAction<DataSource> }
        set { _delegateDidDeselectItemAtIndexPath = newValue }
    }
    
    @available(iOS 8.0, *)
    internal var delegateWillDisplayItemAtIndexPath                   : AFSCollectionDelegateWillDisplayItem<DataSource>? {
        get { return _delegateWillDisplayItemAtIndexPath as? AFSCollectionDelegateWillDisplayItem<DataSource> }
        set { _delegateWillDisplayItemAtIndexPath = newValue }
    }
    
    @available(iOS 8.0, *)
    internal var delegateWillDisplaySupplementaryAtIndexPath          : AFSCollectionDelegateWillDisplaySupplementary<DataSource>? {
        get { return _delegateWillDisplaySupplementaryAtIndexPath as? AFSCollectionDelegateWillDisplaySupplementary<DataSource> }
        set { _delegateWillDisplaySupplementaryAtIndexPath = newValue }
    }
    
    @available(iOS 6.0, *)
    internal var delegateDidEndDisplayingAtIndexPath                  : AFSCollectionDelegateDidEndDisplayItem<DataSource>? {
        get { return _delegateDidEndDisplayingAtIndexPath as? AFSCollectionDelegateDidEndDisplayItem<DataSource> }
        set { _delegateDidEndDisplayingAtIndexPath = newValue }
    }
    @available(iOS 6.0, *)
    internal var delegateDidEndDisplayingSupplementaryAtIndexPath     : AFSCollectionDelegateDidEndDisplaySupplementary<DataSource>? {
        get { return _delegateDidEndDisplayingSupplementaryAtIndexPath as? AFSCollectionDelegateDidEndDisplaySupplementary<DataSource> }
        set { _delegateDidEndDisplayingSupplementaryAtIndexPath = newValue }
    }
    @available(iOS 6.0, *)
    internal var delegateShouldShowMenuForItemAtIndexPath             : AFSCollectionDelegateShouldShowMenu<DataSource>? {
        get { return _delegateShouldShowMenuForItemAtIndexPath as? AFSCollectionDelegateShouldShowMenu<DataSource> }
        set { _delegateShouldShowMenuForItemAtIndexPath = newValue }
    }
    @available(iOS 6.0, *)
    internal var delegateCanPerformActionForItemAtIndexPathWithSender : AFSCollectionDelegateCanSelectorActionForRow<DataSource>? {
        get { return _delegateCanPerformActionForItemAtIndexPathWithSender as? AFSCollectionDelegateCanSelectorActionForRow<DataSource> }
        set { _delegateCanPerformActionForItemAtIndexPathWithSender = newValue }
    }
    @available(iOS 6.0, *)
    internal var delegatePerformActionForItemAtIndexPathWithSender    : AFSCollectionDelegateSelectorActionForRow<DataSource>? {
        get { return _delegatePerformActionForItemAtIndexPathWithSender as? AFSCollectionDelegateSelectorActionForRow<DataSource> }
        set { _delegatePerformActionForItemAtIndexPathWithSender = newValue }
    }
    
    @available(iOS 7.0, *)
    internal var delegateTransitionLayoutFromTo                       : AFSCollectionDelegateTransitionLayoutFromTo<DataSource>? {
        get { return _delegateTransitionLayoutFromTo as? AFSCollectionDelegateTransitionLayoutFromTo<DataSource> }
        set { _delegateTransitionLayoutFromTo = newValue }
    }
    
    @available(iOS 9.0, *)
    internal var delegateCanFocusItemAtIndexPath                      : AFSCollectionDelegateCanFocusRowAtIndexPath<DataSource>? {
        get { return _delegateCanFocusItemAtIndexPath as? AFSCollectionDelegateCanFocusRowAtIndexPath<DataSource> }
        set { _delegateCanFocusItemAtIndexPath = newValue }
    }
    
    @available(iOS 9.0, *)
    internal var delegateShouldUpdateFocusInContext                   : AFSCollectionDelegateShouldUpdateFocusInContext<DataSource>? {
        get { return _delegateShouldUpdateFocusInContext as? AFSCollectionDelegateShouldUpdateFocusInContext<DataSource> }
        set { _delegateShouldUpdateFocusInContext = newValue }
    }
    @available(iOS 9.0, *)
    internal var delegateDidUpdateFocusInContextWithCoordinator       : AFSCollectionDelegateDidUpdateFocusInContext<DataSource>? {
        get { return _delegateDidUpdateFocusInContextWithCoordinator as? AFSCollectionDelegateDidUpdateFocusInContext<DataSource> }
        set { _delegateDidUpdateFocusInContextWithCoordinator = newValue }
    }
    @available(iOS 9.0, *)
    internal var delegateIndexPathForPreferredFocusedView             : AFSCollectionDelegateIndexPathForPreferredView<DataSource>? {
        get { return _delegateIndexPathForPreferredFocusedView as? AFSCollectionDelegateIndexPathForPreferredView<DataSource> }
        set { _delegateIndexPathForPreferredFocusedView = newValue }
    }
    @available(iOS 9.0, *)
    internal var delegateTargetIndexPathForMovement                   : AFSCollectionDelegateRowFromSourceToDestination<DataSource>? {
        get { return _delegateTargetIndexPathForMovement as? AFSCollectionDelegateRowFromSourceToDestination<DataSource> }
        set { _delegateTargetIndexPathForMovement = newValue }
    }
    
    @available(iOS 9.0, *)
    internal var delegateTargetContentOffset                          : AFSCollectionDelegateTargetContentOffset<DataSource>? {
        get { return _delegateTargetContentOffset as? AFSCollectionDelegateTargetContentOffset<DataSource> }
        set { _delegateTargetContentOffset = newValue }
    }
    
    @available(iOS 11.0, *)
    internal var delegateShouldSpringLoadRowAtIndexPathWithContext : AFSCollectionDelegateShouldSpringLoad<DataSource>? {
        get { return _delegateShouldSpringLoadRowAtIndexPathWithContext as? AFSCollectionDelegateShouldSpringLoad<DataSource> }
        set { _delegateShouldSpringLoadRowAtIndexPathWithContext = newValue }
    }
    
    // MARK: - Stored Properties - UICollectionViewDataSourcePrefetching
    private var _prefetchingDataSourcePrefetchRowsAtIndexPaths             : Any?
    private var _prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths : Any?
    
    // MARK: - Access Properties - UICollectionViewDataSourcePrefetching
    @available(iOS 10.0, *)
    internal var prefetchingDataSourcePrefetchRowsAtIndexPaths             : AFSCollectionDataSourcePrefetch<DataSource>? {
        get { return _prefetchingDataSourcePrefetchRowsAtIndexPaths as? AFSCollectionDataSourcePrefetch<DataSource>}
        set { _prefetchingDataSourcePrefetchRowsAtIndexPaths = newValue }
    }
    @available(iOS 10.0, *)
    internal var prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths : AFSCollectionDataSourcePrefetch<DataSource>? {
        get { return _prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths as? AFSCollectionDataSourcePrefetch<DataSource>}
        set { _prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths = newValue }
    }
    
    // MARK: - Stored Properties - UICollectionViewDragDelegate
    private var _dragDelegateItemsForBeginningSessionAtIndexPath          : Any?
    private var _dragDelegateItemsForAddingToSessionAtIndexPathPoint      : Any?
    private var _dragDelegateDragPreviewParametersForRowAtIndexPath       : Any?
    private var _dragDelegateDragSessionWillBeginSession                  : Any?
    private var _dragDelegateDragSessionDidEndSession                     : Any?
    private var _dragDelegateDragSessionAllowsMoveOperation               : Any?
    private var _dragDelegateDragSessionIsRestrictedToDraggingApplication : Any?
    
    // MARK: - Access Properties - UICollectionViewDragDelegate
    @available(iOS 11.0, *)
    internal var dragDelegateItemsForBeginningSessionAtIndexPath : AFSCollectionDragDelegateBeginningSessionAt<DataSource>? {
        get { return _dragDelegateItemsForBeginningSessionAtIndexPath as? AFSCollectionDragDelegateBeginningSessionAt<DataSource> }
        set { _dragDelegateItemsForBeginningSessionAtIndexPath = newValue }
    }
    @available(iOS 11.0, *)
    internal var dragDelegateItemsForAddingToSessionAtIndexPathPoint : AFSCollectionDragDelegateAddingToSessionAtPoint<DataSource>? {
        get { return _dragDelegateItemsForAddingToSessionAtIndexPathPoint as? AFSCollectionDragDelegateAddingToSessionAtPoint<DataSource> }
        set { _dragDelegateItemsForAddingToSessionAtIndexPathPoint = newValue }
    }
    @available(iOS 11.0, *)
    internal var dragDelegateDragPreviewParametersForRowAtIndexPath : AFSCollectionDragDelegateDragPreviewParameters<DataSource>? {
        get { return _dragDelegateDragPreviewParametersForRowAtIndexPath as? AFSCollectionDragDelegateDragPreviewParameters<DataSource>}
        set { _dragDelegateDragPreviewParametersForRowAtIndexPath = newValue }
    }
    @available(iOS 11.0, *)
    internal var dragDelegateDragSessionWillBeginSession : AFSCollectionDragDelegateDragSessionVoidBlock<DataSource>? {
        get { return _dragDelegateDragSessionWillBeginSession as? AFSCollectionDragDelegateDragSessionVoidBlock<DataSource>}
        set { _dragDelegateDragSessionWillBeginSession = newValue }
    }
    @available(iOS 11.0, *)
    internal var dragDelegateDragSessionDidEndSession : AFSCollectionDragDelegateDragSessionVoidBlock<DataSource>? {
        get { return _dragDelegateDragSessionDidEndSession as? AFSCollectionDragDelegateDragSessionVoidBlock<DataSource> }
        set { _dragDelegateDragSessionDidEndSession = newValue }
    }
    @available(iOS 11.0, *)
    internal var dragDelegateDragSessionAllowsMoveOperation : AFSCollectionDragDelegateDragSessionBoolBlock<DataSource>? {
        get { return _dragDelegateDragSessionAllowsMoveOperation as? AFSCollectionDragDelegateDragSessionBoolBlock<DataSource> }
        set { _dragDelegateDragSessionAllowsMoveOperation = newValue }
    }
    
    @available(iOS 11.0, *)
    internal var dragDelegateDragSessionIsRestrictedToDraggingApplication : AFSCollectionDragDelegateDragSessionBoolBlock<DataSource>? {
        get { return _dragDelegateDragSessionIsRestrictedToDraggingApplication as? AFSCollectionDragDelegateDragSessionBoolBlock<DataSource> }
        set { _dragDelegateDragSessionIsRestrictedToDraggingApplication = newValue }
    }
    
    
    // MARK: - Stored Properties - UICollectionViewDropDelegate
    private var _dropDelegatePerformDropWithCoordinator                   : Any?
    private var _dropDelegateCanHandleSession                             : Any?
    private var _dropDelegateDropSessionDidEnterSession                   : Any?
    private var _dropDelegateDropSessionDidUpdateWithDestinationIndexPath : Any?
    private var _dropDelegateDropSessionDidExitSession                    : Any?
    private var _dropDelegateDropSessionDidEndSession                     : Any?
    private var _dropDelegateDropPreviewParametersForRowAtIndexPath       : Any?
    
    // MARK: - Access Properties - UICollectionViewDropDelegate
    @available(iOS 11.0, *)
    internal var dropDelegatePerformDropWithCoordinator : AFSCollectionDropDelegatePerformDropCoordinator<DataSource>? {
        get { return _dropDelegatePerformDropWithCoordinator as? AFSCollectionDropDelegatePerformDropCoordinator<DataSource> }
        set { _dropDelegatePerformDropWithCoordinator = newValue }
    }
    @available(iOS 11.0, *)
    internal var dropDelegateCanHandleSession : AFSCollectionDropDelegateDropSessionBoolBlock<DataSource>? {
        get { return _dropDelegateCanHandleSession as? AFSCollectionDropDelegateDropSessionBoolBlock<DataSource> }
        set { _dropDelegateCanHandleSession = newValue}
    }
    @available(iOS 11.0, *)
    internal var dropDelegateDropSessionDidEnterSession : AFSCollectionDropDelegateDropSessionVoidBlock<DataSource>? {
        get { return _dropDelegateDropSessionDidEnterSession as? AFSCollectionDropDelegateDropSessionVoidBlock<DataSource> }
        set { _dropDelegateDropSessionDidEnterSession = newValue }
    }
    @available(iOS 11.0, *)
    internal var dropDelegateDropSessionDidUpdateWithDestinationIndexPath : AFSCollectionDropDelegateDidUpdateWithDestination<DataSource>? {
        get { return _dropDelegateDropSessionDidUpdateWithDestinationIndexPath as? AFSCollectionDropDelegateDidUpdateWithDestination<DataSource> }
        set { _dropDelegateDropSessionDidUpdateWithDestinationIndexPath = newValue}
    }
    @available(iOS 11.0, *)
    internal var dropDelegateDropSessionDidExitSession : AFSCollectionDropDelegateDropSessionVoidBlock<DataSource>? {
        get { return _dropDelegateDropSessionDidExitSession as? AFSCollectionDropDelegateDropSessionVoidBlock<DataSource> }
        set { _dropDelegateDropSessionDidExitSession = newValue }
    }
    @available(iOS 11.0, *)
    internal var dropDelegateDropSessionDidEndSession: AFSCollectionDropDelegateDropSessionVoidBlock<DataSource>? {
        get { return _dropDelegateDropSessionDidEndSession as? AFSCollectionDropDelegateDropSessionVoidBlock<DataSource>}
        set { _dropDelegateDropSessionDidEndSession = newValue}
    }
    @available(iOS 11.0, *)
    internal var dropDelegateDropPreviewParametersForRowAtIndexPath : AFSCollectionDropDelegateDropPreviewParameters<DataSource>? {
        get { return _dropDelegateDropPreviewParametersForRowAtIndexPath as? AFSCollectionDropDelegateDropPreviewParameters<DataSource>}
        set { _dropDelegateDropPreviewParametersForRowAtIndexPath = newValue }
    }
    
    // MARK: - Initialization
    public override init(displayType: AFSReusableDisplayKit.DisplayType = .collection)
    {
        super.init(displayType: displayType)
        self.configurator = AFSCollectionElementsConfigurator.init()
    }
    
    // MARK: - Object life cycle
    deinit
    {
        print("\(type(of: self)) was deallocated successfuly")
    }
    
    // MARK: - Object setters
    
    ///
    ///
    ///
    @discardableResult public func setBehavior(_ behaviorToSet: CollectionBehavior) -> Self
    {
        self.currentBehavior = behaviorToSet
        return self
    }
    
    // MARK: -
    
    ///
    /// Build a new table controller object
    ///
    public override func build() -> ElementsController?
    {
        let controller = AFSCollectionController<DataSource>(identifierLogic: identifierLogic, behavior: currentBehavior)
        controller.dataController = dataController
        controller.configurator   = configurator
        applyScrollBlocks(to: controller)
        applyCollectionBlocks(to: controller)
        return controller
    }
    
    ///
    /// Applay delegate Blocks to scroll controller
    ///
    public final func applyCollectionBlocks(to controller: AFSCollectionController<DataSource>)
    {
        if #available(iOS 6.0, *) {
            controller.dataSourceNumberOfSections                   = dataSourceNumberOfSections
            controller.dataSourceNumberOfItemInSection              = dataSourceNumberOfItemInSection
            controller.dataSourceCellForItemAtIndexPath             = dataSourceCellForItemAtIndexPath
            controller.dataSourceSupplementaryAtIndexPath           = dataSourceSupplementaryAtIndexPath
            controller.dataSourceSectionIndexTitles                 = dataSourceSectionIndexTitles
            controller.dataSourceSectionForSectionIndexTitleAtIndex = dataSourceSectionForSectionIndexTitleAtIndex
            
            controller.delegateShouldHighlightItemAtIndexPath               = delegateShouldHighlightItemAtIndexPath
            controller.delegateDidHighlightItemAtIndexPath                  = delegateDidHighlightItemAtIndexPath
            controller.delegateDidUnhighlightItemAtIndexPath                = delegateDidUnhighlightItemAtIndexPath
            controller.delegateShouldSelectItemAt                           = delegateShouldSelectItemAt
            controller.delegateShouldDeselectItemAt                         = delegateShouldDeselectItemAt
            controller.delegateDidSelectItemAtIndexPath                     = delegateDidSelectItemAtIndexPath
            controller.delegateDidDeselectItemAtIndexPath                   = delegateDidDeselectItemAtIndexPath
            
            controller.delegateDidEndDisplayingAtIndexPath                  = delegateDidEndDisplayingAtIndexPath
            controller.delegateDidEndDisplayingSupplementaryAtIndexPath     = delegateDidEndDisplayingSupplementaryAtIndexPath
            controller.delegateShouldShowMenuForItemAtIndexPath             = delegateShouldShowMenuForItemAtIndexPath
            controller.delegateCanPerformActionForItemAtIndexPathWithSender = delegateCanPerformActionForItemAtIndexPathWithSender
            controller.delegatePerformActionForItemAtIndexPathWithSender    = delegatePerformActionForItemAtIndexPathWithSender
        }
        
        if #available(iOS 7.0, *) {
            controller.delegateTransitionLayoutFromTo = delegateTransitionLayoutFromTo
        }
        
        if #available(iOS 8.0, *) {
            controller.delegateWillDisplayItemAtIndexPath          = delegateWillDisplayItemAtIndexPath
            controller.delegateWillDisplaySupplementaryAtIndexPath = delegateWillDisplaySupplementaryAtIndexPath
        }
        
        if #available(iOS 9.0, *) {
            controller.dataSourceCanMoveRowAtIndexPath                = dataSourceCanMoveRowAtIndexPath
            controller.dataSourceMoveRowFromSourceToDestination       = dataSourceMoveRowFromSourceToDestination
            controller.delegateCanFocusItemAtIndexPath                = delegateCanFocusItemAtIndexPath
            controller.delegateShouldUpdateFocusInContext             = delegateShouldUpdateFocusInContext
            controller.delegateDidUpdateFocusInContextWithCoordinator = delegateDidUpdateFocusInContextWithCoordinator
            controller.delegateIndexPathForPreferredFocusedView       = delegateIndexPathForPreferredFocusedView
            controller.delegateTargetIndexPathForMovement             = delegateTargetIndexPathForMovement
            controller.delegateTargetContentOffset                    = delegateTargetContentOffset
        }
        
        if #available(iOS 10.0, *) {
            controller.prefetchingDataSourcePrefetchRowsAtIndexPaths             = prefetchingDataSourcePrefetchRowsAtIndexPaths
            controller.prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths = prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths
        }
        
        if #available(iOS 11.0, *) {
            controller.delegateShouldSpringLoadRowAtIndexPathWithContext        = delegateShouldSpringLoadRowAtIndexPathWithContext
            controller.dragDelegateItemsForBeginningSessionAtIndexPath          = dragDelegateItemsForBeginningSessionAtIndexPath
            controller.dragDelegateItemsForAddingToSessionAtIndexPathPoint      = dragDelegateItemsForAddingToSessionAtIndexPathPoint
            controller.dragDelegateDragPreviewParametersForRowAtIndexPath       = dragDelegateDragPreviewParametersForRowAtIndexPath
            controller.dragDelegateDragSessionWillBeginSession                  = dragDelegateDragSessionWillBeginSession
            controller.dragDelegateDragSessionDidEndSession                     = dragDelegateDragSessionDidEndSession
            controller.dragDelegateDragSessionAllowsMoveOperation               = dragDelegateDragSessionAllowsMoveOperation
            controller.dragDelegateDragSessionIsRestrictedToDraggingApplication = dragDelegateDragSessionIsRestrictedToDraggingApplication
            controller.dropDelegatePerformDropWithCoordinator                   = dropDelegatePerformDropWithCoordinator
            controller.dropDelegateCanHandleSession                             = dropDelegateCanHandleSession
            controller.dropDelegateDropSessionDidEnterSession                   = dropDelegateDropSessionDidEnterSession
            controller.dropDelegateDropSessionDidUpdateWithDestinationIndexPath = dropDelegateDropSessionDidUpdateWithDestinationIndexPath
            controller.dropDelegateDropSessionDidExitSession                    = dropDelegateDropSessionDidExitSession
            controller.dropDelegateDropSessionDidEndSession                     = dropDelegateDropSessionDidEndSession
            controller.dropDelegateDropPreviewParametersForRowAtIndexPath       = dropDelegateDropPreviewParametersForRowAtIndexPath
        }
    }
}
// MARK: -
extension AFSCollectionControllerBuilder : AFSCollectionControllerBuilderProtocol { // MARK: AFSCollectionControllerBuilderProtocol
    
    // MARK: -
    
    // MARK: Cells
    ///
    ///
    ///
    public func   registerCell<Element,ViewModel>(via method: AFSReusableDisplayKit.RegistrationMethod,
                                                  withReuse identifier: String,
                                                  displayElement: Element.Type,
                                                  displayModel: ViewModel.Type,
                                                  displayConfiguration handler: @escaping ElementConfiguration<Element,ViewModel>)
    {
        if dataSourceCellForItemAtIndexPath == nil {
            setDataSourceCellForRawAtIndexPath(handler: AFSCollectionDataSourceItemConfiguration<DataSource>.default.run)
        }
        registerElement(of: .collectionCell(IndexPath()), elementKind: .cell, displayElementKind: String(), via: method, withReuse: identifier,
                        displayElement: displayElement, displayModel: displayModel, displayConfiguration: handler)
    }
    ///
    ///
    ///
    public func unregisterCell(via method: AFSReusableDisplayKit.RegistrationMethod,
                               withReuse identifier: String)
    {
        unregisterElement(of: .collectionCell(IndexPath()), elementKind: .cell, displayElementKind: String(), via: method, withReuse: identifier)
    }
    
    // MARK: Supplementary
    ///
    ///
    ///
    public func   registerSupplementary<Element,ViewModel>(displayElementKind displayKind: String,
                                                           via method: AFSReusableDisplayKit.RegistrationMethod,
                                                           withReuse identifier: String,
                                                           displayElement: Element.Type,
                                                           displayModel: ViewModel.Type,
                                                           displayConfiguration handler: @escaping ElementConfiguration<Element,ViewModel>)
    {
        if dataSourceSupplementaryAtIndexPath == nil {
            setDataSourceSupplementaryAtIndexPath(handler: AFSCollectionDataSourceSupplementary<DataSource>.default.run)
        }
        registerElement(of: .collectionSupplementary(displayKind, 0), elementKind: .supplementary, displayElementKind: displayKind, via: method, withReuse: identifier,
                        displayElement: displayElement, displayModel: displayModel, displayConfiguration: handler)
    }
    
    ///
    ///
    ///
    public func unregisterSupplementary(displayElementKind displayKind: String,
                                        via method: AFSReusableDisplayKit.RegistrationMethod,
                                        withReuse identifier: String)
    {
        unregisterElement(of: .collectionSupplementary(displayKind, 0), elementKind: .supplementary, displayElementKind: String(), via: method, withReuse: identifier)
    }
}
// MARK: -
@available(iOS 6.0, *)
extension AFSCollectionControllerBuilder { // MARK: UICollectionViewDataSource
    
    // MARK: -
    
    ///
    /// Set a new behavior for UICollectionViewDataSource method `numberOfSections(in:)`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDataSourceNumberOfSections(handler block: AFSCollectionHandlersDataSourceSectionsCount<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceNumberOfSections = AFSCollectionDataSourceSectionsCount<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UICollectionViewDataSource method `collectionView(_:numberOfItemsInSection:)`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDataSourceNumberOfRowsInSection(handler block: AFSCollectionHandlersDataSourceItemCountInSection<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceNumberOfItemInSection = AFSCollectionDataSourceItemCountInSection<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UICollectionViewDataSource method `collectionView(_:cellForItemAt:)`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDataSourceCellForRawAtIndexPath(handler block: AFSCollectionHandlersDataSourceItemConfiguration<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceCellForItemAtIndexPath = AFSCollectionDataSourceItemConfiguration<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UICollectionViewDataSource method `collectionView(_:viewForSupplementaryElementOfKind:at:)`
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDataSourceSupplementaryAtIndexPath(handler block: AFSCollectionHandlersDataSourceSupplementary<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceSupplementaryAtIndexPath = AFSCollectionDataSourceSupplementary<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UICollectionViewDataSource method `collectionView(_:canMoveItemAt:)`
    ///
    @available(iOS 9.0, *)
    @discardableResult public func setDataSourceCanMoveRowAtIndexPath(handler block: AFSCollectionHandlersDataSourceCanMove<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceCanMoveRowAtIndexPath = AFSCollectionDataSourceCanMove<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UICollectionViewDataSource method `collectionView(_:moveItemAt:to:)`
    ///
    @available(iOS 9.0, *)
    @discardableResult public func setDataSourceMoveRowFromSourceToDestination(handler block: AFSCollectionHandlersDataSourceMoveRow<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceMoveRowFromSourceToDestination = AFSCollectionDataSourceMoveRow<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UICollectionViewDataSource method `indexTitles(for:)`
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDataSourceSectionIndexTitles(handler block: AFSCollectionHandlersDataSourceSectionIndexTitles<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceSectionIndexTitles = AFSCollectionDataSourceSectionIndexTitles<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Set a new behavior for UICollectionViewDataSource method `collectionView(_:indexPathForIndexTitle:at:)`
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDataSourceSectionForSectionIndexTitleAtIndex(handler block: AFSCollectionHandlersDataSourceSectionForSectionIndexTitle<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dataSourceSectionForSectionIndexTitleAtIndex = AFSCollectionDataSourceSectionForSectionIndexTitle<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
}
// MARK: -
@available(iOS 10.0, *)
extension AFSCollectionControllerBuilder { // MARK: UITableViewDataSourcePrefetching
    
    // MARK: -
    
    ///
    /// Overrides default behavior for UITableViewDataSourcePrefetching method `collectionView(_:prefetchRowsAt:)`.
    ///
    @available(iOS 10.0, *)
    @discardableResult public func setPrefetchingDataSourcePrefetchRowsAtIndexPaths(handler block: AFSCollectionHandlersDataSourcePrefetch<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.prefetchingDataSourcePrefetchRowsAtIndexPaths = AFSCollectionDataSourcePrefetch<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UITableViewDataSourcePrefetching method `collectionView(_:cancelPrefetchingForRowsAt:)`.
    ///
    @available(iOS 10.0, *)
    @discardableResult public func setPrefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths(handler block: AFSCollectionHandlersDataSourcePrefetch<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths = AFSCollectionDataSourcePrefetch<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
}
// MARK: -
@available(iOS 6.0, *)
extension AFSCollectionControllerBuilder { // MARK: UICollectionViewDelegate
    
    // MARK: -
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:shouldHighlightItemAt:) -> Bool`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegateShouldHighlightItemAtIndexPath(handler block: AFSCollectionHandlersDelegateItemShouldHighlight<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateShouldHighlightItemAtIndexPath = AFSCollectionDelegateItemShouldHighlight<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:didHighlightItemAt:)`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegateDidHighlightItemAtIndexPath(handler block: AFSCollectionHandlersDelegateItemHighlightAction<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateDidHighlightItemAtIndexPath = AFSCollectionDelegateItemHighlightAction<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:didUnhighlightItemAt:)`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegateDidUnhighlightItemAtIndexPath(handler block: AFSCollectionHandlersDelegateItemHighlightAction<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateDidUnhighlightItemAtIndexPath = AFSCollectionDelegateItemHighlightAction<DataSource>.init(handler: handlerBlock)
        }
        return self
    }

    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:shouldSelectItemAt:) -> Bool`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegateShouldSelectItemAt(handler block: AFSCollectionHandlersDelegateItemShouldSelection<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateShouldSelectItemAt = AFSCollectionDelegateItemShouldSelection<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:shouldDeselectItemAt:) -> Bool`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegateShouldDeselectItemAt(handler block: AFSCollectionHandlersDelegateItemShouldSelection<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateShouldDeselectItemAt = AFSCollectionDelegateItemShouldSelection<DataSource>.init(handler: handlerBlock)
        }
        return self
    }

    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:didSelectItemAt:)`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegateDidSelectItemAtIndexPath(handler block: AFSCollectionHandlersDelegateItemSelectAction<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateDidSelectItemAtIndexPath = AFSCollectionDelegateItemSelectAction<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:didDeselectItemAt:)`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegateDidDeselectItemAtIndexPath(handler block: AFSCollectionHandlersDelegateItemSelectAction<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateDidDeselectItemAtIndexPath = AFSCollectionDelegateItemSelectAction<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:willDisplay:forItemAt:)`.
    ///
    @available(iOS 8.0, *)
    @discardableResult public func setDelegateWillDisplayItemAtIndexPath(handler block: AFSCollectionHandlersDelegateWillDisplayItem<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateWillDisplayItemAtIndexPath = AFSCollectionDelegateWillDisplayItem<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:willDisplaySupplementaryView:forElementKind:at:)`.
    ///
    @available(iOS 8.0, *)
    @discardableResult public func setDelegateWillDisplaySupplementaryAtIndexPath(handler block: AFSCollectionHandlersDelegateWillDisplaySupplementary<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateWillDisplaySupplementaryAtIndexPath = AFSCollectionDelegateWillDisplaySupplementary<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:didEndDisplaying:forItemAt:)`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegateDidEndDisplayingAtIndexPath(handler block: AFSCollectionHandlersDelegateDidEndDisplayItem<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateDidEndDisplayingAtIndexPath = AFSCollectionDelegateDidEndDisplayItem<DataSource>.init(handler: handlerBlock)
        }
        return self
    }

    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:didEndDisplayingSupplementaryView:forElementOfKind:at:)`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegateDidEndDisplayingSupplementaryAtIndexPath(handler block: AFSCollectionHandlersDelegateDidEndDisplaySupplementary<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateDidEndDisplayingSupplementaryAtIndexPath = AFSCollectionDelegateDidEndDisplaySupplementary<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:shouldShowMenuForItemAt:) -> Bool`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegateShouldShowMenuForItemAtIndexPath(handler block: AFSCollectionHandlersDelegateShouldShowMenu<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateShouldShowMenuForItemAtIndexPath = AFSCollectionDelegateShouldShowMenu<DataSource>.init(handler: handlerBlock)
        }
        return self
    }

    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:canPerformAction:forItemAt:withSender:) -> Bool`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegateCanPerformActionForItemAtIndexPathWithSender(handler block: AFSCollectionHandlersDelegateCanSelectorActionForRow<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateCanPerformActionForItemAtIndexPathWithSender = AFSCollectionDelegateCanSelectorActionForRow<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:performAction:forItemAt:withSender:)`.
    ///
    @available(iOS 6.0, *)
    @discardableResult public func setDelegatePerformActionForItemAtIndexPathWithSender(handler block: AFSCollectionHandlersDelegateSelectorActionForRow<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegatePerformActionForItemAtIndexPathWithSender = AFSCollectionDelegateSelectorActionForRow<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:transitionLayoutForOldLayout:newLayout:) -> UICollectionViewTransitionLayout`.
    ///
    @available(iOS 7.0, *)
    @discardableResult public func setDelegateTransitionLayoutFromTo(handler block: AFSCollectionHandlersDelegateTransitionLayoutFromTo<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateTransitionLayoutFromTo = AFSCollectionDelegateTransitionLayoutFromTo<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:canFocusItemAt:) -> Bool`.
    ///
    @available(iOS 9.0, *)
    @discardableResult public func setDelegateCanFocusItemAtIndexPath(handler block: AFSCollectionHandlersDelegateCanFocusRowAtIndexPath<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateCanFocusItemAtIndexPath = AFSCollectionDelegateCanFocusRowAtIndexPath<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:shouldUpdateFocusIn:) -> Bool`.
    ///
    @available(iOS 9.0, *)
    @discardableResult public func setDelegateShouldUpdateFocusInContext(handler block: AFSCollectionHandlersDelegateShouldUpdateFocusInContext<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateShouldUpdateFocusInContext = AFSCollectionDelegateShouldUpdateFocusInContext<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:didUpdateFocusIn:with:)`.
    ///
    @available(iOS 9.0, *)
    @discardableResult public func setDelegateDidUpdateFocusInContextWithCoordinator(handler block: AFSCollectionHandlersDelegateDidUpdateFocusInContext<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateDidUpdateFocusInContextWithCoordinator = AFSCollectionDelegateDidUpdateFocusInContext<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `indexPathForPreferredFocusedView(in:) -> IndexPath?`.
    ///
    @available(iOS 9.0, *)
    @discardableResult public func setDelegateIndexPathForPreferredFocusedView(handler block: AFSCollectionHandlersDelegateIndexPathForPreferredView<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateIndexPathForPreferredFocusedView = AFSCollectionDelegateIndexPathForPreferredView<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:targetIndexPathForMoveFromItemAt:toProposedIndexPath:) -> IndexPath`.
    ///
    @available(iOS 9.0, *)
    @discardableResult public func setDelegateTargetIndexPathForMovement(handler block: AFSCollectionHandlersDelegateRowFromSourceToDestination<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateTargetIndexPathForMovement = AFSCollectionDelegateRowFromSourceToDestination<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:targetContentOffsetForProposedContentOffset:) -> CGPoint`.
    ///
    @available(iOS 9.0, *)
    @discardableResult public func setDelegateTargetContentOffset(handler block: AFSCollectionHandlersDelegateTargetContentOffset<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateTargetContentOffset = AFSCollectionDelegateTargetContentOffset<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDelegate method `collectionView(_:shouldSpringLoadItemAt:with:) -> Bool`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateShouldSpringLoadRowAtIndexPathWithContext(handler block: AFSCollectionHandlersDelegateShouldSpringLoad<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.delegateShouldSpringLoadRowAtIndexPathWithContext = AFSCollectionDelegateShouldSpringLoad<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
}
// MARK: -
@available(iOS 11.0, *)
extension AFSCollectionControllerBuilder { // MARK: UICollectionViewDragDelegate
    
    // MARK: -
    
    ///
    /// Overrides default behavior for UICollectionViewDragDelegate method `collectionView(_:itemsForBeginning:at:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateItemsForBeginningSessionAtIndexPath(handler block: AFSCollectionHandlersDragDelegateBeginningSessionAt<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dragDelegateItemsForBeginningSessionAtIndexPath = AFSCollectionDragDelegateBeginningSessionAt<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDragDelegate method `collectionView(_:itemsForAddingTo:at:point:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateItemsForAddingToSessionAtIndexPathPoint(handler block: AFSCollectionHandlersDragDelegateAddingToSessionAtPoint<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dragDelegateItemsForAddingToSessionAtIndexPathPoint = AFSCollectionDragDelegateAddingToSessionAtPoint<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDragDelegate method `collectionView(_:dragPreviewParametersForItemAt:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDragPreviewParametersForRowAtIndexPath(handler block: AFSCollectionHandlersDragDelegateDragPreviewParameters<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dragDelegateDragPreviewParametersForRowAtIndexPath = AFSCollectionDragDelegateDragPreviewParameters<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDragDelegate method `collectionView(_:dragSessionWillBegin:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDragSessionWillBeginSession(handler block: AFSCollectionHandlersDragDelegateDragSessionVoidBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dragDelegateDragSessionWillBeginSession = AFSCollectionDragDelegateDragSessionVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDragDelegate method `collectionView(_:dragSessionDidEnd:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDragSessionDidEndSession(handler block: AFSCollectionHandlersDragDelegateDragSessionVoidBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dragDelegateDragSessionDidEndSession = AFSCollectionDragDelegateDragSessionVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDragDelegate method `collectionView(_:dragSessionAllowsMoveOperation:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDragSessionAllowsMoveOperation(handler block: AFSCollectionHandlersDragDelegateDragSessionBoolBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dragDelegateDragSessionAllowsMoveOperation = AFSCollectionDragDelegateDragSessionBoolBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDragDelegate method `collectionView(_:dragSessionIsRestrictedToDraggingApplication:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDragSessionIsRestrictedToDraggingApplication(handler block: AFSCollectionHandlersDragDelegateDragSessionBoolBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dragDelegateDragSessionIsRestrictedToDraggingApplication = AFSCollectionDragDelegateDragSessionBoolBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
}
// MARK: -
@available(iOS 11.0, *)
extension AFSCollectionControllerBuilder { // MARK: UICollectionViewDropDelegate
    
    // MARK: -
    
    ///
    /// Overrides default behavior for UICollectionViewDropDelegate method `collectionView(_:performDropWith:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateShouldSpringLoadRowAtIndexPathWithContext(handler block: AFSCollectionHandlersDropDelegatePerformDropCoordinator<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dropDelegatePerformDropWithCoordinator = AFSCollectionDropDelegatePerformDropCoordinator<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDropDelegate method `collectionView(_:canHandle:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateCanHandleSession(handler block: AFSCollectionHandlersDropDelegateDropSessionBoolBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dropDelegateCanHandleSession = AFSCollectionDropDelegateDropSessionBoolBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDropDelegate method `collectionView(_:dropSessionDidEnter:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDropSessionDidEnterSession(handler block: AFSCollectionHandlersDropDelegateDropSessionVoidBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dropDelegateDropSessionDidEnterSession = AFSCollectionDropDelegateDropSessionVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDropDelegate method `collectionView(_:dropSessionDidUpdate:withDestinationIndexPath:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDropSessionDidUpdateWithDestinationIndexPath(handler block: AFSCollectionHandlersDropDelegateDidUpdateWithDestination<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dropDelegateDropSessionDidUpdateWithDestinationIndexPath = AFSCollectionDropDelegateDidUpdateWithDestination<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDropDelegate method `collectionView(_:dropSessionDidExit:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDropSessionDidExitSession(handler block: AFSCollectionHandlersDropDelegateDropSessionVoidBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dropDelegateDropSessionDidExitSession = AFSCollectionDropDelegateDropSessionVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDropDelegate method `collectionView(_:dropSessionDidEnd:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDropSessionDidEndSession(handler block: AFSCollectionHandlersDropDelegateDropSessionVoidBlock<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dropDelegateDropSessionDidEndSession = AFSCollectionDropDelegateDropSessionVoidBlock<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
    
    ///
    /// Overrides default behavior for UICollectionViewDropDelegate method `collectionView(_:dropPreviewParametersForItemAt:)`.
    ///
    @available(iOS 11.0, *)
    @discardableResult public func setDelegateDropPreviewParametersForRowAtIndexPath(handler block: AFSCollectionHandlersDropDelegateDropPreviewParameters<DataSource>?) -> Self
    {
        if let handlerBlock = block {
            self.dropDelegateDropPreviewParametersForRowAtIndexPath = AFSCollectionDropDelegateDropPreviewParameters<DataSource>.init(handler: handlerBlock)
        }
        return self
    }
}
