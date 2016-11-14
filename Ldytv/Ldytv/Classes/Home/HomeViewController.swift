//
//  HomeViewController.swift
//  Ldytv
//
//  Created by honghui on 16/10/31.
//  Copyright © 2016年 honghui. All rights reserved.
//

import UIKit

enum LinePosition {
    case LinePosTop
    case LinePosBottom
    case LinePosLeft
    case LinePosRight
}

class HomeViewController: RGPageViewController {

    let titles : [String] = ["推荐","游戏","娱乐", "趣玩"]
    let viewControllersIdentifiers : [String] = ["RecomendViewController", "GamesViewController", "EntertainmentViewController", "FunsViewController"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.hightlightTitleColor = UIColor.orange
        self.normalTitleColor = UIColor.black
        self.delegate = self;
        self.datasource = self;
        self.animatingToTab = true
        addLine(onView: self.tabbar, atPosition: .LinePosTop)
        setNavigationBar()
//        launchScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
// MARK: - Override
    override var tabbarStyle: RGTabbarStyle {
        get {
            return .solid
        }
    }
    
    override var tabIndicatorColor: UIColor {
        get {
            return UIColor.orange
        }
    }
    
    override var tabStyle: RGTabStyle {
        get {
            return .inactiveFaded
        }
    }
}

// MARK: - 设置导航栏
extension HomeViewController {
    fileprivate func setNavigationBar() {
        setLeftNavigationBar()
        setRightNavigationBar()
    }
    
    fileprivate func setLeftNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "logo")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(leftButtonClick))
    }
    
    fileprivate func setRightNavigationBar() {
        let size: CGSize = CGSize(width: 40, height: 40)
        let historyItem: UIBarButtonItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "image_my_history_click", size: size, target: self, action: #selector(historyItemClick))
        let searchItem: UIBarButtonItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_click", size: size, target: self, action: #selector(searchItemClick))
        let qrcodeItem: UIBarButtonItem = UIBarButtonItem(imageName: "image_scan", highImageName: "image_scan_click", size: size, target: self, action: #selector(qrCodeItemClick))
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
    
    @objc fileprivate func leftButtonClick() {
        print("leftButtonClick")
    }
    
    @objc fileprivate func historyItemClick() {
        print("historyItemClick")
    }
    
    @objc fileprivate func searchItemClick() {
        print("searchItemClick")
    }
    
    @objc fileprivate func qrCodeItemClick() {
        print("qrCodeItemClick")
    }
}

// MARK: - 启动动画--test
extension HomeViewController {
    fileprivate func launchScreen() {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 50, y: 100), size: CGSize(width: 40, height: 40)))
        view.backgroundColor = UIColor.red
        UIApplication.shared.keyWindow?.addSubview(view)
        UIView.animate(withDuration: 0.3, delay: 1, options: .curveEaseInOut, animations: {
            view.center = CGPoint(x: 150, y: 200)
        }) { (Bool) in
            view.removeFromSuperview()
        }
    }
}


// MARK: - 首页分页

extension HomeViewController: RGPageViewControllerDelegate, RGPageViewControllerDataSource {
    
    func numberOfPagesForViewController(_ pageViewController: RGPageViewController) -> Int {
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
        let identifer = viewControllersIdentifiers[index]
        let viewController : UIViewController = UIStoryboard(name: identifer, bundle: nil
            ).instantiateViewController(withIdentifier: identifer);
        return viewController
    }
    
    func heightForTabAtIndex(_ index: Int) -> CGFloat {
         return 44
    }
    
    func widthForTabAtIndex(_ index: Int) -> CGFloat {
        let divided = (titles.count == 0) ? 1 : titles.count
        return UIScreen.main.bounds.width/CGFloat(divided)
    }
    
    func willChangePageToIndex(_ index: Int, fromIndex from: Int) {
        
    }
    
    func didChangePageToIndex(_ index: Int) {
        
    }
    
    func addLine(onView view: UIView, atPosition position: LinePosition)->Void {
        let lineView: UIView
        var x : CGFloat = 0.0
        var y : CGFloat = 0.0
        var width : CGFloat = view.bounds.width
        var height : CGFloat = 0.5
        switch (position) {
        case .LinePosTop : break
            
        case .LinePosBottom:
            y = view.bounds.height-CGFloat(0.5)
            break
        case .LinePosLeft:
            width = 0.5
            height = view.bounds.height
            break
        case .LinePosRight:
            x = view.bounds.width-0.5
            width = 0.5
            height = view.bounds.height
        }
        lineView = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        lineView.backgroundColor = UIColor.lightGray;
        view.addSubview(lineView)
    }
}
