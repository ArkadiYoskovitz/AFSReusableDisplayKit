//
//  AFSReusableIdentifier.swift
//  AFSReusableDisplay
//
//  Created by Arkadi Yoskovitz on 1/17/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

public struct AFSReusableIdentifier<DataSource:AFSMetadataDataSource>
{
    let run : (AFSReusableDisplayKit.ReusableElementTypes,DataSource) -> String
    
    public init(modelType: DataSource.Section.Type = DataSource.Section.self,
                _ handler: @escaping (AFSReusableDisplayKit.ReusableElementTypes,DataSource) -> String)
    {
        run = handler
    }
}
