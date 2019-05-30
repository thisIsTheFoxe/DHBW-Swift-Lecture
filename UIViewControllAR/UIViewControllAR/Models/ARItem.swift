//
//  ARItem.swift
//  UIViewControllAR
//
//  Created by Henrik Storch on 30.05.19.
//  Copyright © 2019 Henrik Storch. All rights reserved.
//

import ARKit

class ARItem: SCNNode{
    
    init(type: ItemTypes = ItemTypes.allCases.first!){
        super.init()
        self.geometry = type.getGeometry()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func changeType(to newType: ItemTypes){
        self.geometry = newType.getGeometry()
    }
    
    func rotate() {
        //TODO: test
        let delay = SCNAction.wait(duration: 0.1)
        let rX = SCNAction.rotateBy(x: CGFloat.pi, y: 0, z: 0, duration: 0.5)
        let rY = SCNAction.rotateBy(x: 0, y: CGFloat.pi, z: 0, duration: 0.5)
        let rZ = SCNAction.rotateBy(x: 0, y: 0, z: CGFloat.pi, duration: 0.5)
        
        self.runAction(SCNAction.group([rX, .sequence([delay, .group([rY, .sequence([delay, rZ])])])]))
    }
    
    func destroy()  {
        //TODO: implement destry action with "animation"
    }
    
    func reCreate()  {
        //TODO: implement destry action with "animation"
    }
    
}

enum ItemTypes: String, CaseIterable{
    case Box, Ball
    
    func getGeometry() -> SCNGeometry {
        switch self {
        case .Ball:
            return SCNSphere(radius: 0.5)
        case .Box:
            return SCNBox(width: 0.5, height: 0.5, length: 0.5, chamferRadius: 0)
        default:
            return SCNGeometry()
        }
    }
}
