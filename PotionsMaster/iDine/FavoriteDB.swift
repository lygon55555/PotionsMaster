//
//  FavoriteDB.swift
//  iDine
//
//  Created by Yonghyun on 2022/03/07.
//

import RealmSwift

class FavoriteDB: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var price = 0
    @objc dynamic var thumbnailImage = ""
    var restrictions = List<RestrictionObject>()

    override static func primaryKey() -> String? {
        return "id"
    }
}

class RestrictionObject: Object {
    @objc dynamic var restriction: String = ""
}
