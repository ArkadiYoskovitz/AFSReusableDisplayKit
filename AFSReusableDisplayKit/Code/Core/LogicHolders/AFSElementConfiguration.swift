//
//  AFSElementConfiguration.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/13/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//
import UIKit
///
///
///
public typealias ElementConfiguration<Element,ViewModel> = (AFSReusableDisplayKit.ReusableElementTypes,Element,ViewModel) -> Void
///
///
///
public struct AFSElementConfiguration
{
    // MARK: - Stored Properties
    public let reuseIdentifier  : String
    public let configureHandler : (AFSReusableDisplayKit.ReusableElementTypes,Any,Any) -> Void
    
    // MARK: - Initialization
    public init<Element,ViewModel>(reuse identifier: String,
                                   displayType: Element.Type,
                                   modelType: ViewModel.Type,
                                   displayConfiguration handler: @escaping ElementConfiguration<Element,ViewModel>)
    {
        self.reuseIdentifier  = identifier
        self.configureHandler = { (reusableType,element,model) in
            guard let element   = element as? Element   else { fatalError("Could not cast Element   to \(Element.self)") }
            guard let viewModel = model   as? ViewModel else { fatalError("Could not cast ViewModel to \(ViewModel.self)") }
            handler(reusableType,element,viewModel)
        }
    }
}
