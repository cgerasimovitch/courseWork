//
//  HomeViewController.swift
//  MyHabits
//
//  Doing
/*title и кнопка +
расположены сейчас на основном view контроллера, а должны быть в navigationItem у navigationBar, обратите внимание на дизайн в задании
*/
//

import UIKit

class HabitsViewController: UIViewController {
    let titleHeader = UILabel()
    let buttonAdd = UIButton()
    let tableItemsView = UITableView()
    var indexToHold = 0
    let storeOfHabits = HabitsStore.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        tableItemsView.reloadData()
        
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
        setupNavigationItems()
        buttonAddSetup(buttonHere: buttonAdd)
        tableItemsSetup(tableHere: tableItemsView)
        tableItemsSetupLayout(tableHere: tableItemsView)
        
    }
    
    func setupNavigationItems(){
        self.title = "Cегодня"
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonAdd)
        
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
        labelHere.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        labelHere.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    
    func buttonAddSetup(buttonHere: UIButton){
        buttonHere.setTitle("+", for: .normal)
        buttonHere.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.regular)
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
    
    
    func tableItemsSetup(tableHere: UITableView){
        tableHere.separatorStyle = .none
        tableHere.backgroundColor = UIColor.clear
    }
    
    func tableItemsSetupLayout(tableHere: UITableView){
        tableHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableHere.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
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
        headerView.inspireProgressHeader.text = "\(Int(storeOfHabits.todayProgress*100))%"
        headerView.inspireProgressView.progress = storeOfHabits.todayProgress
        
        headerView.layer.cornerRadius = 10
       
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
        
        let store = storeOfHabits.habits[indexPath.row]
        cell.habitcellTitle.text = store.name
        cell.cellSubtitle.text = store.dateString
        cell.cellCounterTitle.text = "Счётчик: \(String(store.trackDates.count))"
        cell.habitcellTitle.textColor = store.color
        cell.checkMarkView.layer.borderColor = store.color.cgColor
        cell.habitTableViewCellIndex = indexPath.row
        cell.backgroundColor = UIColor.clear
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
        vc.leftTopItemName = self.title ?? ""
        vc.screenNameContainer = storeOfHabits[indexPath.row].name
        
        vc.indexToTransport = indexPath.row
        vc.modalPresentationStyle = UIModalPresentationStyle.currentContext
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
