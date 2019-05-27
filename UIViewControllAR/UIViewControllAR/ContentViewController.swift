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
        let rec = UITapGestureRecognizer(target: self, action: #selector(ContentViewController.a))
        //vvvvvv does NOT work
        view.addGestureRecognizer(rec)
 
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        //label.addGestureRecognizer(rec)
//        label.center = view.center
//        label.font = UIFont.systemFont(ofSize: 50)
//        label.textColor = .red
//        label.text = "HAHAHA!"
        //view.addSubview(label)
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func changeColor(_ sender: Any) {
        print("W O R K I NG!!")
        if view.backgroundColor == .red{
            view.backgroundColor = .white
        }else{
            view.backgroundColor = .red
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(touches.first?.location(in: view) as Any)
    }
    
    //WORKS!! OwO
    @objc func a(sender: UITapGestureRecognizer) {
        print(sender.location(in: view))
    }
}
