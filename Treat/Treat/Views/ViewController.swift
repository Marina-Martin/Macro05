//
//  ViewController.swift
//  Treat
//
//  Created by Marina Martin on 13/05/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // MARK: variables
    
    var collectionViewDelegate: CollectionViewDelegate = CollectionViewDelegate()
    var collectionViewDataSource: ActivityCollectionDataSource?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var activities: [Activity]?
    private let activitiesTest: [String] = ["Atividade 1", "Atividade 2"]
    
    // MARK: Components
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .clear
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        
        view.backgroundColor = UIColor(named: "AppBlack")
        
        setNavigationBar()
        
        fetchActivities()
        // MARK: sla, talvez dê problema
        collectionViewDataSource = ActivityCollectionDataSource(activities: activities ?? [])
        
        setConstraints()
        
        collectionView.delegate = collectionViewDelegate
        collectionView.dataSource = collectionViewDataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchActivities()
    }
    
    // MARK: - Setup
    
    func setNavigationBar(){
        navigationItem.title = "Suas Atividades"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "AppWhite") ?? .white, NSAttributedString.Key.font: UIFont(name: "RadioCanada-Regular_bold", size: 32)!]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "AppWhite") ?? .white, NSAttributedString.Key.font: UIFont(name: "RadioCanada-Regular_bold", size: 32)!]
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: (UIImage(systemName: "plus.circle.fill")), style: .plain, target: self, action: #selector(addButtonTapped)),
            UIBarButtonItem(image: (UIImage(systemName: "line.3.horizontal.decrease.circle")), style: .plain, target: nil, action: nil),
        ]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    func setConstraints(){
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func addButtonTapped(){
        let vc = AddSheetView()
        vc.collectionViewDataSource = collectionViewDataSource
        vc.activities = self.activities
        vc.collectionView = self.collectionView
        let sheetViewController = UINavigationController(rootViewController: vc)
        
        present(sheetViewController, animated: true, completion: nil)
    }
    
    func fetchActivities(){
        do{
            self.activities = try context.fetch(Activity.fetchRequest())
        }catch{
            print("Error while fetching data")
        }
    }
}

#Preview(){
    return ViewController()
}

