//
//  FLTabBarController.swift
//  FLNews
//
//  Created by 凤梨 on 2019/4/10.
//  Copyright © 2019年 2dfire. All rights reserved.
//

import UIKit
import SwiftTheme

class FLMyTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = UITabBar.appearance()
        tabbar.theme_tintColor = "colors.tabbarTintColor"
        tabbar.theme_barTintColor = "colors.cellBackgroundColor"
        addChildViewControllers()
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDayOrNightButtonClicked), name: Notification.Name(rawValue: "dayOrNightButtonClicked"), object: nil)
    }
    
    @objc func receiveDayOrNightButtonClicked(notification:Notification) {
        let selected = notification.object as! Bool
        if selected { // 设置为夜间
            for childController in childViewControllers {
                switch childController.title! {
                case "首页":
                    setNightChildController(controller: childController, imageName: "home")
                case "西瓜视频":
                    setNightChildController(controller: childController, imageName: "video")
                case "小视频":
                    setNightChildController(controller: childController, imageName: "huoshan")
                case "微头条":
                    setNightChildController(controller: childController, imageName: "weitoutiao")
                case "":
                    setNightChildController(controller: childController, imageName: "redpackage")
                default:
                    break
                }
            }
        } else { // 设置为日间
            for childController in childViewControllers {
                switch childController.title! {
                case "首页":
                    setDayChildController(controller: childController, imageName: "home")
                case "西瓜视频":
                    setDayChildController(controller: childController, imageName: "video")
                case "小视频":
                    setDayChildController(controller: childController, imageName: "huoshan")
                case "微头条":
                    setDayChildController(controller: childController, imageName: "weitoutiao")
                case "":
                    setDayChildController(controller: childController, imageName: "redpackage")
                default:
                    break
                }
            }
        }
    }
    
    func addChildViewControllers() {
        setChildViewController(FLHomeViewController(), title: "首页", imageName: "home")
        setChildViewController(FLVideoViewController(), title: "西瓜视频", imageName: "video")
        setChildViewController(FLRedPackageViewController2(), title: "", imageName: "redpackage")
        setChildViewController(FLWeitoutiaoViewController(), title: "微头条", imageName: "weitoutiao")
        setChildViewController(FLHuoshanViewController(), title: "小视频", imageName: "huoshan")
    }
    
    private func setNightChildController(controller: UIViewController, imageName:String)  {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_night_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_night_32x32_")
    }
    /// 设置日间控制器
    private func setDayChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_32x32_")
    }
    
    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        // 设置 tabbar 文字和图片
        if UserDefaults.standard.bool(forKey: isNight) {
            setNightChildController(controller: childController, imageName: imageName)
        } else {
            setDayChildController(controller: childController, imageName: imageName)
        }
        childController.title = title
        // 添加导航控制器为 TabBarController 的子控制器
    addChildViewController(FLMyNavigationController(rootViewController: childController))
    }
    
}
