//
//  AFSReusableElementsController.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/19/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit
///
///
///
public class AFSReusableElementsController<DataSource> : AFSController
    where DataSource : AFSMetadataDataSource
{
    // MARK: - Typealias
    // MARK: - Enum Types
    // MARK: - Struct Types
    
    // MARK: - Stored Properties
    public internal(set) var identifierLogic  : AFSReusableIdentifier<DataSource>
    public internal(set) var baseConfigurator : AFSReusableElementsConfiguratorProtocol!
    public internal(set) var dataController   : DataSource!
    
    // MARK: - Subscript
    
    // MARK: - Initialization
    public init(identifierLogic : AFSReusableIdentifier<DataSource>) {
        self.identifierLogic = identifierLogic
        super.init()
    }
    
    // MARK: - Object life cycle
    deinit {
        print("\(type(of: self)) was deallocated successfuly")
    }
}
