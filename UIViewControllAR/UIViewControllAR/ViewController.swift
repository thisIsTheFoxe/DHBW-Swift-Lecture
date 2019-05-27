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

    @IBOutlet var sceneView: ARSCNView!
    var vc: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "ContentVC")

        
        let plane = SCNPlane(width: 0.5, height: 0.5)
        plane.materials.first?.diffuse.contents = vc.view
        
        /*
        let cam = SCNNode()
        cam.position = SCNVector3(0, 0, 0)
        cam.camera = SCNCamera()
        
        pNore.position = SCNVector3(0, 0, -100)
         scnV.scene.rootNode.camera = cam.camera
         scnV.allowsCameraControl = true
        */
        
        let pNore = SCNNode(geometry: plane)
        let scnV = ARSCNView(frame: view.frame)
        scnV.session.run(ARWorldTrackingConfiguration(), options: [])
        scnV.scene.rootNode.addChildNode(pNore)
        
        //DON'T SET THE LIVE VIEW TO ANYTHING ELSE!! EVER!!!! JUST CRAMP EVERYTHING INTO THE FREAKIN LIVEVIEW.SWIFT AND PRETEND U DONT CARE!!!! WTF PG?!?
        //actually I have no freakin' idea anymore pls help me quit lif naoo....
        view = scnV
        
        vc.view.layoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        //let configuration = ARWorldTrackingConfiguration()
        //configuration.planeDetection = [.horizontal]
        
        // Run the view's session
        //sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        //sceneView.session.pause()
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
