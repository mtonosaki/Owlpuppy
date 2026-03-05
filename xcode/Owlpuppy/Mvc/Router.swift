//
//  Router.swift
//  Owlpuppy
//
//  Created by Manabu Tonosaki on 2026-03-05.
//


import Foundation
import Network

class Router {
    typealias Handler = (HTTPRequest) -> HTTPResponse
    private var routes: [String: Handler] = [:]
    private let server: ServerRepository
    
    init(server: ServerRepository, controllers: [Controller]) {
        self.server = server
        controllers.forEach { controller in
            register(method: controller.method, path: controller.path, handler: controller.request )
        }
        self.server.start(callback: handleRequest)
    }
    
    func handleRequest(_ request: HTTPRequest) -> HTTPResponse {
        let key = "\(request.method.rawValue) \(request.path)"
        guard let hander = self.routes[key] else {
            return HTTPResponse(statusCode: 404, body: "")
        }
        return hander(request)
    }
    
    func register(method: HTTPMethod, path: String, handler: @escaping Handler) {
        let key = "\(method.rawValue) \(path)"
        routes[key] = handler
        print("Route registered: \(key)")
    }
}
