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
        setupEverySubview()
        addTableViewElements()
        // Do any additional setup after loading the view.
    }
    
    func addEverySubview(){
        self.view.addSubview(titleHeader)
        self.view.addSubview(buttonAdd)
        self.view.addSubview(tableItems)
        
    }
    
    func setupEverySubview(){
        titleHeaderSetup()
        titleHeaderSetupLayout()
        buttonAddSetup()
        buttonAddSetupLayout()
        tableItemsSetup()
        tableItemsSetupLayout()
    }
    
    func addTableViewElements(){
        tableItems.delegate = self
        tableItems.dataSource = self
        tableItems.register(HabitsViewHeaderView.self, forHeaderFooterViewReuseIdentifier: HabitsViewHeaderView().headerId)
        tableItems.register(HabitTableViewCell.self, forCellReuseIdentifier: HabitTableViewCell.cellId)
    }
    // MARK: - Navigation
    
    func titleHeaderSetup(){
        titleHeader.text = "Сегодня"
        titleHeader.font = UIFont(name: "SF Pro Display-Semibold", size: 20)
        titleHeader.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func titleHeaderSetupLayout(){
        titleHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleHeader.widthAnchor.constraint(equalToConstant: 141),
            titleHeader.heightAnchor.constraint(equalToConstant: 40),
            titleHeader.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 92),
            titleHeader.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 14)
        ])
        
    }
    func buttonAddSetup(){
        buttonAdd.setTitle("+", for: .normal)
        buttonAdd.setTitleColor(UIColor(red: 161, green: 22, blue: 204, alpha: 1), for: .normal)
        buttonAdd.backgroundColor = .blue
        
    }
    
    func buttonAddSetupLayout(){
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonAdd.widthAnchor.constraint(equalToConstant: 44),
            buttonAdd.heightAnchor.constraint(equalToConstant: 40),
            buttonAdd.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 44),
            buttonAdd.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -5)
        ])
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
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HabitTableViewCell.cellId, for: indexPath) as! HabitTableViewCell
        return cell
    }
    
    
}
