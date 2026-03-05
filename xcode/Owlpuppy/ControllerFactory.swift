//
//  ControllerFactory.swift
//  Owlpuppy
//
//  Created by Manabu Tonosaki on 2026-03-05.
//

class ControllerFactory {
    static func makeAllControllers() -> [Controller] {
        return [
            ApiRemindController(service: EventKitRemindService.shared),
        ]
    }
}
