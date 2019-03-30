//
//  AFSReusableElementsControllerBuilder.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/17/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit
///
///
///
public class AFSReusableElementsControllerBuilder<DataSource>
    where DataSource : AFSMetadataDataSource
{
    
    // MARK: - typealias    
    // MARK: - Enum Types
    // MARK: - Struct Types
    
    // MARK: - Stored Properties
    public internal(set) var identifierLogic : AFSReusableIdentifier<DataSource>
    public internal(set) var displayType     : AFSReusableDisplayKit.DisplayType
    public internal(set) var dataController  : DataSource!
    public internal(set) var baseConfigurator: AFSReusableElementsConfiguratorProtocol!
    
    // MARK: - Subscript
    
    // MARK: - Initialization
    public init(displayType: AFSReusableDisplayKit.DisplayType) {
        
        self.displayType     = displayType
        self.identifierLogic = AFSReusableIdentifier.default
    }
    
    // MARK: - Object life cycle
    deinit {
        print("\(String(describing: type(of: self))) was deallocated successfuly")
    }
    
    // MARK: - Object setters
    
    ///
    ///
    ///
    @discardableResult public func setReusableIdentifier(_ identifierHandler: AFSReusableIdentifier<DataSource>) -> Self
    {
        self.identifierLogic = identifierHandler
        return self
    }
    
    ///
    ///
    ///
    @discardableResult public func setDataController(_ controller: DataSource) -> Self
    {
        self.dataController  = controller
        return self
    }
}
// MARK: -
extension AFSReusableElementsControllerBuilder : AFSReusableElementsControllerBuilderProtocol { // MARK: AFSReusableElementsControllerBuilderProtocol
    
    // MARK: -
    
    public func   registerElement<Element,ViewModel>(of type: AFSReusableDisplayKit.ReusableElementTypes,
                                                     elementKind kind: AFSReusableDisplayKit.ReusableElementKinds,
                                                     displayElementKind displayKind: String,
                                                     via registrationMethod: AFSReusableDisplayKit.RegistrationMethod,
                                                     withReuse identifier: String,
                                                     displayElement: Element.Type,
                                                     displayModel: ViewModel.Type,
                                                     displayConfiguration handler: @escaping ElementConfiguration<Element,ViewModel>)
    {
        baseConfigurator.registerElement(of: kind, withReuse: identifier, elementKind: displayKind, via: registrationMethod)
        baseConfigurator?[kind,type,identifier] = AFSElementConfiguration(reuse: identifier, displayType: displayElement, modelType: displayModel, displayConfiguration: handler)
    }
    
    public func unregisterElement(of type: AFSReusableDisplayKit.ReusableElementTypes,
                                  elementKind kind: AFSReusableDisplayKit.ReusableElementKinds,
                                  displayElementKind displayKind: String,
                                  via registrationMethod: AFSReusableDisplayKit.RegistrationMethod,
                                  withReuse identifier: String)
    {
        baseConfigurator.unregisterElement(of: kind, withReuse: identifier, elementKind: displayKind, via: registrationMethod)
        baseConfigurator?[kind,type,identifier] = nil
    }
    
    public func clearRegisteration()
    {
        baseConfigurator.clearRegisteration()
    }
}
