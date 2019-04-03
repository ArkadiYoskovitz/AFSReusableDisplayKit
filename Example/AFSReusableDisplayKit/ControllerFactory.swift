//
//  ControllerFactory.swift
//  AFSReusableDisplayKit_Example
//
//  Created by Arkadi Yoskovitz on 3/28/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//
import UIKit
import AFSReusableDisplayKit
///
///
///
class ControllerFactory {
    
    static func generateCollectionController(for dataController: DataSourceTypealias) -> AFSCollectionController<DataSourceTypealias>
    {
        let identifier = AFSReusableIdentifier<DataSourceTypealias>.init { (type,dataController) -> String in
            
            switch type {
            case .collectionSupplementary:
                return "2"
            default: return "1"
            }
        }
        
        let builder = AFSCollectionControllerBuilder<DataSourceTypealias>.init()
        builder.setReusableIdentifier(identifier)
        builder.setDataController(dataController)
        builder.setBehavior([
            .dataSourceBasic,
            .dataSourceExtra,
            .dataSourcePrefetching,
            .delegate,
            .delegateDragDelegate,
            .delegateDropDelegate])
        
        builder.setDataSourceNumberOfSections     (handler: AFSCollectionDataSourceSectionsCount     <DataSourceTypealias>.default.run)
        builder.setDataSourceNumberOfRowsInSection(handler: AFSCollectionDataSourceItemCountInSection<DataSourceTypealias>.default.run)
        
        builder.registerCell(via: .class(UICollectionViewCell.self), withReuse: "1", displayElement: UICollectionViewCell.self, displayModel: TestItem.self) { (reusableType,cell,model) in
            
            guard case let .collectionCell(indexPath) = reusableType else { return }
            cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .blue
        }
        
        builder.registerSupplementary(displayElementKind: UICollectionView.elementKindSectionHeader, via: .class(AAAAReusableView.self), withReuse: "2", displayElement: AAAAReusableView.self, displayModel: TestItem.self) { (reusableType,cell,model) in
            
            guard case let .collectionSupplementary(str,section) = reusableType else { return }
            cell.backgroundColor = section % 2 == 0 ? .red : .orange
            print("Header at: \(section); Kind:\(str)")
        }
        builder.registerSupplementary(displayElementKind: UICollectionView.elementKindSectionFooter, via: .class(AAAAReusableView.self), withReuse: "2", displayElement: AAAAReusableView.self, displayModel: TestItem.self) { (reusableType,cell,model) in
            
            guard case let .collectionSupplementary(str,section) = reusableType else { return }
            cell.backgroundColor = section % 2 == 0 ? .red : .orange
            print("Footer at: \(section); Kind:\(str)")
        }
        guard let controller = builder.build() else {
            fatalError("Unable to generate tableController")
        }
        return controller
    }
    
    static func generateTabeController      (for dataController: DataSourceTypealias) -> AFSTableController<DataSourceTypealias>
    {
        
        let identifier = AFSReusableIdentifier<DataSourceTypealias>.init { (type,dataController) -> String in return "1" }
        
        let builder = AFSTableControllerBuilder<DataSourceTypealias>.init()
        builder.setReusableIdentifier(identifier)
        builder.setDataController(dataController)
        builder.setBehavior([
            .dataSourceBasic,
            .dataSourceSectionHeader,
            //            .dataSourceSectionFooter,
            //            .dataSourceSectionIndex,
            //            .dataSourceEditItem,
            //            .dataSourceMoveItem,
            //            .dataSourcePrefetching,
            //            .delegateWillDisplay,
            //            .delegateDidEndDisplaying,
            //            .delegateHeight,
            //            .delegateEstimatedHeight,
            //            .delegateViewForHeader,
            //            .delegateViewForFooter,
            //            .delegateAccessoryButton,
            //            .delegateHighlight,
            .delegateSelect,
            //            .delegateDeselect,
            //            .delegateEditing,
            //            .delegateEditActions,
            //            .delegateSwipeActions,
            //            .delegateEditingState,
            //            .delegateIndentation,
            //            .delegateMenu,
            //            .delegateFocus,
            //            .delegateSpringLoad,
            //            .delegateDragDelegate,
            //            .delegateDropDelegate
            ])
        
        builder.setDelegateDidScroll { (scrollController, scrollView) in
            print("\(#function), contentSize: \(scrollView.contentSize), contentOffset: \(scrollView.contentOffset)")
        }
        
        builder.setDataSourceNumberOfSections     (handler: AFSTableDataSourceSectionsCount    <DataSourceTypealias>.default.run)
        builder.setDataSourceNumberOfRowsInSection(handler: AFSTableDataSourceRowCountInSection<DataSourceTypealias>.default.run)
        
        builder.setDataSourceTitleForHeaderInSection { (tableController,tableView,section) -> String? in
            "Section: \(section)"
        }
        
        builder.setDelegateWillSelectRowAtIndexPath { (tableController,tableView, indexPath) -> IndexPath? in
            indexPath
        }
        builder.setDelegateDidSelectRowAtIndexPath { (tableController,tableView, indexPath) in
            print("did select item at section: \(indexPath.section), item: \(indexPath.item)")
        }
        builder.setDelegateWillDisplayCellForRowAtIndexPath { (tableController,tableView, cell, indexPath) in
            // cell.textLabel?.backgroundColor = UIColor.white
            // cell.textLabel?.isOpaque = false
            cell.textLabel?.backgroundColor = cell.backgroundColor
        }
        builder.registerCell(via: .class(UITableViewCell.self), withReuse: "1", displayElement: UITableViewCell.self, displayModel: TestItem.self) { (reusableType,cell,model) in
            
            guard case let .tableCell(indexPath) = reusableType else { return }
            cell.textLabel?.text = "Text at section: \(indexPath.section), item: \(indexPath.item)"
        }
        
        builder.registerHeader(via: .class(UITableViewHeaderFooterView.self), withReuse: "1", displayElement: UITableViewHeaderFooterView.self, displayModel: TestItem.self) { (reusableType,cell,model) in
            
            guard case let .tableHeader(section) = reusableType else { return }
            cell.backgroundColor = UIColor.red
            print("\(#function) at: \(section)")
        }
        
        builder.registerFooter(via: .class(UITableViewHeaderFooterView.self), withReuse: "1", displayElement: UITableViewHeaderFooterView.self, displayModel: TestItem.self) { (reusableType,cell,model) in
            
            guard case let .tableFooter(section) = reusableType else { return }
            cell.backgroundColor = UIColor.red
            print("\(#function) at: \(section)")
        }
        
        guard let tableController = builder.build() else {
            fatalError("Unable to generate tableController")
        }
        return tableController
    }
}
