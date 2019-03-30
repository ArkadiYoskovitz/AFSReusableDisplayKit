//
//  AFSTableElementsConfigurator.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/15/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

public final class AFSTableElementsConfigurator : AFSReusableElementsConfigurator
{
    // MARK: - Initialization
    public init()
    {
        super.init(displayType: .table)
    }
    
    // MARK: - Apply Registrations
    public func registerElements(to tableView: UITableView)
    {
        
        elementsRegistrations.forEach {
            
            switch ($0.elementType,$0.method) {
            case (.cell         ,.nib  (let nibObject)): tableView.register(nibObject, forCellReuseIdentifier: $0.identifier)
            case (.cell         ,.class(let cellClass)): tableView.register(cellClass, forCellReuseIdentifier: $0.identifier)
            case (.supplementary,.nib  (let nibObject)): tableView.register(nibObject, forHeaderFooterViewReuseIdentifier: $0.identifier)
            case (.supplementary,.class(let cellClass)): tableView.register(cellClass, forHeaderFooterViewReuseIdentifier: $0.identifier)
            default: break
            }
        }
    }
}
