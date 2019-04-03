//
//  AAAAReusableView.swift
//  AFSReusableDisplayKit_Example
//
//  Created by Arkadi Yoskovitz on 3/28/19.
//  Copyright © 2019 Arkadi Yoskovitz. All rights reserved.
//

import UIKit

class AAAAReusableView : UICollectionReusableView
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes)
    {
        super.apply(layoutAttributes)
    }
    override func prepareForReuse()
    {
        super.prepareForReuse()
    }
}
