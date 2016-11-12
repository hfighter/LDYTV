//
//  HomePageViewController.swift
//  Ldytv
//
//  Created by Boxfish on 16/11/12.
//  Copyright © 2016年 honghui. All rights reserved.
//

import UIKit

class HomePageViewController: RGPageViewController,RGPageViewControllerDataSource,RGPageViewControllerDelegate {
    
    var titles : [String] = ["推荐","游戏","娱乐", "趣玩"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.delegate = self
        self.datasource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return titles.count
    }
    
    func tabViewForPageAtIndex(_ pageViewController: RGPageViewController, index: Int) -> UIView {
        let label : UILabel = UILabel()
        let title : String = titles[index]
        label.text = title
        label.sizeToFit()
        return label
    }
    
    func viewControllerForPageAtIndex(_ pageViewController: RGPageViewController, index: Int) -> UIViewController? {
//        let viewController : UIViewController = UIStoryboard(name: "Recomend", bundle: nil
//        ).instantiateViewController(withIdentifier: <#T##String#>);
    }
}
