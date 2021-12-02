//
//  HabitColorViewController.swift
//  MyHabits
//
//  Created by Admin on 8/27/21.
//

import UIKit

class HabitColorViewController: UIColorPickerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "ЦВЕТ"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Вернуться", style: .plain, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveTheChoice))
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissViewController(){
        navigationController?.popViewController(animated: true)
    }

    
    @objc func saveTheChoice(){
        
    }

}
