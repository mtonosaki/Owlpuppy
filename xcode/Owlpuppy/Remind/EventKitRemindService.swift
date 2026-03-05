//
//  ApiRemindController.swift
//  Owlpuppy
//
//  Created by Manabu Tonosaki on 2026-03-05.
//


import Foundation

class EventKitRemindService: ServiceProtocol {
    // SINGLETON
    static let shared = EventKitRemindService()
    private init() {}
    
    func service(model: EventKitRemindModel) -> Bool {
        print("EventKitRemindServiceでリマインダーを登録します hoge = \(model.hoge)")
        return true
    }
}

