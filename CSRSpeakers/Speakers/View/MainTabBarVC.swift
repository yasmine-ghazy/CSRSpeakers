//
//  MainTabBarVC.swift
//  CSRSpeakers
//
//  Created by apple on 8/7/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit

class MainTabBarVC: UITabBarController,  UITabBarControllerDelegate {

    var speakersTabBarItem: UITabBarItem!
    var chatTabBarItem: UITabBarItem!
    var homeTabBarItem: UITabBarItem!
    var scheduleTabBarItem: UITabBarItem!
    var sponsorsTabBarItem: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.selectedIndex = 3
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    func setupUI(){
        
        let speakersVC = SpeakersVC()
        speakersVC.title = "Speakers"
        speakersVC.view.backgroundColor = UIColor.orange
        
        let chatVC = SpeakersVC()
        chatVC.title = "Chat"
        chatVC.view.backgroundColor = UIColor.blue
        
        let homeVC = SpeakersVC()
        homeVC.title = "Home"
        homeVC.view.backgroundColor = UIColor.cyan
        
        let scheduleVC = SpeakersVC()
        scheduleVC.title = "Schedule"
        scheduleVC.view.backgroundColor = UIColor.blue
        
        let sponsorsVC = SpeakersVC()
        sponsorsVC.title = "Sponsors"
        sponsorsVC.view.backgroundColor = UIColor.cyan
        
        
        speakersTabBarItem = UITabBarItem(title: "MainTabBarVCSpeakers".localized(), image: #imageLiteral(resourceName: "Vector-1").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "Vector").withRenderingMode(.alwaysOriginal))
        chatTabBarItem = UITabBarItem(title: "MainTabBarVCChat".localized(), image: #imageLiteral(resourceName: "007-chat").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "Vector-2").withRenderingMode(.alwaysOriginal))
        homeTabBarItem = UITabBarItem(title: "MainTabBarVCHome".localized(), image: #imageLiteral(resourceName: "009-home").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "008-construction").withRenderingMode(.alwaysOriginal))
        scheduleTabBarItem = UITabBarItem(title: "MainTabBarVCSchedule".localized(), image: #imageLiteral(resourceName: "calendar").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "calendar-1").withRenderingMode(.alwaysOriginal))
        sponsorsTabBarItem = UITabBarItem(title: "MainTabBarVCSponsors".localized(), image: #imageLiteral(resourceName: "004-travel").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "003-travel-1").withRenderingMode(.alwaysOriginal))
        
        speakersVC.tabBarItem = speakersTabBarItem
        chatVC.tabBarItem = chatTabBarItem
        homeVC.tabBarItem = homeTabBarItem
        scheduleVC.tabBarItem = scheduleTabBarItem
        sponsorsVC.tabBarItem = sponsorsTabBarItem
        self.viewControllers = [speakersVC, chatVC, homeVC, scheduleVC, sponsorsVC]
    }

}
