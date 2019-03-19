//
//  ViewController.swift
//  MA18IOs_graphics
//
//  Created by David Svensson on 2019-03-19.
//  Copyright © 2019 David Svensson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
        if let touch = touches.first {
            let point = touch.location(in: view)
                print(point)
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: view)
            print(point)
        }
    }
    

}

