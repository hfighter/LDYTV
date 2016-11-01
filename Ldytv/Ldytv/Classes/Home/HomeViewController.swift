//
//  HomeViewController.swift
//  Ldytv
//
//  Created by honghui on 16/10/31.
//  Copyright © 2016年 honghui. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setNavigationBar()
//        launchScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - 设置导航栏
extension HomeViewController {
    fileprivate func setNavigationBar() {
        setLeftNavigationBar()
        setRightNavigationBar()
    }
    
    private func setLeftNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "logo")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(leftButtonClick))
    }
    
    private func setRightNavigationBar() {
        let size: CGSize = CGSize(width: 40, height: 40)
        let historyItem: UIBarButtonItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "image_my_history_click", size: size, target: self, action: #selector(historyItemClick))
        let searchItem: UIBarButtonItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_click", size: size, target: self, action: #selector(searchItemClick))
        let qrcodeItem: UIBarButtonItem = UIBarButtonItem(imageName: "image_scan", highImageName: "image_scan_click", size: size, target: self, action: #selector(qrCodeItemClick))
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
    
    @objc private func leftButtonClick() {
        print("leftButtonClick")
    }
    
    @objc private func historyItemClick() {
        print("historyItemClick")
    }
    
    @objc private func searchItemClick() {
        print("searchItemClick")
    }
    
    @objc private func qrCodeItemClick() {
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
