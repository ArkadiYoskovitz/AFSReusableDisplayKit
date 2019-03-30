//
//  ViewController.swift
//  AFSReusableDisplayKit
//
//  Created by ArkadiGiniApps on 03/30/2019.
//  Copyright (c) 2019 ArkadiGiniApps. All rights reserved.
//
import UIKit
import AFSReusableDisplayKit
///
///
///
typealias    SectionTypealias = SectionClass<TestHeader,TestItem,TestFooter>
typealias DataSourceTypealias = DataSourceClass<SectionTypealias>
///
///
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tableController : AFSTableController<DataSourceTypealias>!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var collectionController : AFSCollectionController<DataSourceTypealias>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        // URLProtocol
        
        let   dataController = DataSourceClass<SectionTypealias>()
        let  controller1 = ControllerFactory.generateTabeController(for: dataController)
        self.tableController = controller1
        tableController.connect(to: tableView)
        
        let  controller2 = ControllerFactory.generateCollectionController(for: dataController)
        controller2.delegateProxy = self
        self.collectionController = controller2
        collectionController.connect(to: collectionView)
    }
}
extension ViewController : UICollectionViewDelegateFlowLayout {
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: CGFloat(50.0), height: CGFloat(50.0))
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return CGFloat(10.0)
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return CGFloat(10.0)
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        return CGSize(width: collectionView.bounds.width, height: CGFloat(50.0))
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize
    {
        return CGSize(width: CGFloat(50.0), height: CGFloat(50.0))
    }
}
