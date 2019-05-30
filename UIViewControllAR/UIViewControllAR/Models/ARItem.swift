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
        let delay = SCNAction.wait(duration: 0.25)
        let rX = SCNAction.rotateBy(x: CGFloat.pi, y: 0, z: 0, duration: 1)
        let rY = SCNAction.rotateBy(x: 0, y: CGFloat.pi, z: 0, duration: 1)
        let rZ = SCNAction.rotateBy(x: 0, y: 0, z: CGFloat.pi, duration: 1)
        
        self.runAction(SCNAction.group([rX, .sequence([delay, .group([rY, .sequence([delay, rZ])])])]))
    }
    
    func destroy()  {
        //todo: implement destry action with "animation"
        guard let explosion = SCNParticleSystem(named: "Destroy", inDirectory: nil) else{
            return
        }
        self.addParticleSystem(explosion)
        self.runAction(.sequence([.fadeOut(duration: 0.5), .customAction(duration: 0, action: { (node, time) in
            self.removeAllParticleSystems()
        })]))
    }
    
    func reCreate()  {
        //todo: implement create action with "animation"
        guard let explosion = SCNParticleSystem(named: "ReCreate", inDirectory: nil) else{
            return
        }
        self.addParticleSystem(explosion)
        self.runAction(.sequence([.fadeIn(duration: 0.5), .customAction(duration: 0, action: { (node, time) in
            self.removeAllParticleSystems()
        })]))
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
