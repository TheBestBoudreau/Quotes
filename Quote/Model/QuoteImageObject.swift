//
//  QuoteImageObject.swift
//  Quotes
//
//  Created by Tyler Boudreau on 2018-05-23.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

import Foundation
import RealmSwift

class QuoteImageObject: Object{
    @objc dynamic var realmAuthor: String?
    @objc dynamic var realmText: String?
    @objc dynamic var realmImage: Data?
    @objc dynamic var realmLink: String?
    @objc dynamic var realmSenderLink: String?
    @objc dynamic var realmSenderName: String?
}
