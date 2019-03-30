//
//  AFSReusableElementsControllerBuilderProtocol.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/20/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//
import UIKit
///
///
///
public protocol AFSReusableElementsControllerBuilderProtocol {
    
    func   registerElement<Element,ViewModel>(of type: AFSReusableDisplayKit.ReusableElementTypes,
                                              elementKind kind: AFSReusableDisplayKit.ReusableElementKinds,
                                              displayElementKind displayKind: String,
                                              via registrationMethod: AFSReusableDisplayKit.RegistrationMethod,
                                              withReuse identifier: String,
                                              displayElement: Element.Type,
                                              displayModel: ViewModel.Type,
                                              displayConfiguration handler: @escaping ElementConfiguration<Element,ViewModel>)
    
    func unregisterElement(of type: AFSReusableDisplayKit.ReusableElementTypes,
                           elementKind kind: AFSReusableDisplayKit.ReusableElementKinds,
                           displayElementKind displayKind: String,
                           via registrationMethod: AFSReusableDisplayKit.RegistrationMethod,
                           withReuse identifier: String)
    
    func clearRegisteration()
}
