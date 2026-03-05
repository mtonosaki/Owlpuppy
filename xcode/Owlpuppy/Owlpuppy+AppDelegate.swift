//
//  Owlpuppy+AppDelegate.swift
//  Owlpuppy
//
//  Created by Manabu Tonosaki on 2026-03-05.
//

import SwiftUI
import SwiftData

#if os(macOS)
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!
    var popover: NSPopover!
    var router: Router!
    var server: ServerRepository!
    
    var sharedModelContainer: ModelContainer!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        showIconOnMenuBar()
        startHttpServer()
    }
    
    func showIconOnMenuBar() {
        print("Owlpuppy: showing on menu bar.")
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let button = statusItem.button {
            button.image = NSImage(named: "MenuBarIcon")
            button.toolTip = "Owlpuppy"
            button.action = #selector(togglePopover)
            button.target = self
        }
        popover = NSPopover()
        popover.behavior = .transient
        
        let contentView = ContentView()
            .modelContainer(sharedModelContainer)
        popover.contentViewController = NSHostingController(rootView: contentView)
    }
    
    func startHttpServer() {
        do {
            self.server = try HttpServerRepository()
            self.router = Router(server: self.server, controllers: ControllerFactory.makeAllControllers())
        } catch {
            print("Failed to start HTTP server: \(error)")
        }
    }
    
    
    @objc func togglePopover() {
        if let button = statusItem.button {
            if popover.isShown {
                popover.performClose(nil)
            } else {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            }
        }
    }
}
#endif


