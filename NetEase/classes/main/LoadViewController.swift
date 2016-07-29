//
//  LoadViewController_release.swift
//  NetEase
//
//  Created by WhiteDeng on 16/7/21.
//  Copyright © 2016年 pptv. All rights reserved.


import UIKit


class LoadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //广告加载时间Label
    var timerLabel=UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.maxX-20, UIScreen.mainScreen().bounds.minY+20,30, 30))
     
    //加载
    private func setup()
    {
        //加载广告页面
        let adImg=UIImageView(frame: CGRectMake(UIScreen.mainScreen().bounds.origin.x, UIScreen.mainScreen().bounds.origin.y,
            UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height))
        adImg.image=UIImage(named: "ad_1")
        adImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LoadViewController.viewAd)))
        
        timerLabel.textColor=UIColor.blackColor()
        timerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LoadViewController.loadMainViewController)))
        
        //广告页面的跳过按钮倒计时功能
        let adTimer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(LoadViewController.refreshTimeLabel) , userInfo: nil, repeats: true)
        adTimer.fire()
        
        adImg.addSubview(timerLabel)
        self.view.addSubview(adImg)
    }
    
    
    let adTime = 5 //广告时间为5s
    //更新label上的时间
    func refreshTimeLabel(){
        if(adTime < 0){ //广告时间结束，进入主屏幕
            loadMainViewController()
        }else{
           timerLabel.text = "跳过\(adTime)S"
        }
    }
    
    //广告h5页面跳转
    func viewAd()  {
        
    }
    
    //进入主屏幕
    func loadMainViewController(){
        UIApplication.sharedApplication().keyWindow!.rootViewController=MainViewController()
    }
    
    
    
    
    

    
    // MARK: - 懒加载
    /// 新特性的图片数组
//    private let imageNames :[String] = ["gp_bg_0","gp_bg_1", "gp_bg_2"]
//    /// pageControll
//    private lazy var pageControll : UIPageControl = {
//        let pageControll = UIPageControl()
//        pageControll.numberOfPages = self.imageNames.count ?? 0
//        pageControll.pageIndicatorTintColor = UIColor.whiteColor()
//        pageControll.currentPageIndicatorTintColor = UIColor.yellowColor()
//        return pageControll
//    }()
}

