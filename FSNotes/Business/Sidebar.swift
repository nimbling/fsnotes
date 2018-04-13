//
//  Sidebar.swift
//  FSNotes
//
//  Created by Oleksandr Glushchenko on 4/7/18.
//  Copyright © 2018 Oleksandr Glushchenko. All rights reserved.
//

import Foundation

class Sidebar {
    var list = [SidebarItem]()
    let storage = Storage.sharedInstance()
    
    init() {
        list = [
            SidebarItem(name: "Library", type: .Label),
            SidebarItem(name: "Notes", type: .All),
            SidebarItem(name: "Trash", type: .Trash),
        ]
        
        let rootProjects = storage.getRootProjects()
        for project in rootProjects {
            list.append(SidebarItem(name: project.label, project: project, type: .Label))
            let childProjects = storage.getChildProjects(project: project)
            for childProject in childProjects {
                list.append(SidebarItem(name: childProject.label, project: childProject, type: .Category))
            }
        }
    }
    
    func getList() -> [SidebarItem] {
        return list
    }
}
