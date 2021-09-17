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
        self.view.backgroundColor = .white
        self.title = "ЦВЕТ"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Вернуться", style: .plain, target: self, action: #selector(dismissViewController))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveTheChoice))
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissViewController(){
        self.navigationController?.popViewController(animated: true)
    }

    
    @objc func saveTheChoice(){
        
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
