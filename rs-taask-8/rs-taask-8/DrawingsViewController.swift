//
//  DrawingsViewController.swift
//  rs-taask-8
//
//  Created by Dzmitry Semenovich on 19.07.21.
//

import UIKit

class DrawingsViewController: UIViewController {

    var planet = UIButton()
    var head = UIButton()
    var tree = UIButton()
    var landscape = UIButton()
    
    var safeArea: UILayoutGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.safeArea = view.layoutMarginsGuide;
        setupView()
    }
    
    func setupView() {
        planet.layer.cornerRadius = 10
        planet.layer.borderWidth = 1
        planet.titleLabel?.text = "Planet"
        view.addSubview(planet)
        
        head.layer.cornerRadius = 10
        head.layer.borderWidth = 1
        head.titleLabel?.text = "Planet"
        view.addSubview(head)
        
        tree.layer.cornerRadius = 10
        tree.layer.borderWidth = 1
        tree.titleLabel?.text = "Planet"
        view.addSubview(tree)
        
        landscape.layer.cornerRadius = 10
        landscape.layer.borderWidth = 1
        landscape.titleLabel?.text = "Planet"
        view.addSubview(landscape)
        
        planet.translatesAutoresizingMaskIntoConstraints = false
        planet.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        planet.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        planet.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = true
        planet.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -88).isActive = true
        planet.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -513).isActive = true
        
        head.translatesAutoresizingMaskIntoConstraints = false
        head.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        head.topAnchor.constraint(equalTo: planet.bottomAnchor, constant: 15).isActive = true
        head.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = true
        head.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -88).isActive = true
        head.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -458).isActive = true
        
        tree.translatesAutoresizingMaskIntoConstraints = false
        tree.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tree.topAnchor.constraint(equalTo: head.bottomAnchor, constant: 15).isActive = true
        tree.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = true
        tree.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -88).isActive = true
        tree.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -403).isActive = true
        
        landscape.translatesAutoresizingMaskIntoConstraints = false
        landscape.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        landscape.topAnchor.constraint(equalTo: tree.bottomAnchor, constant: 15).isActive = true
        landscape.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = true
        landscape.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -88).isActive = true
        landscape.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -348).isActive = true
    }

}
