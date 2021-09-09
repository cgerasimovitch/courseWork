//
//  CreationViewController.swift
//  MyHabits
//
//  Created by Admin on 8/19/21.
//

import UIKit

class HabitViewController: UIViewController {

    var indexToEdit = 0
    let itemNameHeader = UILabel()
    let itemNameTextField = UITextField()
    let itemColorHeader = UILabel()
    let itemColorView = UIView()
    let itemTimeHeader = UILabel()
    let itemCurrentTimeLabel = UILabel()
    let itemDatePicker = UIDatePicker()
    var chosenDate = Date()
    let deleteButton = UIButton()
    var screenNameContainer = ""
    var isNewHabit = true
    var leftTopItemName = "Отменить"
    var rightTopItemName = "Сохранить"
    var habitName = ""
    let store = HabitsStore.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = screenNameContainer
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: leftTopItemName, style: .plain, target: self, action: #selector(dismissViewController))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: rightTopItemName, style: .plain, target: self, action: #selector(saveItem))
        if isNewHabit == true{
            fetchDate()}
       
    }
    
    override func viewWillLayoutSubviews() {
        addEverySubview()
        setupEverySubview()
    }
    
    @objc func dismissViewController(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        let vc = HabitsViewController()
        vc.modalPresentationStyle = UIModalPresentationStyle.currentContext
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func addEverySubview() {
        self.view.addSubview(itemNameHeader)
        self.view.addSubview(itemNameTextField)
        self.view.addSubview(itemColorHeader)
        self.view.addSubview(itemColorView)
        self.view.addSubview(itemTimeHeader)
        self.view.addSubview(itemCurrentTimeLabel)
        self.view.addSubview(itemDatePicker)
        if isNewHabit == false{
            self.view.addSubview(deleteButton)}
    }
    
    func setupEverySubview() {
        itemNameHeaderSetup(labelHere: itemNameHeader)
        itemNameHeaderSetupLayout(labelHere: itemNameHeader)
        itemNameTextFieldSetup(textFieldHere: itemNameTextField)
        itemNameTextFieldSetupLayout(textFieldHere: itemNameTextField)
        itemColorHeaderSetup(labelHere: itemColorHeader)
        itemColorHeaderSetupLayout(labelHere: itemColorHeader)
        itemColorViewSetup(viewHere: itemColorView)
        itemColorViewSetupLayout(viewHere: itemColorView)
        itemTimeHeaderSetup(labelHere: itemTimeHeader)
        itemTimeHeaderSetupLayout(labelHere: itemTimeHeader)
        itemCurrentTimeLabelSetup(labelHere: itemCurrentTimeLabel)
        itemCurrentTimeLabelSetupLayout(labelHere: itemCurrentTimeLabel)
        itemDatePickerSetup(datePickerHere: itemDatePicker)
        itemDatePickerSetupLayout(datePickerHere: itemDatePicker)
        if isNewHabit == false{
        buttonDeleteSetup(buttonHere: deleteButton)
            buttonDeleteSetupLayout(buttonHere: deleteButton)}
    }
    // MARK: - Setup every subview
    func itemNameHeaderSetup(labelHere: UILabel){
        labelHere.text = "НАЗВАНИЕ"
    }
    
    func itemNameHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 100),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 21),
            labelHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemNameTextFieldSetup(textFieldHere: UITextField){
        textFieldHere.placeholder = "Бегать по утрам, спать 8 часов и т.п."
    }
    
    func itemNameTextFieldSetupLayout(textFieldHere: UITextField){
        textFieldHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFieldHere.widthAnchor.constraint(equalToConstant: 295),
            textFieldHere.heightAnchor.constraint(equalToConstant: 22),
            textFieldHere.topAnchor.constraint(equalTo: itemNameHeader.bottomAnchor, constant: 7),
            textFieldHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15)
        ])
    }
    
    func itemColorHeaderSetup(labelHere: UILabel){
        labelHere.text = "ЦВЕТ"
    }
    
    func itemColorHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 60),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: itemNameTextField.bottomAnchor, constant: 15),
            labelHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemColorViewSetup(viewHere: UIView){
        viewHere.backgroundColor = store.habits[indexToEdit].color
        viewHere.layer.cornerRadius = 15
        viewHere.isUserInteractionEnabled = true
        //Add gesture
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(itemColorViewAction))
        gesture.numberOfTapsRequired = 1
        viewHere.addGestureRecognizer(gesture)
    }
    
    @objc func itemColorViewAction(){
        let colorPicker = HabitColorViewController()
       
        // Setting the Initial Color of the Picker
        colorPicker.selectedColor = itemColorView.backgroundColor!

        // Setting Delegate
        colorPicker.delegate = self

        // Presenting the Color Picker
        self.present(colorPicker, animated: true, completion: nil)
    }
    
    
    func itemColorViewSetupLayout(viewHere: UIView){
        viewHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewHere.widthAnchor.constraint(equalToConstant: 30),
            viewHere.heightAnchor.constraint(equalToConstant: 30),
            viewHere.topAnchor.constraint(equalTo: itemColorHeader.bottomAnchor, constant: 7),
            viewHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemTimeHeaderSetup(labelHere: UILabel){
        labelHere.text = "ВРЕМЯ"
    }
    func itemTimeHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 60),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: itemColorView.bottomAnchor, constant: 15),
            labelHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemCurrentTimeLabelSetup(labelHere: UILabel){
        
    }
    func itemCurrentTimeLabelSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 194),
            labelHere.heightAnchor.constraint(equalToConstant: 22),
            labelHere.topAnchor.constraint(equalTo: itemTimeHeader.bottomAnchor, constant: 7),
            labelHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    func itemDatePickerSetup(datePickerHere: UIDatePicker){
        datePickerHere.datePickerMode = .time
        datePickerHere.preferredDatePickerStyle = .wheels
        datePickerHere.date = chosenDate
        
        datePickerHere.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
    }
    
    func itemDatePickerSetupLayout(datePickerHere: UIDatePicker){
        datePickerHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePickerHere.heightAnchor.constraint(equalToConstant: 216),
            datePickerHere.topAnchor.constraint(equalTo: itemCurrentTimeLabel.bottomAnchor, constant: 15),
            datePickerHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            datePickerHere.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    
    func buttonDeleteSetup(buttonHere: UIButton){
        buttonHere.setTitle("Удалить привычку", for: .normal)
        buttonHere.setTitleColor(.red, for: .normal)
        buttonHere.addTarget(self, action: #selector(deleteShowAlert), for: .touchUpInside)
    }
    
    @objc func deleteShowAlert(){
        let alertController = UIAlertController(title: "Удалить привычку", message: "Вы хотите удалить привычку \(habitName)?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            print("Отмена")
        }
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) {_ in 
            self.deleteItem()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteItem() {
        store.habits.remove(at: indexToEdit)
        dismissViewController()
        
        }
    
    
    
    func buttonDeleteSetupLayout(buttonHere: UIButton){
        buttonHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonHere.widthAnchor.constraint(equalToConstant: 420),
            buttonHere.heightAnchor.constraint(equalToConstant: 22),
            buttonHere.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            buttonHere.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
        ])}
    
    @objc func saveItem(){
       
        if itemNameTextField.text != ""{
        var newHabit = Habit(name: itemNameTextField.text!,
                             date: chosenDate as Date,
                             color: itemColorView.backgroundColor!)
            if isNewHabit == true {
                self.store.habits.append(newHabit)}
            else{
                self.store.habits.remove(at: indexToEdit)
                self.store.habits.insert(newHabit, at: indexToEdit)
            }
            dismissViewController()
        }
        else {
            print("Empty Habit")
            return}
    }
    
    func fetchDate(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let stringDate = formatter.string(from: itemDatePicker.date)
        chosenDate = formatter.date(from: stringDate)!
        
    }
    @objc func dateChanged(_ sender: UIDatePicker) {
        fetchDate()
    }
    
    
    //MARK: - Saving Habit
   

}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    
    //  Called once you have finished picking the color.
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.itemColorView.backgroundColor = viewController.selectedColor
        
    }
}

