//
//  AnyRouter.swift
//  VIPER Design Pattern Example
//
//  Created by DarkBringer on 12.10.2021.
//

import UIKit

typealias EntryPoint = UIViewController & AnyView

protocol  AnyRouter { //Common naming convention for protocols
    
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
    
}
