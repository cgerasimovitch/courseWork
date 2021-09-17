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
    let tableItemsView = UITableView()
    var indexToHold = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        tableItemsView.reloadData()
        navigationController?.setNavigationBarHidden(false, animated: false)
        addEverySubview()
        setupEverySubview()
        addTableViewElementsDelegateAndDataSource(tableHere: tableItemsView)
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        
    }
    
   
    @objc func loadList(){
            
            self.tableItemsView.reloadData()
        }
    
    
    func addEverySubview(){
        self.view.addSubview(titleHeader)
        self.view.addSubview(buttonAdd)
        self.view.addSubview(tableItemsView)
        
    }
    
    func setupEverySubview(){
        titleHeaderSetup(labelHere: titleHeader)
        titleHeaderSetupLayout(labelHere: titleHeader)
        buttonAddSetup(buttonHere: buttonAdd)
        buttonAddSetupLayout(buttonHere: buttonAdd)
        tableItemsSetup(tableHere: tableItemsView)
        tableItemsSetupLayout(tableHere: tableItemsView)
    }
    
    func addTableViewElementsDelegateAndDataSource(tableHere: UITableView){
        tableHere.delegate = self
        tableHere.dataSource = self
        tableHere.register(HabitsViewHeaderView.self, forHeaderFooterViewReuseIdentifier: HabitsViewHeaderView().headerId)
        tableHere.register(HabitTableViewCell.self, forCellReuseIdentifier: HabitTableViewCell.cellId)
    }
    // MARK: - Setup every subview
    
    func titleHeaderSetup(labelHere: UILabel){
        labelHere.text = "Сегодня"
        labelHere.font = UIFont(name: "SF Pro Display-Semibold", size: 20)
        labelHere.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func titleHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 141),
            labelHere.heightAnchor.constraint(equalToConstant: 40),
            labelHere.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 92),
            labelHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 14)
        ])
        
    }
    func buttonAddSetup(buttonHere: UIButton){
        buttonHere.setTitle("+", for: .normal)
        buttonHere.setTitleColor(UIColor(red: 0.63, green: 0.09, blue: 0.80, alpha: 1.00), for: .normal)
        buttonHere.addTarget(self, action: #selector(addNewItem), for: .touchUpInside)
    }
    
    @objc func addNewItem(){
        let vc = HabitViewController()
        vc.screenNameContainer = "Создать"
        vc.isNewHabit = true
        vc.itemColorView.backgroundColor = .white
        
        vc.modalPresentationStyle = UIModalPresentationStyle.currentContext
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func buttonAddSetupLayout(buttonHere: UIButton){
        buttonHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonHere.widthAnchor.constraint(equalToConstant: 44),
            buttonHere.heightAnchor.constraint(equalToConstant: 40),
            buttonHere.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 44),
            buttonHere.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -5)
        ])
    }
    
    func tableItemsSetup(tableHere: UITableView){
        
    }
    
    func tableItemsSetupLayout(tableHere: UITableView){
        tableHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableHere.topAnchor.constraint(equalTo: titleHeader.bottomAnchor, constant: 7.5),
            tableHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 17),
            tableHere.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -17),
            tableHere.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }
    
    

}

// MARK: - Setup tableViewDelegate and DataSource
extension HabitsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HabitsViewHeaderView().headerId) as! HabitsViewHeaderView
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HabitTableViewCell.cellId, for: indexPath) as! HabitTableViewCell
        let storeOfHabits = HabitsStore.shared.habits
        var store = storeOfHabits[indexPath.row]
        cell.habitcellTitle.text = store.name
        cell.cellSubtitle.text = store.dateString
        cell.cellCounterTitle.text = "Счётчик: \(String(store.trackDates.count))"
        cell.habitcellTitle.textColor = store.color
        cell.checkMarkView.layer.borderColor = store.color.cgColor
        cell.habitTableViewCellIndex = indexPath.row
        if store.isAlreadyTakenToday == true {
            cell.checkMarkView.backgroundColor = UIColor(cgColor: cell.checkMarkView.layer.borderColor!)
            cell.checkMarkMarkLabel.text = "✓"}
        else{ cell.checkMarkView.backgroundColor = .white
            cell.checkMarkMarkLabel.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storeOfHabits = HabitsStore.shared.habits
        let vc = HabitDetailsViewController()
        vc.leftTopItemName = self.titleHeader.text!
        vc.screenNameContainer = storeOfHabits[indexPath.row].name
        
        vc.indexToTransport = indexPath.row
        vc.modalPresentationStyle = UIModalPresentationStyle.currentContext
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
