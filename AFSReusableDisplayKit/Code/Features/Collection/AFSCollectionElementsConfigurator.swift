//
//  AFSCollectionElementsConfigurator.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/15/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

public final class AFSCollectionElementsConfigurator : AFSReusableElementsConfigurator
{
    // MARK: - Initialization
    public init()
    {
        super.init(displayType: .collection)
    }
    
    // MARK: - Apply Registrations
    public func registerElements(to collectionView: UICollectionView)
    {
        elementsRegistrations.forEach {
            
            switch ($0.elementType,$0.method) {
            case (.cell         ,.nib  (let nibObject)): collectionView.register(nibObject, forCellWithReuseIdentifier: $0.identifier)
            case (.cell         ,.class(let cellClass)): collectionView.register(cellClass, forCellWithReuseIdentifier: $0.identifier)
            case (.supplementary,.nib  (let nibObject)): collectionView.register(nibObject, forSupplementaryViewOfKind: $0.elementKind, withReuseIdentifier: $0.identifier)
            case (.supplementary,.class(let cellClass)): collectionView.register(cellClass, forSupplementaryViewOfKind: $0.elementKind, withReuseIdentifier: $0.identifier)
            default: break
            }
        }
    }
}

