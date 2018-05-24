//
//  Quotes.swift
//  Quotes
//
//  Created by Tyler Boudreau on 2018-05-23.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

import Foundation

struct Quotes: Codable {
    var quoteAuthor: String?
    var quoteLink: String?
    var quoteText: String?
    var senderLink: String?
    var senderName: String?
}

struct Images: Codable {
    var data: Data?
}
