//
//  ActivityCollectionDataSource.swift
//  Treat
//
//  Created by Marina Martin on 15/05/24.
//

import UIKit

class ActivityCollectionDataSource: NSObject, UICollectionViewDataSource {
    var activities: [Activity]
    
    init(activities: [Activity]) {
        self.activities = activities
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell
        else{
            fatalError("Failed to dequeue")
        }
        
        let activity = self.activities[indexPath.row]
        
        cell.configData(title: activity.name ?? "", description: activity.desc ?? "", date: activity.createdAt ?? "", type: getType(activity: activity.type ?? "others"))
                
        return cell
    }
}
