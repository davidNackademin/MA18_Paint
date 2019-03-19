//
//  ViewController.swift
//  MA18IOs_graphics
//
//  Created by David Svensson on 2019-03-19.
//  Copyright © 2019 David Svensson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvas: UIImageView!
    
    var start: CGPoint?
    var paintColor = UIColor.magenta.cgColor
    
    var lineWidth: CGFloat = 5
    let maxLineWidth: CGFloat = 15
    let minLineWidth: CGFloat = 2
    let deltaLineWidth: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            start = touch.location(in: canvas)
                //print(point)
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let end = touch.location(in: canvas)
            if let start = self.start {
                drawFromPoint(start: start, toPoint: end)
            }
            self.start = end
        }
    }
    
    func drawFromPoint(start: CGPoint, toPoint end: CGPoint){
        UIGraphicsBeginImageContext(canvas.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            
            // ta den bild som finns i imageview och rita dess innehåll till contexten
            canvas.image?.draw(in: CGRect(x: 0, y:0,
                                         width: canvas.frame.size.width,
                                         height: canvas.frame.size.height))
            
            
            
            // rita en ny linje från senaste uppritningen till var fingret är nu
            context.setStrokeColor(paintColor)
            context.setLineWidth(lineWidth)
            context.setLineCap(.round)
            context.beginPath()
            context.move(to: start)
            context.addLine(to: end)
            context.strokePath()
            
            
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            canvas.image = newImage
            
            
        }
        
        
        
        
    }
    
    @IBAction func increaseLineWidth(_ sender: UIBarButtonItem) {
        if lineWidth < maxLineWidth - deltaLineWidth {
            lineWidth += deltaLineWidth
        }
    }
    
    @IBAction func decreaseLineWidth(_ sender: UIBarButtonItem) {
        if lineWidth > minLineWidth + deltaLineWidth {
            lineWidth -= deltaLineWidth
        }
    }
    
    @IBAction func resetImage(_ sender: UIBarButtonItem) {
        
        
        canvas.image = nil
        
    }
    @IBAction func setColor(_ sender: UIBarButtonItem) {
        paintColor = (sender.tintColor?.cgColor)!
    }
}

