//
//  ApiRemindController.swift
//  Owlpuppy
//
//  Created by Manabu Tonosaki on 2026-03-05.
//


import Foundation
import Network

class ApiRemindController: BaseController<EventKitRemindService> {
    override var method: HTTPMethod { .POST }
    override var path: String { "/api/v1/remind" }
}
