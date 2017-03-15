//
//  ViewController.swift
//  Socket.swift
//
//  Created by Draveness on 03/06/2017.
//  Copyright (c) 2017 Draveness. All rights reserved.
//

import UIKit
import Socket_swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let socket = Socket(host: "123.125.114.144")
        switch socket.connect() {
        case .success:
            let s = socket.read()
            print(s)
        default:
            print(1)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

