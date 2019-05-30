//
//  ViewController.swift
//  UIViewControllAR
//
//  Created by Henrik Storch on 27.05.19.
//  Copyright © 2019 Henrik Storch. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    var vc: ItemViewController!
    var itemNode: ARItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scnV = ARSCNView(frame: view.frame)
        
        let storyboard = UIStoryboard(name: "ContentStoryboard", bundle: nil)
        guard let tempVC = storyboard.instantiateInitialViewController() as? ItemViewController else {
            return
        }
        itemNode = ARItem()
        itemNode.position = SCNVector3(0.5, 0, -1)
        scnV.scene.rootNode.addChildNode(itemNode)
        tempVC.item = itemNode
        vc = tempVC

        let plane = SCNPlane(width: 0.5, height: 0.5)
        plane.materials.first?.diffuse.contents = vc.view   //<-- this is the important line
        
        /*
        let cam = SCNNode()
        cam.position = SCNVector3(0, 0, 0)
        cam.camera = SCNCamera()
        
        pNore.position = SCNVector3(0, 0, -100)
         scnV.scene.rootNode.camera = cam.camera
         scnV.allowsCameraControl = true
        */
        
        let pNode = SCNNode(geometry: plane)
        pNode.position = SCNVector3(0, 0, -1)
        scnV.scene.rootNode.addChildNode(pNode)
        
        let config = ARWorldTrackingConfiguration()
        //config.planeDetection = [.horizontal, .vertical]
        scnV.session.run(config, options: [])
        view = scnV //if this get changed it might not work anymore..
        
        vc.view.layoutSubviews()    //update constraints
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
