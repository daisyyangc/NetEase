//
//  AppDelegate.swift
//  Floral
//
//  Created by ALin on 16/4/25.
//  Copyright © 2016年 ALin. All rights reserved.


//  github : https://github.com/SunLiner/Floral
//  blog : http://www.jianshu.com/p/2893be49c50e


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // 方便测试: 每次登录的时候, 都把登录状态设置false
//        LoginHelper.sharedInstance.setLoginStatus(false)
        
        // 设置全局的UINavigationBar属性
        let bar = UINavigationBar.appearance()
        bar.tintColor = UIColor.blackColor()
        bar.titleTextAttributes = [NSFontAttributeName : UIFont.systemFontOfSize(15), NSForegroundColorAttributeName : UIColor.blackColor()]
        
        // 设置window
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // 根据版本号, 判断显示哪个控制器
//        if toNewFeature() {
//            window?.rootViewController = NewFeatureViewController()
//        }else{
//            window?.rootViewController = MainViewController()
//        }
         //TODO测试广告加载页面
          window?.rootViewController = LoadViewController()
        
     
        
        window?.makeKeyAndVisible()
        
        
        
        return true
    }
    
  
// 首先要明确一点: swift里面是没有宏定义的概念
// 自定义内容输入格式: 文件名[行号]函数名: 输入内容
// 需要在info.plist的other swift flag的Debug中添加DEBUG
func ALinLog<T>(message: T, fileName: String = #file, lineNum: Int = #line, funcName: String = #function)
{
    #if DEBUG
        print("\((fileName as NSString).lastPathComponent)[\(lineNum)] \(funcName): \(message)")
    #endif
}

}
