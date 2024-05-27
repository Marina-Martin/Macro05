//
//  AddSheetView.swift
//  Treat
//
//  Created by Marina Martin on 16/05/24.
//

import UIKit
import CoreData

class AddSheetView: UIViewController {
    
    // MARK: Variables
    
    var vc = ViewController()
    
    var collectionViewDataSource: ActivityCollectionDataSource?
    var activities: [Activity]?
    var collectionView: UICollectionView?
    var currentType: ActivityType = .empty
    
    // MARK: Components
    
    let nameLabel = TextLabel(text: "Nome da atividade")
    
    let nameField: UITextField = {
        let field = UITextField()
        
        field.backgroundColor = UIColor(named: "AppGray")
        field.layer.cornerRadius = 20
        field.textColor = UIColor.black
        
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    let typeLabel = TextLabel(text: "Tipo da atividade")
    
    let galeryButton = ActivityButtonView(type: .galery)
    let showButton = ActivityButtonView(type: .show)
    let playButton = ActivityButtonView(type: .play)
    let cafeButton = ActivityButtonView(type: .cafe)
    let cinemaButton = ActivityButtonView(type: .cinema)
    let restaurantButton = ActivityButtonView(type: .restaurant)
    let parkButton = ActivityButtonView(type: .park)
    let othersButton = ActivityButtonView(type: .others)
    
    let descLabel = TextLabel(text: "Descrição da atividade")
    
    let background: UIView = {
        let background = UIView()
        
        background.backgroundColor = UIColor(named: "AppGray")
        background.layer.cornerRadius = 20
        
        background.translatesAutoresizingMaskIntoConstraints = false
        
        return background
    }()
    
    let linkField: UITextField = {
        let field = UITextField()
        
        field.attributedPlaceholder = NSAttributedString(
            string: "Url",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "AppDarkGray") ?? .secondaryLabel]
        )
        field.textColor = UIColor.black
        field.layer.cornerRadius = 20
        
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    let dividerView: UIView = {
        let divider = UIView()
        
        divider.backgroundColor = .secondarySystemFill
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        return divider
    }()
    
    let descField: UITextField = {
        let field = UITextField()
        
        field.attributedPlaceholder = NSAttributedString(
            string: "Notas",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "AppDarkGray") ?? .secondaryLabel]
        )
        field.textColor = UIColor.black
        field.layer.cornerRadius = 20
        
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    let dateLabel = TextLabel(text: "Dia limite")
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        return picker
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        
        view.backgroundColor = UIColor(named: "AppBlack")
        
        setNavigationBar()
        
        updateButtons()
        
        setConstraints()
    }
    
    //eu odeio essa função com todas as minhas forças
    func updateButtons(){
        galeryButton.action = {
            self.currentType = .galery
            self.setColors()
        }
        othersButton.action = {
            self.currentType = .others
            self.setColors()
        }
        showButton.action = {
            self.currentType = .show
            self.setColors()
        }
        parkButton.action = {
            self.currentType = .park
            self.setColors()
        }
        cafeButton.action = {
            self.currentType = .cafe
            self.setColors()
        }
        playButton.action = {
            self.currentType = .play
            self.setColors()
        }
        cinemaButton.action = {
            self.currentType = .cinema
            self.setColors()
        }
        restaurantButton.action = {
            self.currentType = .restaurant
            self.setColors()
        }
    }
    
    func setColors(){
        self.othersButton.checkColor(currentType: self.currentType)
        self.showButton.checkColor(currentType: self.currentType)
        self.parkButton.checkColor(currentType: self.currentType)
        self.cafeButton.checkColor(currentType: self.currentType)
        self.playButton.checkColor(currentType: self.currentType)
        self.cinemaButton.checkColor(currentType: self.currentType)
        self.restaurantButton.checkColor(currentType: self.currentType)
        self.galeryButton.checkColor(currentType: self.currentType)
    }
    
    // MARK: Setup
    
    func setNavigationBar(){
        self.navigationItem.title = "Nova Atividade"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "AppWhite") ?? .white, NSAttributedString.Key.font: UIFont(name: "RadioCanada-Regular_bold", size: 18)!]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(ViewDismiss))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(CreateActivity))
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: Constraints
    
    func setConstraints(){
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22)
        ])
        
        view.addSubview(nameField)
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            nameField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            nameField.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: 44)
        ])
        
        view.addSubview(typeLabel)
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 35),
            typeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22)
        ])
        
        setActivityStack()
        
        view.addSubview(descLabel)
        NSLayoutConstraint.activate([
            descLabel.topAnchor.constraint(equalTo: othersButton.bottomAnchor, constant: 35),
            descLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22)
        ])
        
        view.addSubview(background)
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 10),
            background.bottomAnchor.constraint(equalTo: background.topAnchor, constant: 165),
            background.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 17),
            background.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -17)
        ])
        
        background.addSubview(linkField)
        NSLayoutConstraint.activate([
            linkField.topAnchor.constraint(equalTo: background.topAnchor, constant: 15),
            linkField.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10),
            linkField.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: 10),
            nameField.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: 44)
        ])
        
        background.addSubview(dividerView)
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: linkField.bottomAnchor, constant: 5),
            dividerView.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 8),
            dividerView.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -8),
            dividerView.bottomAnchor.constraint(equalTo: dividerView.topAnchor, constant: 1)
        ])
        
        background.addSubview(descField)
        NSLayoutConstraint.activate([
            descField.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 8),
            descField.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 8),
            descField.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -8)
        ])
        
        view.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: background.bottomAnchor, constant: 35),
            dateLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 27),
        ])
        
        view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 12),
            datePicker.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 27),
        ])
    }
    
    // MARK: Funcs
    
    @objc func ViewDismiss(){
        navigationController?.dismiss(animated: true)
    }
    
    @objc func CreateActivity(){
        let context = vc.context
        let newActivity = Activity(context: context)
        
        newActivity.name = nameField.text
        newActivity.desc = descField.text
        newActivity.createdAt = dateFormater(someDate: Date.now)
        newActivity.type = getName(activity: currentType)
        print("\(getName(activity: currentType))")
        newActivity.endsAt = dateFormater(someDate: datePicker.date)
        
        do{
            try context.save()
        }catch{
            print("Error in data creation")
        }

        //nao funciona - marca da ajuda do Bonito no código
        //vc.fetchActivities()
        
        //Aqui seria chamado no WillAppear da sua view, porem nao tem com a sheet - Bonito
        updateDataSourceAndDelegate()
        
        ViewDismiss()
    }
    
    func updateDataSourceAndDelegate(){
        fetchActivities()
        collectionViewDataSource?.activities = activities ?? []
        collectionView?.reloadData()
    }
    
    func fetchActivities(){
        do{
            self.activities = try vc.context.fetch(Activity.fetchRequest())
        }catch{
            print("Error while fetching data")
        }
    }
    
    func dateFormater(someDate: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "d/MM/yyyy"
        
        let brDate = dateFormatter.string(from: someDate)
        return brDate
    }
}

#Preview(){
    return AddSheetView()
}
