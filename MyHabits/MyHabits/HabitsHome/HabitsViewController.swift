//
//  HomeViewController.swift
//  MyHabits
//
//  Created by Admin on 8/19/21.
//

import UIKit

class HabitsViewController: UIViewController {
    let titleHeader = UILabel()
    let buttonAdd = UIButton()
    let tableItems = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        addEverySubview()
        
        // Do any additional setup after loading the view.
    }
    
    func addEverySubview(){
        self.view.addSubview(titleHeader)
        self.view.addSubview(buttonAdd)
        self.view.addSubview(tableItems)
        
    }
    
    func addTableViewElements(){
        tableItems.delegate = self
        tableItems.dataSource = self
        tableItems.register(HabitsViewHeaderView.self, forHeaderFooterViewReuseIdentifier: HabitsViewHeaderView().headerId)
        tableItems.register(HabitTableViewCell.self, forCellReuseIdentifier: HabitTableViewCell.cellId)
    }
    // MARK: - Navigation
    
    func titleHeaderSetup(){
        
    }
    
    func titleHeaderSetupLayout(){
        
    }
    func buttonAddSetup(){
        
    }
    
    func buttonAddSetupLayout(){
        
    }
    
    func tableItemsSetup(){
        
    }
    
    func tableItemsSetupLayout(){
        
    }
    
    

}

extension HabitsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HabitsViewHeaderView().headerId) as! HabitsViewHeaderView
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        300
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HabitTableViewCell.cellId, for: indexPath) as! HabitTableViewCell
        return cell
    }
    
    
}
