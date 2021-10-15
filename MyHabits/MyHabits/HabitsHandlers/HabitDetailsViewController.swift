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
    let datesTable = UITableView()
    var trackedDate = [Date]()
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        title = screenNameContainer
        addTableViewElementsDelegateAndDataSource(tableHere: datesTable)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: leftTopItemName, style: .plain, target: self, action: #selector(dismissViewController))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: rightTopItemName, style: .plain, target: self, action: #selector(editedItem))
        trackedDate = store.habits[indexToTransport].trackDates.reversed()
        
    }
    
    override func viewWillLayoutSubviews(){
        addEverySubview()
        setupEverySubview()
    }
    
    func addEverySubview(){
        self.view.addSubview(datesTable)
    }
    
    func setupEverySubview(){
        tableItemsSetup(tableHere: datesTable)
        tableItemsSetupLayout(tableHere: datesTable)
    }
    
    func addTableViewElementsDelegateAndDataSource(tableHere: UITableView){
        tableHere.delegate = self
        tableHere.dataSource = self
        tableHere.register(DetailsHeader.self, forHeaderFooterViewReuseIdentifier: DetailsHeader().headerId)
        tableHere.register(DetailsCellTableViewCell.self, forCellReuseIdentifier: DetailsCellTableViewCell.cellId)
    }
    
    func tableItemsSetup(tableHere: UITableView){
        
    }
    
    func tableItemsSetupLayout(tableHere: UITableView){
        tableHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableHere.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableHere.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tableHere.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
   
    @objc func dismissViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func editedItem(){
        let vc = HabitViewController()
        vc.screenNameContainer = rightTopItemName
        vc.itemNameTextField.text = screenNameContainer
        vc.isNewHabit = false
        vc.itemColorView.backgroundColor = store.habits[indexToTransport].color
        vc.chosenDate = store.habits[indexToTransport].date
        print("sending chosenDate: \(vc.chosenDate)")
        vc.modalPresentationStyle = UIModalPresentationStyle.currentContext
        vc.indexToEdit = indexToTransport
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HabitDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: DetailsHeader().headerId) as! DetailsHeader
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.habits[indexToTransport].trackDates.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailsCellTableViewCell.cellId, for: indexPath) as! DetailsCellTableViewCell
        if Calendar.current.isDateInToday(trackedDate[indexPath.row]){
            cell.datecellTitle.text = "Сегодня"
        }
        
        else if Calendar.current.isDateInYesterday(trackedDate[indexPath.row]){
            cell.datecellTitle.text = "Вчера"
        }
        else { cell.datecellTitle.text =
            dateFormatter.string(from: trackedDate[indexPath.row])}
       
        return cell
    }
    
}
