//
//  ServerRepository.swift
//  Owlpuppy
//
//  Created by Manabu Tonosaki on 2026-03-05.
//


protocol ServerRepository {
    func start(callback: @escaping (HTTPRequest) -> HTTPResponse)
}
