//
//  AFSTableLogicHandlersStructs.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/18/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

/// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Logic holder structs
/// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// MARK: - Struct --- TableDataSource
// =====================================================================================================================
@available(iOS 2.0, *)
public struct AFSTableDataSourceSectionsCount<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDataSourceSectionsCount<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDataSourceSectionsCount<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDataSourceRowCountInSection<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDataSourceRowCountInSection<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDataSourceRowCountInSection<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDataSourceCellConfiguration<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDataSourceCellConfiguration<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDataSourceCellConfiguration<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDataSourceSectionTitle<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDataSourceSectionTitle<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDataSourceSectionTitle<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDataSourceCanEditRow<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDataSourceCanEditRow<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDataSourceCanEditRow<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDataSourceCommitForRow<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDataSourceCommitForRow<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDataSourceCommitForRow<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDataSourceSectionIndexTitles<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDataSourceSectionIndexTitles<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDataSourceSectionIndexTitles<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDataSourceSectionForSectionIndexTitle<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDataSourceSectionForSectionIndexTitle<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDataSourceSectionForSectionIndexTitle<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDataSourceCanMove<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDataSourceCanMove<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDataSourceCanMove<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDataSourceMoveRow<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDataSourceMoveRow<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDataSourceMoveRow<DataSource>)
    {
        run = block
    }
}

// MARK: - Struct --- DataSourcePrefetching
// =====================================================================================================================
@available(iOS 2.0, *)
public struct AFSTableDataSourcePrefetch<DataSource: AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDataSourcePrefetch<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDataSourcePrefetch<DataSource>)
    {
        run = block
    }
}

// MARK: - Struct --- Delegate
// =====================================================================================================================
@available(iOS 2.0, *)
public struct AFSTableDelegateDisplayCell<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateDisplayCell<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateDisplayCell<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDelegateDisplayHeader<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateDisplayHeader<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateDisplayHeader<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDelegateDisplayFooter<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateDisplayFooter<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateDisplayFooter<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDelegateHeightCell<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateHeightCell<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateHeightCell<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDelegateHeightHeader<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateHeightHeader<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateHeightHeader<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDelegateHeightFooter<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateHeightFooter<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateHeightFooter<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDelegateSectionView<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateSectionView<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateSectionView<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDelegateAccessoryTap<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateAccessoryTap<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateAccessoryTap<DataSource>)
    {
        run = block
    }
}
@available(iOS 6.0, *)
public struct AFSTableDelegateCellShouldHighlight<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateCellShouldHighlight<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self, handler
        block: @escaping AFSTableHandlersDelegateCellShouldHighlight<DataSource>)
    {
        run = block
    }
}
@available(iOS 6.0, *)
public struct AFSTableDelegateCellHighlightAction<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateCellHighlightAction<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateCellHighlightAction<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDelegateCellSelection<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateCellSelection<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateCellSelection<DataSource>)
    {
        run = block
    }
}
@available(iOS 3.0, *)
public struct AFSTableDelegateCellSelectAction<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateCellSelectAction<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateCellSelectAction<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDelegateCellEditingStyle<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateCellEditingStyle<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateCellEditingStyle<DataSource>)
    {
        run = block
    }
}
@available(iOS 3.0, *)
public struct AFSTableDelegateCellTitleForDelete<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateCellTitleForDelete<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateCellTitleForDelete<DataSource>)
    {
        run = block
    }
}
@available(iOS 8.0, *)
public struct AFSTableDelegateEditActionsForRow<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateEditActionsForRow<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateEditActionsForRow<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSTableDelegateSwipeActionsConfiguration<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateSwipeActionsConfiguration<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateSwipeActionsConfiguration<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDelegateShouldIndentWhileEditingRow<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateShouldIndentWhileEditingRow<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateShouldIndentWhileEditingRow<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDelegateWillBeginEditingRowAt<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateWillBeginEditingRowAt<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateWillBeginEditingRowAt<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDelegateDidEndEditingRowAt<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateDidEndEditingRowAt<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateDidEndEditingRowAt<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDelegateMoveAction<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateMoveAction<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateMoveAction<DataSource>)
    {
        run = block
    }
}
@available(iOS 2.0, *)
public struct AFSTableDelegateIndentationLevel<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateIndentationLevel<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateIndentationLevel<DataSource>)
    {
        run = block
    }
}
@available(iOS 5.0, *)
public struct AFSTableDelegateShouldShowMenu<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateShouldShowMenu<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateShouldShowMenu<DataSource>)
    {
        run = block
    }
}
@available(iOS 5.0, *)
public struct AFSTableDelegateCanSelectorActionForRow<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateCanSelectorActionForRow<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateCanSelectorActionForRow<DataSource>)
    {
        run = block
    }
}
@available(iOS 5.0, *)
public struct AFSTableDelegateSelectorActionForRow<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateSelectorActionForRow<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateSelectorActionForRow<DataSource>)
    {
        run = block
    }
}
@available(iOS 9.0, *)
public struct AFSTableDelegateCanFocusRowAtIndexPath<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateCanFocusRowAtIndexPath<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateCanFocusRowAtIndexPath<DataSource>)
    {
        run = block
    }
}
@available(iOS 9.0, *)
public struct AFSTableDelegateShouldUpdateFocusInContext<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateShouldUpdateFocusInContext<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateShouldUpdateFocusInContext<DataSource>)
    {
        run = block
    }
}
@available(iOS 9.0, *)
public struct AFSTableDelegateDidUpdateFocusInContext<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateDidUpdateFocusInContext<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateDidUpdateFocusInContext<DataSource>)
    {
        run = block
    }
}
@available(iOS 9.0, *)
public struct AFSTableDelegateIndexPathForPreferredView<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateIndexPathForPreferredView<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateIndexPathForPreferredView<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSTableDelegateShouldSpringLoad<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDelegateShouldSpringLoad<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDelegateShouldSpringLoad<DataSource>)
    {
        run = block
    }
}


// MARK: - Struct --- DragDelegate
// =====================================================================================================================
@available(iOS 11.0, *)
public struct AFSTableDragDelegateBeginningSessionAt<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDragDelegateBeginningSessionAt<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDragDelegateBeginningSessionAt<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSTableDragDelegateAddingToSessionAtPoint<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDragDelegateAddingToSessionAtPoint<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDragDelegateAddingToSessionAtPoint<DataSource>)
    {
        run = block
    }
}

@available(iOS 11.0, *)
public struct AFSTableDragDelegateDragPreviewParameters<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDragDelegateDragPreviewParameters<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDragDelegateDragPreviewParameters<DataSource>)
    {
        run = block
    }
}
@available(iOS 11.0, *)
public struct AFSTableDragDelegateDragSessionVoidBlock<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDragDelegateDragSessionVoidBlock<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self, handler block: @escaping AFSTableHandlersDragDelegateDragSessionVoidBlock<DataSource>)
    {
        run = block
    }
}
@available(iOS 11.0, *)
public struct AFSTableDragDelegateDragSessionBoolBlock<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDragDelegateDragSessionBoolBlock<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDragDelegateDragSessionBoolBlock<DataSource>)
    {
        run = block
    }
}

// MARK: - Struct --- DropDelegate
// =====================================================================================================================
@available(iOS 11.0, *)
public struct AFSTableDropDelegatePerformDropCoordinator<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDropDelegatePerformDropCoordinator<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDropDelegatePerformDropCoordinator<DataSource>)
    {
        run = block
    }
}
@available(iOS 11.0, *)
public struct AFSTableDropDelegateDropSessionBoolBlock<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDropDelegateDropSessionBoolBlock<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDropDelegateDropSessionBoolBlock<DataSource>)
    {
        run = block
    }
}
@available(iOS 11.0, *)
public struct AFSTableDropDelegateDropSessionVoidBlock<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDropDelegateDropSessionVoidBlock<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDropDelegateDropSessionVoidBlock<DataSource>)
    {
        run = block
    }
}
@available(iOS 11.0, *)
public struct AFSTableDropDelegateDidUpdateWithDestination<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDropDelegateDidUpdateWithDestination<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDropDelegateDidUpdateWithDestination<DataSource>)
    {
        run = block
    }
}
@available(iOS 11.0, *)
public struct AFSTableDropDelegateDropPreviewParameters<DataSource:AFSMetadataDataSource>
{
    public let run : AFSTableHandlersDropDelegateDropPreviewParameters<DataSource>
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                handler block: @escaping AFSTableHandlersDropDelegateDropPreviewParameters<DataSource>)
    {
        run = block
    }
}
