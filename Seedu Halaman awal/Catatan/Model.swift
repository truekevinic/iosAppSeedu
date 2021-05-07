//
//  Model.swift
//  Seedu Halaman awal
//
//  Created by Kevin Leon on 14/04/21.
//

import CoreData

@objc(Bookmark)
class Bookmark : NSManagedObject{
    @NSManaged var bookmarkid: NSNumber!
    @NSManaged var id: NSNumber!
    @NSManaged var penjelasan: String!
    @NSManaged var title: String!
    @NSManaged var jawaban: String!
    @NSManaged var bookmarked: NSNumber!
    @NSManaged var tips: String!
    @NSManaged var image: String!
    @NSManaged var desc: String!
    @NSManaged var deletedDate: Date?
    
}
