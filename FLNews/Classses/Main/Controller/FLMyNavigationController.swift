//
//  FLMyNavigationController.swift
//  FLNews
//
//  Created by 凤梨 on 2019/4/10.
//  Copyright © 2019年 2dfire. All rights reserved.
//

import UIKit
import SwiftTheme

class FLMyNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBar = UINavigationBar.appearance()
        navigationBar.theme_tintColor = "colors.black"
        navigationBar.setBackgroundImage(UIImage(named: "navigation_background" + (UserDefaults.standard.bool(forKey: isNight) ? "_night" : "")), for: .default)
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDayOrNightButtonClicked), name: Notification.Name(rawValue: "dayOrNightButtonClicked"), object: nil)
    }
    
    @objc func receiveDayOrNightButtonClicked(_ notification:Notification) {
        navigationBar.setBackgroundImage(UIImage(named: "navigation_background" + (notification.object as! Bool ? "_night":"")), for: .default)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "lefterbackicon_titlebar_24x24_"), style: .plain, target: self, action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc func navigationBack() {
        popViewController(animated: true)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
