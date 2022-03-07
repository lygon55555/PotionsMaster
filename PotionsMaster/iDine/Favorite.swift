//
//  Favorite.swift
//  iDine
//
//  Created by Yonghyun on 2022/03/03.
//

struct Favorite: Identifiable {
    let id: String
    let name: String
    let price: Int
    let thumbnailImage: String
    let restrictions: [String]
}

extension Favorite {
    init(favoriteDB: FavoriteDB) {
        id = favoriteDB.id
        name = favoriteDB.name
        price = favoriteDB.price
        thumbnailImage = favoriteDB.thumbnailImage
        restrictions = favoriteDB.restrictions.map { $0.restriction }
    }
}
