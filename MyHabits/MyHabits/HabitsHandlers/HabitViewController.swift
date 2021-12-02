//
//  CreationViewController.swift
//  MyHabits
//
//  Created by Admin on 8/19/21.
//

import UIKit

class HabitViewController: UIViewController {

    var indexToEdit = 0
    
    //MARK: — UI Elements
    private let itemNameHeader: UILabel = {
        let labelHere = UILabel()
        labelHere.text = "НАЗВАНИЕ"
        labelHere.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.semibold)
        
        return labelHere
    }()
        
    let itemNameTextField = UITextField()
    let itemColorHeader = UILabel()
    let itemColorView = UIView()
    let itemTimeHeader = UILabel()
    let itemCurrentTimeLabel = UILabel()
    let itemDatePicker = UIDatePicker()
    let deleteButton = UIButton()
    //MARK: — Variables
    let store = HabitsStore.shared
    var colorToChange = UIColor()
    var chosenDate = Date()
    var screenNameContainer = ""
    var isNewHabit = true
    var leftTopItemName = "Отменить"
    var rightTopItemName = "Сохранить"
    var habitName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = screenNameContainer
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: leftTopItemName, style: .plain, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: rightTopItemName, style: .plain, target: self, action: #selector(saveItem))
        
        if isNewHabit == true{
            colorToChange = UIColor(red: 0.63, green: 0.09, blue: 0.80, alpha: 1.00)
            fetchDate()}
        else{
            colorToChange = store.habits[indexToEdit].color}
    }
    
    override func viewWillLayoutSubviews() {
        addEverySubview()
        setupEverySubview()
    }
    
    @objc func dismissViewController(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    func addEverySubview() {
        view.addSubview(itemNameHeader)
        view.addSubview(itemNameTextField)
        view.addSubview(itemColorHeader)
        view.addSubview(itemColorView)
        view.addSubview(itemTimeHeader)
        view.addSubview(itemCurrentTimeLabel)
        view.addSubview(itemDatePicker)
        if isNewHabit == false{
            view.addSubview(deleteButton)}
    }
    
    func setupEverySubview() {
     
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
   
    
    func itemNameHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 100),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            labelHere.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemNameTextFieldSetup(textFieldHere: UITextField){
        textFieldHere.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        textFieldHere.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        textFieldHere.textColor = .black
    }
    
    func itemNameTextFieldSetupLayout(textFieldHere: UITextField){
        textFieldHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFieldHere.widthAnchor.constraint(equalToConstant: 295),
            textFieldHere.heightAnchor.constraint(equalToConstant: 22),
            textFieldHere.topAnchor.constraint(equalTo: itemNameHeader.bottomAnchor, constant: 7),
            textFieldHere.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15)
        ])
    }
    
    func itemColorHeaderSetup(labelHere: UILabel){
        labelHere.text = "ЦВЕТ"
        labelHere.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.semibold)
    }
    
    func itemColorHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 60),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: itemNameTextField.bottomAnchor, constant: 15),
            labelHere.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemColorViewSetup(viewHere: UIView){
        viewHere.backgroundColor = colorToChange // !!! Тут ошибка
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
        colorPicker.selectedColor = colorToChange

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
            viewHere.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemTimeHeaderSetup(labelHere: UILabel){
        labelHere.text = "ВРЕМЯ"
        labelHere.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.semibold)
    }
    func itemTimeHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 60),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: itemColorView.bottomAnchor, constant: 15),
            labelHere.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemCurrentTimeLabelSetup(labelHere: UILabel){
        let dateToColor = dateToTime(dateToConvert: chosenDate)
        let mainString = "Каждый день в \(dateToColor)"
        let range = (mainString as NSString).range(of: dateToColor)
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        let fontColor = colorToChange
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: fontColor, range: range)
        labelHere.attributedText = mutableAttributedString
        print(mainString)
        
    }
    func itemCurrentTimeLabelSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 194),
            labelHere.heightAnchor.constraint(equalToConstant: 22),
            labelHere.topAnchor.constraint(equalTo: itemTimeHeader.bottomAnchor, constant: 7),
            labelHere.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelHere.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16)
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
            datePickerHere.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            datePickerHere.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    
    func buttonDeleteSetup(buttonHere: UIButton){
        buttonHere.setTitle("Удалить привычку", for: .normal)
        buttonHere.setTitleColor(UIColor(red: 1.00, green: 0.23, blue: 0.19, alpha: 1.00), for: .normal)
        buttonHere.addTarget(self, action: #selector(deleteShowAlert), for: .touchUpInside)
        buttonHere.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
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
            buttonHere.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            buttonHere.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])}
    
    @objc func saveItem(){
       
        if itemNameTextField.text != ""{
        let newHabit = Habit(name: itemNameTextField.text!,
                             date: chosenDate as Date,
                             color: colorToChange)
            if isNewHabit == true {
                store.habits.append(newHabit)}
            else{
                store.habits[indexToEdit].name = newHabit.name
                store.habits[indexToEdit].date = newHabit.date
                store.habits[indexToEdit].color = newHabit.color
            }
            dismissViewController()
        }
        else {
            print("Empty Habit")
            return}
    }
    
    func fetchDate(){
        
        itemCurrentTimeLabelSetup(labelHere: itemCurrentTimeLabel)
        
    }
    @objc func dateChanged(_ sender: UIDatePicker) {
        if isNewHabit == true{
            chosenDate = itemDatePicker.date
        }
        chosenDate = updateTimeOnly(dateToChangeTime: chosenDate)
        
        fetchDate()
    }
    
    func dateToTime(dateToConvert: Date) -> String{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: dateToConvert)
    }
    
    func updateTimeOnly(dateToChangeTime: Date) -> Date{
        
        var currentComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: dateToChangeTime)
        let datePickerComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: itemDatePicker.date)
        currentComponents.hour = datePickerComponents.hour
        currentComponents.minute = datePickerComponents.minute
        let newDate = Calendar.current.date(from: currentComponents) ?? Date()
        
        return(newDate)
    }

}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    
    //  Called once you have finished picking the color.
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        colorToChange = viewController.selectedColor
        itemColorView.backgroundColor = colorToChange
        itemCurrentTimeLabelSetup(labelHere: itemCurrentTimeLabel)
    }
}

