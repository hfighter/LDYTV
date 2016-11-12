//
//  MainTabBarController.swift
//  Ldytv
//
//  Created by honghui on 16/10/31.
//  Copyright © 2016年 honghui. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addControllers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: - 添加tab子控制器
extension MainTabBarController {
    
    fileprivate func addControllers() {
        addControllerByStoryBoardName("Home")
        addControllerByStoryBoardName("Live")
        addControllerByStoryBoardName("Follow")
        addControllerByStoryBoardName("Profile")
    }
    
    fileprivate func addControllerByStoryBoardName(_ storyboardName: String) {
        let instantiateViewControllerName: String = storyboardName + "NavViewController"
        let viewController = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: instantiateViewControllerName)
        addChildViewController(viewController)
    }
}


