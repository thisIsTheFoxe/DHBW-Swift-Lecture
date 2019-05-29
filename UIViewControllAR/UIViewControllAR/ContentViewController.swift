//
//  ContentViewController.swift
//  UIViewControllAR
//
//  Created by Henrik Storch on 27.05.19.
//  Copyright © 2019 Henrik Storch. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .yellow
        //view.backgroundColor = .blue
        
        //DO NOT TOUCH THOSE TWO LINES! Without them the touches methods won't be called!
        let rec = UITapGestureRecognizer(target: self, action: #selector(ContentViewController.a))
        view.addGestureRecognizer(rec)
    }

    
    @IBAction func changeColor(_ sender: Any) {
        //testing if touch is working
        print("W O R K I NG!!")
        if view.backgroundColor == .red{
            view.backgroundColor = .white
        }else{
            view.backgroundColor = .red
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //should be called if touched
        //print("Began",touches.first?.location(in: view) as Any)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("Move",touches.first?.location(in: view) as Any)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("End",touches.first?.location(in: view) as Any)
    }
    
    @objc func a(sender: UITapGestureRecognizer) {
        //doesn't actually do anything.. but it won't work without the recognizer
        print(sender.location(in: view))
    }
 
}
