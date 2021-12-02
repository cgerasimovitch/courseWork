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
    let titleHeader: UILabel = {
        let labelHere = UILabel()
        labelHere.text = "Сегодня"
        labelHere.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        labelHere.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return labelHere
    }()
    
    let buttonAdd: UIButton = {
        let buttonHere = UIButton()
        buttonHere.setTitle("+", for: .normal)
        buttonHere.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.regular)
        buttonHere.setTitleColor(UIColor(red: 0.63, green: 0.09, blue: 0.80, alpha: 1.00), for: .normal)
        buttonHere.addTarget(self, action: #selector(addNewItem), for: .touchUpInside)
        return buttonHere
    }()
    
    let tableItemsView:UITableView = {
        let tableHere = UITableView()
        tableHere.separatorStyle = .none
        tableHere.backgroundColor = UIColor.clear
        tableHere.showsVerticalScrollIndicator = false
        return tableHere
    }()
    
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
            tableItemsView.reloadData()
        }
    
    
    func addEverySubview(){
        view.addSubview(titleHeader)
        view.addSubview(buttonAdd)
        view.addSubview(tableItemsView)
        
    }
    
    func setupEverySubview(){
        setupNavigationItems()
        tableItemsSetupLayout(tableHere: tableItemsView)
        
    }
    
    func setupNavigationItems(){
        title = "Cегодня"
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonAdd)
        navigationItem.setHidesBackButton(true, animated:true)
        
    }
    
    func addTableViewElementsDelegateAndDataSource(tableHere: UITableView){
        
        tableHere.delegate = self
        tableHere.dataSource = self
        tableHere.register(HabitsViewHeaderView.self, forHeaderFooterViewReuseIdentifier: HabitsViewHeaderView().headerId)
        tableHere.register(HabitTableViewCell.self, forCellReuseIdentifier: HabitTableViewCell.cellId)
    }
    // MARK: - Setup every subview
    
    
    @objc func addNewItem(){
        let vc = HabitViewController()
        vc.screenNameContainer = "Создать"
        vc.isNewHabit = true
        vc.itemColorView.backgroundColor = .white
        
        vc.modalPresentationStyle = UIModalPresentationStyle.currentContext
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func tableItemsSetup(tableHere: UITableView){
       
    }
    
    func tableItemsSetupLayout(tableHere: UITableView){
        tableHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableHere.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableHere.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 17),
            tableHere.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -17),
            tableHere.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
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
        vc.leftTopItemName = title ?? ""
        vc.screenNameContainer = storeOfHabits[indexPath.row].name
        
        vc.indexToTransport = indexPath.row
        vc.modalPresentationStyle = UIModalPresentationStyle.currentContext
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
