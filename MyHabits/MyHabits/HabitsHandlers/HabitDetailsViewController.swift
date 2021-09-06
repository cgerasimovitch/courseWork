//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Admin on 9/6/21.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    var screenNameContainer = ""
    var leftTopItemName = ""
    var rightTopItemName = "Править"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        title = screenNameContainer
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: leftTopItemName, style: .plain, target: self, action: #selector(dismissViewController))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: rightTopItemName, style: .plain, target: self, action: #selector(saveEditedItem))
        // Do any additional setup after loading the view.
    }
    

    
   
    @objc func dismissViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func saveEditedItem(){
        print("Сохранение началось")
    }
}
