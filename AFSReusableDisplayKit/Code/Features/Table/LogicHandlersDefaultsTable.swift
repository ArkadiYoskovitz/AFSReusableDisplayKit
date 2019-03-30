//
//  AFSTableLogicHandlersExtensions.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/18/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//
import UIKit
///
///
///
extension AFSTableDataSourceSectionsCount
{
    public static var `default` : AFSTableDataSourceSectionsCount<DataSource> {
        
        return AFSTableDataSourceSectionsCount<DataSource>.init { (controller,tableView) -> Int in
            controller.dataController.numberOfSections()
        }
    }
}
///
///
///
extension AFSTableDataSourceRowCountInSection
{
    public static var `default` : AFSTableDataSourceRowCountInSection<DataSource> {
        
        return AFSTableDataSourceRowCountInSection<DataSource>.init { (controller, tableView, section) -> Int in
            controller.dataController.numberOfItems(inSection: section)
        }
    }
}
///
///
///
extension AFSTableDataSourceCellConfiguration
{
    public static var `default` : AFSTableDataSourceCellConfiguration<DataSource> {
        
        return AFSTableDataSourceCellConfiguration<DataSource>.init { (controller, tableView, indexPath) -> UITableViewCell in
            
            let reusable   = AFSReusableDisplayKit.ReusableElementTypes.tableCell(indexPath)
            let identifier = controller.identifierLogic.run(reusable,controller.dataController)
            let cell       = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
            
            guard let configurator = controller.configurator?[.cell,reusable,identifier] , let model = controller.dataController.item(at: indexPath) else {
                fatalError("Unsupported cell type & model combination")
            }
            configurator.configureHandler(reusable,cell,model)
            return cell
        }
    }
}
///
///
///
extension AFSTableDelegateSectionView
{
    public static var `defaultHeader` : AFSTableDelegateSectionView<DataSource> {
        
        return AFSTableDelegateSectionView<DataSource>.init { (controller,tableView, section) -> UIView? in
            
            let reusable   = AFSReusableDisplayKit.ReusableElementTypes.tableHeader(section)
            let identifier = controller.identifierLogic.run(reusable,controller.dataController)
            
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier) else {
                fatalError("Unsupported HeaderFooterView type for reuse identifier")
            }
            
            guard let configurator = controller.configurator?[.supplementary,reusable,identifier] , let model = controller.dataController.headerMetadata(inSection: section) else {
                fatalError("Unsupported cell type & model combination")
            }
            configurator.configureHandler(reusable,header,model)
            return header
        }
    }
    public static var `defaultFooter` : AFSTableDelegateSectionView<DataSource> {
        
        return AFSTableDelegateSectionView<DataSource>.init { (controller,tableView, section) -> UIView? in
            
            let reusable   = AFSReusableDisplayKit.ReusableElementTypes.tableFooter(section)
            let identifier = controller.identifierLogic.run(reusable,controller.dataController)
            
            guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier) else {
                fatalError("Unsupported HeaderFooterView type for reuse identifier")
            }
            
            guard let configurator = controller.configurator?[.supplementary,reusable,identifier] , let model = controller.dataController.headerMetadata(inSection: section) else {
                fatalError("Unsupported cell type & model combination")
            }
            configurator.configureHandler(reusable,footer,model)
            return footer
        }
    }
}
