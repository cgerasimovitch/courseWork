//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Admin on 8/19/21.
//

import UIKit

class InfoViewController: UIViewController, UIScrollViewDelegate {
    let titleHeader: UILabel = {
        let labelHere = UILabel()
        labelHere.text = "Привычка за 21 день"
        labelHere.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        labelHere.textColor = .black
        return labelHere
    }()
    let infoScrollView = UIScrollView()
    let infoLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        infoScrollView.delegate = self
        addEverySubview()
        setupEverySubview()
        navigationController?.setNavigationBarHidden(false, animated: false)
        title = "Информация"
    }
    
    func addEverySubview(){
        view.addSubview(infoScrollView)
        infoScrollView.addSubview(infoLabel)
        infoScrollView.addSubview(titleHeader)
    }

    func setupEverySubview(){
        titleHeaderSetupLayout(labelHere: titleHeader)
        infoScrollViewSetupLayout(scrollHere: infoScrollView)
        infoLabelSetup(labelHere: infoLabel)
        infoLabelSetupLayout(labelHere: infoLabel)
    }
    
    // MARK: - setupEverySubview

    func titleHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.topAnchor.constraint(equalTo: infoScrollView.topAnchor, constant: 22),
            labelHere.widthAnchor.constraint(equalToConstant: 218),
            labelHere.heightAnchor.constraint(equalToConstant: 24),
            labelHere.leadingAnchor.constraint(equalTo: infoScrollView.leadingAnchor, constant: 16),
        ])
    }
    
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
                scrollView.contentOffset.x = 0
            }
    }
    func infoScrollViewSetupLayout(scrollHere: UIScrollView){
        scrollHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollHere.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollHere.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollHere.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollHere.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    
    func infoLabelSetup(labelHere: UILabel){
        labelHere.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:\n\n1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага.\n\n2. Выдержать 2 дня в прежнем состоянии самоконтроля.\n\n3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться. \n\n4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств.\n\n5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой."
        labelHere.numberOfLines = 0
        labelHere.lineBreakMode = .byWordWrapping
        labelHere.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        labelHere.textColor = .black
    }
    
    func infoLabelSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.topAnchor.constraint(equalTo: titleHeader.bottomAnchor, constant: 16),
            labelHere.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            labelHere.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            labelHere.bottomAnchor.constraint(equalTo: infoScrollView.bottomAnchor),
            labelHere.heightAnchor.constraint(lessThanOrEqualToConstant: 876)
        ])
    }
    

}
