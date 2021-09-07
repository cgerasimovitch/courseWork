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
    var indexToTransport = 0
    let store = HabitsStore.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        title = screenNameContainer
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: leftTopItemName, style: .plain, target: self, action: #selector(dismissViewController))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: rightTopItemName, style: .plain, target: self, action: #selector(saveEditedItem))
        
        
    }
    

    
   
    @objc func dismissViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func saveEditedItem(){
        let vc = HabitViewController()
        vc.screenNameContainer = rightTopItemName
        vc.itemNameTextField.text = screenNameContainer
        vc.isNewHabit = false
        vc.itemColorView.backgroundColor = .white
        vc.chosenDate = store.habits[indexToTransport].date
        vc.modalPresentationStyle = UIModalPresentationStyle.currentContext
        vc.indexToEdit = indexToTransport
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
