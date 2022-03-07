//
//  FavoriteStore.swift
//  iDine
//
//  Created by Yonghyun on 2022/03/07.
//

import Foundation
import RealmSwift

final class FavoriteStore: ObservableObject {
  private var favoriteResults: Results<FavoriteDB>
  
  init(realm: Realm) {
    favoriteResults = realm.objects(FavoriteDB.self)
  }
  
  var favorites: [Favorite] {
    favoriteResults.map(Favorite.init)
  }
}

// MARK: - CRUD Actions
extension FavoriteStore {
  
  func createOrDelete(item: MenuItem) {
    objectWillChange.send()
    
    if let favoriteDB = favoriteResults.first(where: { $0.id == item.id }) {
      do {
        let realm = try Realm()
        try realm.write {
          realm.delete(favoriteDB)
        }
      } catch let error {
        print(error.localizedDescription)
      }
    } else {
      do {
        let realm = try Realm()
        let restrictionsList = List<RestrictionObject>()
        
        for restriction in item.restrictions {
          let object = RestrictionObject()
          object.restriction = restriction
          restrictionsList.append(object)
        }
        
        let favoriteDB = FavoriteDB()
        favoriteDB.id = item.id
        favoriteDB.name = item.name
        favoriteDB.price = item.price
        favoriteDB.thumbnailImage = item.thumbnailImage
        favoriteDB.restrictions = restrictionsList
        
        try realm.write {
          realm.add(favoriteDB)
        }
      } catch let error {
        print(error.localizedDescription)
      }
      
    }
  }
}
