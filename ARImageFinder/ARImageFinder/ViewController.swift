//
//  ViewController.swift
//  ARImageFinder
//
//  Created by Erin Vincent on 6/17/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil)!
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = referenceImages

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        
        switch anchor {
        case let imageAnchor as ARImageAnchor:
            nodeAdded(node, for: imageAnchor)
            
            let referenceImage = imageAnchor.referenceImage
            let plane = SCNPlane(width: referenceImage.physicalSize.width, height: referenceImage.physicalSize.height)
            plane.firstMaterial?.diffuse.contents = UIColor.blue
            let planeNode = SCNNode(geometry: plane)
            planeNode.opacity = 0.25
            node.addChildNode(planeNode)
        case let planeAnchor as ARPlaneAnchor:
            nodeAdded(node, for: planeAnchor)
        default:
            print("An anchor was discovered, but it is not for planes or images.")
        }
        
       
        
        
        
    }
    
    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func nodeAdded(_ node: SCNNode, for imageAnchor: ARImageAnchor) {
        
    }
    
    func nodeAdded(_ node: SCNNode, for planeAnchor: ARPlaneAnchor) {
        
    }
    
    

    
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
