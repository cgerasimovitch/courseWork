//
//  ViewController.swift
//  MyHabits
//
//  Created by Admin on 8/24/21.
//

import UIKit

class ViewController: UITabBarController {
    var firstTabNavigationController : UINavigationController!
    var secondTabNavigationControoller : UINavigationController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTabNavigationController = UINavigationController.init(rootViewController: HabitsViewController())
        secondTabNavigationControoller = UINavigationController.init(rootViewController: InfoViewController())
        self.setViewControllers([firstTabNavigationController, secondTabNavigationControoller], animated: true)
        
        let item1 = UITabBarItem(title: "Привычки", image: UIImage(named: "Habits_tab_icon"), tag: 0)
        let item2 = UITabBarItem(title: "Информация", image:  UIImage(named: "info_tab_icon"), tag: 1)
        
        firstTabNavigationController.tabBarItem = item1
        secondTabNavigationControoller.tabBarItem = item2
        UITabBar.appearance().tintColor = .systemGray2
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
