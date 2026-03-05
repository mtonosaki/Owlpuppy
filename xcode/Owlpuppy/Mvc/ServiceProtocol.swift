//
//  ServiceProtocol.swift
//  Owlpuppy
//
//  Created by Manabu Tonosaki on 2026-03-05.
//


protocol ServiceProtocol {
    associatedtype ModelType: Decodable
    func service(model: ModelType) -> Bool
}
