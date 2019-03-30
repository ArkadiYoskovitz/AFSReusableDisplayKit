//
//  AFSCollectionLogicHandlersExtensions.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/19/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//
import UIKit
///
///
///
extension AFSCollectionDataSourceSectionsCount
{
    public static var `default` : AFSCollectionDataSourceSectionsCount<DataSource>
    {
        return AFSCollectionDataSourceSectionsCount<DataSource>.init { (controller,collectionView) -> Int in
            controller.dataController.numberOfSections()
        }
    }
}
///
///
///
extension AFSCollectionDataSourceItemCountInSection
{
    public static var `default` : AFSCollectionDataSourceItemCountInSection<DataSource>
    {
        return AFSCollectionDataSourceItemCountInSection<DataSource>.init { (controller, collectionView, section) -> Int in
            controller.dataController.numberOfItems(inSection: section)
        }
    }
}
///
///
///
extension AFSCollectionDataSourceItemConfiguration
{
    public static var `default` : AFSCollectionDataSourceItemConfiguration<DataSource>
    {
        return AFSCollectionDataSourceItemConfiguration<DataSource>.init { (controller, collectionView, indexPath) -> UICollectionViewCell in

            let reusable   = AFSReusableDisplayKit.ReusableElementTypes.collectionCell(indexPath)
            let identifier = controller.identifierLogic.run(reusable,controller.dataController)
            let item       = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
            
            guard let configurator = controller.configurator?[.cell,reusable,identifier] , let model = controller.dataController.item(at: indexPath) else {
                fatalError("Unsupported cell type & model combination")
            }
            configurator.configureHandler(reusable,item,model)
            return item
        }
    }
}
///
///
///
extension AFSCollectionDataSourceSupplementary
{
    public static var `default` : AFSCollectionDataSourceSupplementary<DataSource>
    {
        return AFSCollectionDataSourceSupplementary<DataSource>.init { (controller, collectionView, kind, indexPath) -> UICollectionReusableView in
            
            let reusable   = AFSReusableDisplayKit.ReusableElementTypes.collectionSupplementary(kind,indexPath.section)
            let identifier = controller.identifierLogic.run(reusable,controller.dataController)
            let supplementary = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath)
            
            guard let configurator = controller.configurator?[.supplementary,reusable,identifier] , let model = controller.dataController.item(at: indexPath) else {
                fatalError("Unsupported cell type & model combination")
            }
            configurator.configureHandler(reusable,supplementary,model)
            return supplementary
        }
    }
}
