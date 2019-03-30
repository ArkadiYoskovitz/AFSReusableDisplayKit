//
//  AFSCollectionController.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/19/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit
///
///
///
extension AFSCollectionController.CollectionBehavior {
    
    // MARK: - DataSource
    public static var dataSourceBasic          : AFSCollectionController.CollectionBehavior { return AFSCollectionController.CollectionBehavior(rawValue: 1 << 00) }
    public static var dataSourceExtra          : AFSCollectionController.CollectionBehavior { return AFSCollectionController.CollectionBehavior(rawValue: 1 << 01) }
    
    // MARK: - Prefetching
    public static var dataSourcePrefetching    : AFSCollectionController.CollectionBehavior { return AFSCollectionController.CollectionBehavior(rawValue: 1 << 02) }
    
    // MARK: - Delegate
    public static var delegate                 : AFSCollectionController.CollectionBehavior { return AFSCollectionController.CollectionBehavior(rawValue: 1 << 03) }
    
    // MARK: - DragDelegate
    public static var delegateDragDelegate     : AFSCollectionController.CollectionBehavior { return AFSCollectionController.CollectionBehavior(rawValue: 1 << 04) }
    
    // MARK: - DropDelegate
    public static var delegateDropDelegate     : AFSCollectionController.CollectionBehavior { return AFSCollectionController.CollectionBehavior(rawValue: 1 << 05) }
}
// =====================================================================================================================
//
// =====================================================================================================================
public final class AFSCollectionController<DataSource> : AFSScrollController<DataSource> ,
    UICollectionViewDataSource,
    UICollectionViewDataSourcePrefetching,
    UICollectionViewDelegate,
    UICollectionViewDragDelegate,
    UICollectionViewDropDelegate
    where
    DataSource : AFSMetadataDataSource
{
    // MARK: - Typealias
    
    // MARK: - Enum Types
    
    // MARK: - Struct Types
    public struct CollectionBehavior : OptionSet {
        
        public let  rawValue: Int
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
    
    // MARK: - Stored Properties
    public internal(set) var configurator    : AFSCollectionElementsConfigurator! {
        get { return super.baseConfigurator as? AFSCollectionElementsConfigurator }
        set { super.baseConfigurator = newValue                                       }
    }
    
    public internal(set) var currentBehavior : AFSCollectionController.CollectionBehavior = [] {
        willSet { assert(newValue.contains(.dataSourceBasic), "Input paramater must contain .dataSourceBasic. It may contain additional Behaviors as needed") }
    }
    
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
        get { return _delegateTransitionLayoutFromTo as? AFSCollectionDelegateCanFocusRowAtIndexPath<DataSource> }
        set { _delegateTransitionLayoutFromTo = newValue }
    }
    
    @available(iOS 9.0, *)
    internal var delegateShouldUpdateFocusInContext                   : AFSCollectionDelegateShouldUpdateFocusInContext<DataSource>? {
        get { return _delegateTransitionLayoutFromTo as? AFSCollectionDelegateShouldUpdateFocusInContext<DataSource> }
        set { _delegateTransitionLayoutFromTo = newValue }
    }
    @available(iOS 9.0, *)
    internal var delegateDidUpdateFocusInContextWithCoordinator       : AFSCollectionDelegateDidUpdateFocusInContext<DataSource>? {
        get { return _delegateTransitionLayoutFromTo as? AFSCollectionDelegateDidUpdateFocusInContext<DataSource> }
        set { _delegateTransitionLayoutFromTo = newValue }
    }
    @available(iOS 9.0, *)
    internal var delegateIndexPathForPreferredFocusedView             : AFSCollectionDelegateIndexPathForPreferredView<DataSource>? {
        get { return _delegateTransitionLayoutFromTo as? AFSCollectionDelegateIndexPathForPreferredView<DataSource> }
        set { _delegateTransitionLayoutFromTo = newValue }
    }
    @available(iOS 9.0, *)
    internal var delegateTargetIndexPathForMovement                   : AFSCollectionDelegateRowFromSourceToDestination<DataSource>? {
        get { return _delegateTransitionLayoutFromTo as? AFSCollectionDelegateRowFromSourceToDestination<DataSource> }
        set { _delegateTransitionLayoutFromTo = newValue }
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
    
    // MARK: - Subscript
    
    // MARK: - Initialization
    public init(identifierLogic : AFSReusableIdentifier<DataSource>, behavior: AFSCollectionController.CollectionBehavior = .dataSourceBasic) {
        assert(behavior.contains(.dataSourceBasic), "behavior paramater must contain .dataSourceBasic, it may contain additional Behaviors as needed")
        self.currentBehavior = behavior
        super.init(identifierLogic: identifierLogic)
    }
    
    // MARK: - Object life cycle
    deinit {
        print("\(type(of: self)) was deallocated successfuly")
    }
    
    // MARK: - NSObject override
    public override func responds(to aSelector: Selector!) -> Bool
    {
        guard let input = aSelector else { return super.responds(to: aSelector) }
        
        if #available(iOS 11.0, *) {
            
            if  input.isMember(of: UICollectionViewDelegate    .self) ||
                input.isMember(of: UICollectionViewDragDelegate.self) ||
                input.isMember(of: UICollectionViewDropDelegate.self) ||
                input.isMember(of: UICollectionViewDataSource  .self) ||
                input.isMember(of: UICollectionViewDataSourcePrefetching.self)
            {
                return responds(to: input, for: currentBehavior)
            }
            
        } else if #available(iOS 10.0, *) {
            
            if  input.isMember(of: UICollectionViewDelegate    .self) ||
                input.isMember(of: UICollectionViewDataSource  .self) ||
                input.isMember(of: UICollectionViewDataSourcePrefetching.self)
            {
                return responds(to: input, for: currentBehavior)
            }
            
        } else {
            
            if  input.isMember(of: UICollectionViewDelegate  .self) ||
                input.isMember(of: UICollectionViewDataSource.self)
            {
                return responds(to: input, for: currentBehavior)
            }
        }
        
        guard let proxy = delegateProxy else { return super.responds(to: aSelector) }
        guard proxy.responds(to: input) else { return super.responds(to: aSelector) }
        return true
    }
    
    public override func conforms(to aProtocol: Protocol) -> Bool {
        
        if #available(iOS 11.0, *) {
            
            guard protocol_conformsToProtocol(aProtocol, UICollectionViewDelegate  .self) ||
                protocol_conformsToProtocol(aProtocol, UICollectionViewDataSource  .self) ||
                protocol_conformsToProtocol(aProtocol, UICollectionViewDragDelegate.self) ||
                protocol_conformsToProtocol(aProtocol, UICollectionViewDropDelegate.self) ||
                protocol_conformsToProtocol(aProtocol, UICollectionViewDataSourcePrefetching.self) else {
                    return super.conforms(to: aProtocol)
            }
            
        } else if #available(iOS 10.0, *) {
            
            guard protocol_conformsToProtocol(aProtocol, UICollectionViewDelegate.self) ||
                protocol_conformsToProtocol(aProtocol, UICollectionViewDataSource.self) ||
                protocol_conformsToProtocol(aProtocol, UICollectionViewDataSourcePrefetching.self) else {
                    return super.conforms(to: aProtocol)
            }
            
        } else {
            
            guard protocol_conformsToProtocol(aProtocol, UICollectionViewDelegate.self) ||
                protocol_conformsToProtocol(aProtocol, UICollectionViewDataSource.self) else {
                    return super.conforms(to: aProtocol)
            }
        }
        
        guard let proxy = delegateProxy     else { return super.conforms(to: aProtocol) }
        guard proxy.conforms(to: aProtocol) else { return super.conforms(to: aProtocol) }
        return true
    }
    
    // MARK: - Collection Controller Protocols
    // =================================================================================================================
    public func connect(to collectionView: UICollectionView)
    {
        configurator.registerElements(to: collectionView)
    
        if #available(iOS 2.0, *) {
            collectionView.dataSource = self
            collectionView.delegate   = self
        }
        if #available(iOS 10.0, *) {
            collectionView.prefetchDataSource = self
        }
        if #available(iOS 11.0, *) {
            collectionView.dragDelegate = self
            collectionView.dropDelegate = self
        }
    }
    
    // MARK: - Collection Controller Protocols
    // =================================================================================================================
    
    // MARK: - UICollectionViewDataSource
    // =================================================================================================================
    
    // MARK: - Basic
    @available(iOS 6.0, *)
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSourceNumberOfSections?.run(self,collectionView) ?? 1
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSourceNumberOfItemInSection?.run(self,collectionView,section) ?? 0
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return dataSourceCellForItemAtIndexPath?.run(self,collectionView,indexPath) ?? UICollectionViewCell.init()
    }
    
    // MARK: Supplementary
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView  {
        return dataSourceSupplementaryAtIndexPath?.run(self,collectionView,kind,indexPath) ?? UICollectionViewCell.init()
    }
    
    // MARK: Moving / Reordering support
    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return dataSourceCanMoveRowAtIndexPath?.run(self,collectionView,indexPath) ?? true
    }
    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        dataSourceMoveRowFromSourceToDestination?.run(self,collectionView,sourceIndexPath,destinationIndexPath)
    }
    
    // MARK: Index
    
    @available(iOS 6.0, *)
    public func indexTitles(for collectionView: UICollectionView) -> [String]? {
        return dataSourceSectionIndexTitles?.run(self,collectionView) ?? nil
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
        return dataSourceSectionForSectionIndexTitleAtIndex?.run(self,collectionView,title,index) ?? IndexPath(index: 0)
    }
    
    // MARK: - UICollectionViewDataSourcePrefetching
    @available(iOS 10.0, *)
    public func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        prefetchingDataSourcePrefetchRowsAtIndexPaths?.run(self,collectionView,indexPaths)
    }
    @available(iOS 10.0, *)
    public func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths?.run(self,collectionView,indexPaths)
    }
    
    // MARK: - UICollectionViewDelegate
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return delegateShouldHighlightItemAtIndexPath?.run(self,collectionView,indexPath) ?? true
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        delegateDidHighlightItemAtIndexPath?.run(self,collectionView,indexPath)
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        delegateDidUnhighlightItemAtIndexPath?.run(self,collectionView,indexPath)
    }

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return delegateShouldSelectItemAt?.run(self,collectionView,indexPath) ?? true
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        return delegateShouldDeselectItemAt?.run(self,collectionView,indexPath) ?? true
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegateDidSelectItemAtIndexPath?.run(self,collectionView,indexPath)
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        delegateDidDeselectItemAtIndexPath?.run(self,collectionView,indexPath)
    }
    
    @available(iOS 8.0, *)
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        delegateWillDisplayItemAtIndexPath?.run(self,collectionView,cell,indexPath)
    }
    
    @available(iOS 8.0, *)
    public func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        delegateWillDisplaySupplementaryAtIndexPath?.run(self,collectionView,view,elementKind,indexPath)
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        delegateDidEndDisplayingAtIndexPath?.run(self,collectionView,cell,indexPath)
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        delegateDidEndDisplayingSupplementaryAtIndexPath?.run(self,collectionView,view,elementKind,indexPath)
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return delegateShouldShowMenuForItemAtIndexPath?.run(self,collectionView,indexPath) ?? false
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return delegateCanPerformActionForItemAtIndexPathWithSender?.run(self,collectionView,action,indexPath,sender) ?? false
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        delegatePerformActionForItemAtIndexPathWithSender?.run(self,collectionView,action,indexPath,sender)
    }
    
    @available(iOS 7.0, *)
    public func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        return delegateTransitionLayoutFromTo?.run(self,collectionView,fromLayout,toLayout) ?? UICollectionViewTransitionLayout.init(currentLayout: fromLayout, nextLayout: toLayout)
    }
    
    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return delegateCanFocusItemAtIndexPath?.run(self,collectionView,indexPath) ?? true
    }
    
    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool {
        return delegateShouldUpdateFocusInContext?.run(self,collectionView,context) ?? true
    }
    
    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        delegateDidUpdateFocusInContextWithCoordinator?.run(self,collectionView,context,coordinator)
    }
    
    @available(iOS 9.0, *)
    public func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath? {
        return delegateIndexPathForPreferredFocusedView?.run(self,collectionView)
    }
    
    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
        let source      = originalIndexPath
        let destination = proposedIndexPath
        return delegateTargetIndexPathForMovement?.run(self,collectionView,source,destination) ?? destination
    }
    
    @available(iOS 9.0, *)
    public func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return delegateTargetContentOffset?.run(self,collectionView,proposedContentOffset) ?? CGPoint.zero
    }
    
    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, shouldSpringLoadItemAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        return delegateShouldSpringLoadRowAtIndexPathWithContext?.run(self,collectionView,indexPath,context) ?? true
    }
    
    // MARK: - UICollectionViewDragDelegate Overrides
    
    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return dragDelegateItemsForBeginningSessionAtIndexPath?.run(self,collectionView,session,indexPath) ?? [UIDragItem]()
    }
    
    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        return dragDelegateItemsForAddingToSessionAtIndexPathPoint?.run(self,collectionView,session,indexPath,point) ?? [UIDragItem]()
    }
    
    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, dragPreviewParametersForItemAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        return dragDelegateDragPreviewParametersForRowAtIndexPath?.run(self,collectionView,indexPath)
    }
    
    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, dragSessionWillBegin session: UIDragSession) {
        dragDelegateDragSessionWillBeginSession?.run(self,collectionView,session)
    }
    
    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, dragSessionDidEnd session: UIDragSession) {
        dragDelegateDragSessionDidEndSession?.run(self,collectionView,session)
    }

    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, dragSessionAllowsMoveOperation session: UIDragSession) -> Bool {
        return dragDelegateDragSessionAllowsMoveOperation?.run(self,collectionView,session) ?? true
    }
    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, dragSessionIsRestrictedToDraggingApplication session: UIDragSession) -> Bool {
        return dragDelegateDragSessionIsRestrictedToDraggingApplication?.run(self,collectionView,session) ?? false
    }
    
    // MARK: - UICollectionViewDropDelegate Overrides

    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        dropDelegatePerformDropWithCoordinator?.run(self,collectionView,coordinator)
    }
    
    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
        return dropDelegateCanHandleSession?.run(self,collectionView,session) ?? true
    }
    
    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, dropSessionDidEnter session: UIDropSession) {
        dropDelegateDropSessionDidEnterSession?.run(self,collectionView,session)
    }
    
    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        return dropDelegateDropSessionDidUpdateWithDestinationIndexPath?.run(self,collectionView,session,destinationIndexPath) ?? UICollectionViewDropProposal(operation: .cancel)
    }

    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, dropSessionDidExit session: UIDropSession) {
        dropDelegateDropSessionDidExitSession?.run(self,collectionView,session)
    }

    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, dropSessionDidEnd session: UIDropSession) {
        dropDelegateDropSessionDidEndSession?.run(self,collectionView,session)
    }
    
    @available(iOS 11.0, *)
    public func collectionView(_ collectionView: UICollectionView, dropPreviewParametersForItemAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        return dropDelegateDropPreviewParametersForRowAtIndexPath?.run(self,collectionView,indexPath)
    }
}
// =====================================================================================================================
// MARK: - AFSCollectionController.CollectionBehavior Logic
// =====================================================================================================================
fileprivate extension AFSCollectionController {
    
     func responds(to aSelector: Selector, for behavior: AFSCollectionController.CollectionBehavior) -> Bool {
        
        if #available(iOS 10.0, *) {
            /// UITableViewDelegatePrefetching
            if behavior.contains(.dataSourcePrefetching) && handleDataSourcePrefetchingByResponding(to: aSelector) {
                return true
            }
        }
        
        /// UICollectionViewDelegate
        if behavior.contains(.delegate) && handleDelegateByResponding(to: aSelector) {
            return true
        }
        
        if #available(iOS 11.0, *) {
            /// UICollectionViewDragDelegate
            if behavior.contains(.delegateDragDelegate) && handleDragDelegateByResponding(to: aSelector) {
                return true
            }
            /// UICollectionViewDropDelegate
            if behavior.contains(.delegateDropDelegate) && handleDropDelegateByResponding(to: aSelector) {
                return true
            }
        }
        
        /// UICollectionViewDataSource
        if behavior.contains(.dataSourceExtra) && handleDataSourceByResponding(to: aSelector) {
            return true
        }
        if behavior.contains(.dataSourceBasic) && handleDataSourceByResponding(to: aSelector) {
            return true
        }
        return false
    }
}
// =====================================================================================================================
// MARK: - AFSCollectionController.CollectionBehavior UICollectionViewDataSource Logic
// =====================================================================================================================
fileprivate extension AFSCollectionController {
    
    // MARK: - Basic
    // MARK: Supplementary
     func handleDataSourceByResponding(to aSelector: Selector) -> Bool {
        
        if  sel_isEqual(aSelector, #selector(UICollectionViewDataSource.numberOfSections(in:))) ||
            sel_isEqual(aSelector, #selector(UICollectionViewDataSource.collectionView(_:numberOfItemsInSection:))) ||
            sel_isEqual(aSelector, #selector(UICollectionViewDataSource.collectionView(_:cellForItemAt:)))
        {
            guard dataSourceNumberOfSections      != nil else {
                fatalError("You must set dataSourceNumberOfSections for this CollectionBehavior set")
            }
            guard dataSourceNumberOfItemInSection != nil else {
                fatalError("You must set dataSourceNumberOfItemInSection for this CollectionBehavior set")
            }
            guard dataSourceCellForItemAtIndexPath != nil else {
                fatalError("You must set dataSourceCellForItemAtIndexPath for this CollectionBehavior set")
            }
            return true
        }
        
        switch aSelector {
        case #selector(UICollectionViewDataSource.collectionView(_:viewForSupplementaryElementOfKind:at:)):
            
            guard dataSourceSupplementaryAtIndexPath != nil else { break }
            return true
            
        case #selector(UICollectionViewDataSource.collectionView(_:canMoveItemAt:)):
            guard dataSourceCanMoveRowAtIndexPath != nil else { break }
            return true
            
        case #selector(UICollectionViewDataSource.collectionView(_:moveItemAt:to:)):
            guard dataSourceMoveRowFromSourceToDestination != nil else { break }
            return true
            
        case #selector(UICollectionViewDataSource.indexTitles(for:)):
            guard dataSourceSectionIndexTitles != nil else { break }
            return true
            
        case #selector(UICollectionViewDataSource.collectionView(_:indexPathForIndexTitle:at:)):
            guard dataSourceSectionForSectionIndexTitleAtIndex != nil else { break }
            return true
            
        default:
            break
        }
        
        return false
    }
}
// =====================================================================================================================
// MARK: - AFSCollectionController.CollectionBehavior UICollectionViewDataSourcePrefetching Logic
// =====================================================================================================================
@available(iOS 10.0, *)
fileprivate extension AFSCollectionController {
    
     func handleDataSourcePrefetchingByResponding(to aSelector: Selector) -> Bool {
        
        switch aSelector {
        case #selector(UICollectionViewDataSourcePrefetching.collectionView(_:prefetchItemsAt: )):
            guard prefetchingDataSourcePrefetchRowsAtIndexPaths != nil else { break }
            return true
            
        case #selector(UITableViewDataSourcePrefetching.tableView(_:cancelPrefetchingForRowsAt:)):
            guard prefetchingDataSourceCancelPrefetchingForRowsAtIndexPaths != nil else { break }
            return true
            
        default:
            break
        }
        return false
    }
}
// =====================================================================================================================
// MARK: - AFSCollectionController.CollectionBehavior UICollectionViewDelegate Logic
// =====================================================================================================================
fileprivate extension AFSCollectionController {
    
     func handleDelegateByResponding(to aSelector: Selector) -> Bool {
        
        if #available(iOS 11.0, *) {
            switch aSelector {
            case #selector(UICollectionViewDelegate.collectionView(_:shouldSpringLoadItemAt:with:)):
                guard delegateShouldSpringLoadRowAtIndexPathWithContext != nil else { break }
                return true
            default: break
            }
        }
        
        switch aSelector {
        case #selector(UICollectionViewDelegate.collectionView(_:shouldHighlightItemAt:)):
            guard delegateShouldHighlightItemAtIndexPath != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:didHighlightItemAt:)):
            guard delegateDidHighlightItemAtIndexPath != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:didUnhighlightItemAt:)):
            guard delegateDidUnhighlightItemAtIndexPath != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:shouldSelectItemAt:)):
            guard delegateShouldSelectItemAt != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:shouldDeselectItemAt:)):
            guard delegateShouldDeselectItemAt != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:didSelectItemAt:)):
            guard delegateDidSelectItemAtIndexPath != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:didDeselectItemAt:)):
            guard delegateDidDeselectItemAtIndexPath != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:willDisplay:forItemAt:)):
            guard delegateWillDisplayItemAtIndexPath != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:willDisplaySupplementaryView:forElementKind:at:)):
            guard delegateWillDisplaySupplementaryAtIndexPath != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:didEndDisplaying:forItemAt:)):
            guard delegateDidEndDisplayingAtIndexPath != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:didEndDisplayingSupplementaryView:forElementOfKind:at:)):
            guard delegateDidEndDisplayingSupplementaryAtIndexPath != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:shouldShowMenuForItemAt:)):
            guard delegateShouldShowMenuForItemAtIndexPath != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:canPerformAction:forItemAt:withSender:)):
            guard delegateCanPerformActionForItemAtIndexPathWithSender != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:performAction:forItemAt:withSender:)):
            guard delegatePerformActionForItemAtIndexPathWithSender != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:transitionLayoutForOldLayout:newLayout:)):
            guard delegateTransitionLayoutFromTo != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:canFocusItemAt:)):
            guard delegateCanFocusItemAtIndexPath != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:shouldUpdateFocusIn:)):
            guard delegateShouldUpdateFocusInContext != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:didUpdateFocusIn:with:)):
            guard delegateDidUpdateFocusInContextWithCoordinator != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.indexPathForPreferredFocusedView(in:)):
            guard delegateIndexPathForPreferredFocusedView != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:targetIndexPathForMoveFromItemAt:toProposedIndexPath:)):
            guard delegateTargetIndexPathForMovement != nil else { break }
            return true
            
        case #selector(UICollectionViewDelegate.collectionView(_:targetContentOffsetForProposedContentOffset:)):
            guard delegateTargetContentOffset != nil else { break }
            return true
            
        default:
            break
        }
        return false
    }
}
// =====================================================================================================================
// MARK: - AFSCollectionController.CollectionBehavior UICollectionViewDragDelegate Logic
// =====================================================================================================================
@available(iOS 11.0, *)
fileprivate extension AFSCollectionController {
    
     func handleDragDelegateByResponding(to aSelector: Selector) -> Bool {
        
        switch aSelector {
        case #selector(UICollectionViewDragDelegate.collectionView(_:itemsForBeginning:at:)):
            guard dragDelegateItemsForBeginningSessionAtIndexPath != nil else {
                fatalError("You must set dragDelegateItemsForBeginningSessionAtIndexPath for this CollectionBehavior set")
            }
            return true
            
        case #selector(UICollectionViewDragDelegate.collectionView(_:itemsForAddingTo:at:point:)):
            guard dragDelegateItemsForAddingToSessionAtIndexPathPoint != nil else { break }
            return true
            
        case #selector(UICollectionViewDragDelegate.collectionView(_:dragPreviewParametersForItemAt:)):
            guard dragDelegateDragPreviewParametersForRowAtIndexPath != nil else { break }
            return true
            
        case #selector(UICollectionViewDragDelegate.collectionView(_:dragSessionWillBegin:)):
            guard dragDelegateDragSessionWillBeginSession != nil else { break }
            return true
            
        case #selector(UICollectionViewDragDelegate.collectionView(_:dragSessionDidEnd:)):
            guard dragDelegateDragSessionDidEndSession != nil else { break }
            return true
            
        case #selector(UICollectionViewDragDelegate.collectionView(_:dragSessionAllowsMoveOperation:)):
            guard dragDelegateDragSessionAllowsMoveOperation != nil else { break }
            return true
            
        case #selector(UICollectionViewDragDelegate.collectionView(_:dragSessionIsRestrictedToDraggingApplication:)):
            guard dragDelegateDragSessionIsRestrictedToDraggingApplication != nil else { break }
            return true
            
        default:
            break
        }
        return false
    }
}
// =====================================================================================================================
// MARK: - AFSCollectionController.CollectionBehavior UICollectionViewDragDelegate Logic
// =====================================================================================================================
@available(iOS 11.0, *)
fileprivate extension AFSCollectionController {
    
     func handleDropDelegateByResponding(to aSelector: Selector) -> Bool {
        
        let dropSessionDidUpdate = #selector(UICollectionViewDropDelegate.collectionView(_:dropSessionDidUpdate:withDestinationIndexPath:))
        
        switch aSelector {
        case #selector(UICollectionViewDropDelegate.collectionView(_:performDropWith:)):
            guard dropDelegatePerformDropWithCoordinator != nil else {
                fatalError("You must set dropDelegatePerformDropWithCoordinator for this CollectionBehavior set")
            }
            return true
            
        case #selector(UICollectionViewDropDelegate.collectionView(_:canHandle:)):
            guard dropDelegateCanHandleSession != nil else { break }
            return true
            
        case #selector(UICollectionViewDropDelegate.collectionView(_:dropSessionDidEnter:)):
            guard dropDelegateDropSessionDidEnterSession != nil else { break }
            return true
            
        case dropSessionDidUpdate:
            guard dropDelegateDropSessionDidUpdateWithDestinationIndexPath != nil else { break }
            return true
            
        case #selector(UICollectionViewDropDelegate.collectionView(_:dropSessionDidExit:)):
            guard dropDelegateDropSessionDidExitSession != nil else { break }
            return true
            
        case #selector(UICollectionViewDropDelegate.collectionView(_:dropSessionDidEnd:)):
            guard dropDelegateDropSessionDidEndSession != nil else { break }
            return true
            
        case #selector(UICollectionViewDropDelegate.collectionView(_:dropPreviewParametersForItemAt:)):
            guard dropDelegateDropPreviewParametersForRowAtIndexPath != nil else { break }
            return true
            
        default:
            break
        }
        
        return false
    }
}
