//
//  EventKitRemindModel.swift
//  Owlpuppy
//
//  Created by Manabu Tonosaki on 2026-03-05.
//

import Foundation

class RemindModel: ModelProtocol {
    let title: String
    let notes: String?
    let targetDate: Date
    
    init(title: String, notes: String?, targetDate: Date) {
        self.title = title
        self.notes = notes
        self.targetDate = targetDate
    }
}
