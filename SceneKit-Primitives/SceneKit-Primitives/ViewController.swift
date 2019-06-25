//
//  ViewController.swift
//  SceneKit-Primitives
//
//  Created by Erin Vincent on 6/10/19.
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
        
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/campus.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
        
        sceneView.autoenablesDefaultLighting = true
        
     
        for index in 1...10 {
            loadTree(x: Double(index) + 0.020, z: 2)
        }
        
    }
    
    func loadTree(x: Double, z: Double) {
        let trunkNode = SCNNode()
        
        let trunkGeometry = SCNCylinder(radius: 0.05, height: 0.5)
        
        trunkGeometry.firstMaterial?.diffuse.contents = UIColor.brown
        
        trunkNode.geometry = trunkGeometry
        
        let trunkPosition = SCNVector3(x, 0, z)
        
        trunkNode.position = trunkPosition
        
        sceneView.scene.rootNode.addChildNode(trunkNode)
        
        let crownNode = SCNNode()
        
        let crownGeometry = SCNSphere(radius: 0.2)
        crownGeometry.firstMaterial?.diffuse.contents = UIColor.green
        crownNode.geometry = crownGeometry
        
        let crownPosition = SCNVector3(0.0, 0.25, 0.0)
        crownNode.position = crownPosition
        
        trunkNode.addChildNode(crownNode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
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
