//
//  AFSCollectionLogicHandlersStructs.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/19/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

/// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Logic holder structs
/// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Struct --- DataSource
// =====================================================================================================================
@available(iOS 6.0, *)
public struct AFSCollectionDataSourceSectionsCount<DataSource: AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDataSourceSectionsCount<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDataSourceSectionsCount<DataSource>)
    {
        run = block
    }
}
@available(iOS 6.0, *)
public struct AFSCollectionDataSourceItemCountInSection<DataSource: AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDataSourceItemCountInSection<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDataSourceItemCountInSection<DataSource>)
    {
        run = block
    }
}
@available(iOS 6.0, *)
public struct AFSCollectionDataSourceItemConfiguration<DataSource: AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDataSourceItemConfiguration<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDataSourceItemConfiguration<DataSource>)
    {
        run = block
    }
}
@available(iOS 6.0, *)
public struct AFSCollectionDataSourceSupplementary<DataSource: AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDataSourceSupplementary<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDataSourceSupplementary<DataSource>)
    {
        run = block
    }
}
@available(iOS 9.0, *)
public struct AFSCollectionDataSourceCanMove<DataSource: AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDataSourceCanMove<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDataSourceCanMove<DataSource>)
    {
        run = block
    }
}
@available(iOS 9.0, *)
public struct AFSCollectionDataSourceMoveRow<DataSource: AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDataSourceMoveRow<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDataSourceMoveRow<DataSource>)
    {
        run = block
    }
}
@available(iOS 6.0, *)
public struct AFSCollectionDataSourceSectionIndexTitles<DataSource: AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDataSourceSectionIndexTitles<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDataSourceSectionIndexTitles<DataSource>)
    {
        run = block
    }
}
@available(iOS 6.0, *)
public struct AFSCollectionDataSourceSectionForSectionIndexTitle<DataSource: AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDataSourceSectionForSectionIndexTitle<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDataSourceSectionForSectionIndexTitle<DataSource>)
    {
        run = block
    }
}

// Struct --- DataSourcePrefetching
// =====================================================================================================================
@available(iOS 10.0, *)
public struct AFSCollectionDataSourcePrefetch<DataSource: AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDataSourcePrefetch<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDataSourcePrefetch<DataSource>)
    {
        run = block
    }
}

// Struct --- Delegate
// =====================================================================================================================
@available(iOS 6.0, *)
public struct AFSCollectionDelegateItemShouldHighlight<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateItemShouldHighlight<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateItemShouldHighlight<DataSource>)
    {
        run = block
    }
}
@available(iOS 6.0, *)
public struct AFSCollectionDelegateItemHighlightAction<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateItemHighlightAction<DataSource>

    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateItemHighlightAction<DataSource>)
    {
        run = block
    }
}
@available(iOS 6.0, *)
public struct AFSCollectionDelegateItemShouldSelection<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateItemShouldSelection<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateItemShouldSelection<DataSource>)
    {
        run = block
    }
}
@available(iOS 6.0, *)
public struct AFSCollectionDelegateItemSelectAction<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateItemSelectAction<DataSource>

    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateItemSelectAction<DataSource>)
    {
        run = block
    }
}
@available(iOS 8.0, *)
public struct AFSCollectionDelegateWillDisplayItem<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateWillDisplayItem<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateWillDisplayItem<DataSource>)
    {
        run = block
    }
}
@available(iOS 8.0, *)
public struct AFSCollectionDelegateWillDisplaySupplementary<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateWillDisplaySupplementary<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateWillDisplaySupplementary<DataSource>)
    {
        run = block
    }
}
@available(iOS 6.0, *)
public struct AFSCollectionDelegateDidEndDisplayItem<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateDidEndDisplayItem<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateDidEndDisplayItem<DataSource>)
    {
        run = block
    }
}
@available(iOS 6.0, *)
public struct AFSCollectionDelegateDidEndDisplaySupplementary<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateDidEndDisplaySupplementary<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateDidEndDisplaySupplementary<DataSource>)
    {
        run = block
    }
}
@available(iOS 6.0, *)
public struct AFSCollectionDelegateShouldShowMenu<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateShouldShowMenu<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateShouldShowMenu<DataSource>)
    {
        run = block
    }
}
@available(iOS 6.0, *)
public struct AFSCollectionDelegateCanSelectorActionForRow<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateCanSelectorActionForRow<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateCanSelectorActionForRow<DataSource>)
    {
        run = block
    }
}
@available(iOS 6.0, *)
public struct AFSCollectionDelegateSelectorActionForRow<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateSelectorActionForRow<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self, handler block: @escaping AFSCollectionHandlersDelegateSelectorActionForRow<DataSource>)
    {
        run = block
    }
}
@available(iOS 7.0, *)
public struct AFSCollectionDelegateTransitionLayoutFromTo<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateTransitionLayoutFromTo<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateTransitionLayoutFromTo<DataSource>)
    {
        run = block
    }
}
@available(iOS 9.0, *)
public struct AFSCollectionDelegateCanFocusRowAtIndexPath<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateCanFocusRowAtIndexPath<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateCanFocusRowAtIndexPath<DataSource>)
    {
        run = block
    }
}
@available(iOS 9.0, *)
public struct AFSCollectionDelegateShouldUpdateFocusInContext<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateShouldUpdateFocusInContext<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateShouldUpdateFocusInContext<DataSource>)
    {
        run = block
    }
}
@available(iOS 9.0, *)
public struct AFSCollectionDelegateDidUpdateFocusInContext<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateDidUpdateFocusInContext<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateDidUpdateFocusInContext<DataSource>)
    {
        run = block
    }
}
@available(iOS 9.0, *)
public struct AFSCollectionDelegateIndexPathForPreferredView<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateIndexPathForPreferredView<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateIndexPathForPreferredView<DataSource>)
    {
        run = block
    }
}

@available(iOS 9.0, *)
public struct AFSCollectionDelegateRowFromSourceToDestination<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateRowFromSourceToDestination<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateRowFromSourceToDestination<DataSource>)
    {
        run = block
    }
}

@available(iOS 9.0, *)
public struct AFSCollectionDelegateTargetContentOffset<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateTargetContentOffset<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateTargetContentOffset<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSCollectionDelegateShouldSpringLoad<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDelegateShouldSpringLoad<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDelegateShouldSpringLoad<DataSource>)
    {
        run = block
    }
}

// Struct --- DragDelegate
// =====================================================================================================================
@available(iOS 11.0, *)
public struct AFSCollectionDragDelegateBeginningSessionAt<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDragDelegateBeginningSessionAt<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDragDelegateBeginningSessionAt<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSCollectionDragDelegateAddingToSessionAtPoint<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDragDelegateAddingToSessionAtPoint<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDragDelegateAddingToSessionAtPoint<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSCollectionDragDelegateDragPreviewParameters<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDragDelegateDragPreviewParameters<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDragDelegateDragPreviewParameters<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSCollectionDragDelegateDragSessionVoidBlock<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDragDelegateDragSessionVoidBlock<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDragDelegateDragSessionVoidBlock<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSCollectionDragDelegateDragSessionBoolBlock<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDragDelegateDragSessionBoolBlock<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDragDelegateDragSessionBoolBlock<DataSource>)
    {
        run = block
    }
}

// Struct --- DropDelegate
// =====================================================================================================================
@available(iOS 11.0, *)
public struct AFSCollectionDropDelegatePerformDropCoordinator<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDropDelegatePerformDropCoordinator<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDropDelegatePerformDropCoordinator<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSCollectionDropDelegateDropSessionBoolBlock<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDropDelegateDropSessionBoolBlock<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDropDelegateDropSessionBoolBlock<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSCollectionDropDelegateDropSessionVoidBlock<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDropDelegateDropSessionVoidBlock<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDropDelegateDropSessionVoidBlock<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSCollectionDropDelegateDidUpdateWithDestination<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDropDelegateDidUpdateWithDestination<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDropDelegateDidUpdateWithDestination<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSCollectionDropDelegateDropPreviewParameters<DataSource:AFSMetadataDataSource>
{
    public let run : AFSCollectionHandlersDropDelegateDropPreviewParameters<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSCollectionHandlersDropDelegateDropPreviewParameters<DataSource>)
    {
        run = block
    }
}
