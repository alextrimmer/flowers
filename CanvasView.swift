//
//  CanvasView.swift
//  flowerFinal
//
//  Created by Nermin Dedovic on 3/14/20.
//  Copyright © 2020 Nermin Dedovic. All rights reserved.
//

import UIKit

class CanvasView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        

        if let context = UIGraphicsGetCurrentContext() {
            
            //GREEN STEM
            context.setStrokeColor(UIColor.green.cgColor)
            context.setFillColor(UIColor.green.cgColor)
            let rect6 = CGRect(x: 197, y: 200, width: 25, height: 260)
            context.fill(rect6)
            
        //LEAFS
            
            //TOP MIDDLE
            context.setFillColor(UIColor.yellow.cgColor)
            context.setStrokeColor(UIColor.black.cgColor)
            context.setLineWidth(2)
            let TM = CGRect(x: 180, y: 90, width: 60, height: 80)
            context.fillEllipse(in: TM)
            context.strokeEllipse(in: TM)
            
            context.saveGState()
            
            
            //BOTTOM LEFT LEAF
            let BL = CGRect(x: 270, y: 40, width: 60, height: 80)
            context.rotate(by: .pi / 4)
            context.fillEllipse(in: BL)
            context.strokeEllipse(in: BL)
            
            context.restoreGState()
            context.saveGState()
            
            
            
            
            //TOP RIGHT LEAF
            
            let TR = CGRect(x: 265, y: -120, width: 60, height: 80)
            
            
            context.rotate(by: .pi / 4)
            context.fillEllipse(in: TR)
            context.strokeEllipse(in: TR)
            
            context.restoreGState()
            context.saveGState()
            
            
            //TOP LEFT LEAF
            let TL = CGRect(x: -30, y: 185, width: 60, height: 80)
            
            
            context.rotate(by: (.pi / 4) * -1)
            context.fillEllipse(in: TL)
            context.strokeEllipse(in: TL)
            
            context.restoreGState()
            context.saveGState()
            
            //BOTTOM RIGHT LEAF
            let BR = CGRect(x: -30, y: 335, width: 60, height: 80)
            
            
            context.rotate(by: (.pi / 4) * -1)
            context.fillEllipse(in: BR)
            context.strokeEllipse(in: BR)
            
            context.restoreGState()
            //context.saveGState()
            
            
            
            
            
        
            
            //LEFT LEAF MID
            let LM = CGRect(x: 100, y: 180, width: 80, height: 60)
            context.fillEllipse(in: LM)
            context.strokeEllipse(in: LM)
            
            
            //RIGHT LEAF MID
            let RM = CGRect(x: 240, y: 180, width: 80, height: 60)
            context.fillEllipse(in: RM)
            context.strokeEllipse(in: RM)
            
            //BOTTOM LEAF MID
            let BM = CGRect(x: 180, y: 250, width: 60, height: 80)
            context.fillEllipse(in: BM)
            context.strokeEllipse(in: BM)
            
          
            
            
            
            
            
          
            
            //YELLOW CIRCLE
            //context.move(to: CGPoint(x: 180, y: 100))
            context.setStrokeColor(UIColor.black.cgColor)
            context.setFillColor(UIColor.yellow.cgColor)
            
            let rect3 = CGRect(x: 150, y: 150, width: 120, height: 120)
            context.fillEllipse(in: rect3)
            context.strokeEllipse(in: rect3)
            
            
            
           
            
            
            
            
            
            
            
        }
        
       
        
        
    }
    
    func deg2rad(_ number: CGFloat) -> CGFloat {
        return number * .pi / 180
    }
    

}
