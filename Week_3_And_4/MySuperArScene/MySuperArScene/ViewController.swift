//
//  ViewController.swift
//  MySuperArScene
//
//  Created by Sheeraz on 9/1/24.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var podiumAdded = false
    
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
        
        
        if !podiumAdded {
            
            let touchLocation = sender.location(in: sceneView)
            
            guard let raycastQuery = sceneView.raycastQuery(from: touchLocation, allowing: .estimatedPlane, alignment: .vertical) else { return }
            
            if let result = sceneView.session.raycast(raycastQuery).first {
                createPodium(arRaycastResult: result)
            }
            
            podiumAdded = true
            
        } else {
            
            createBall()
        }

                
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        // let scene = SCNScene(named: "art.scnassets/Podium.scn")!
        
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
        // Set the scene to the view
        // sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // configuration.planeDetection = [.horizontal]
        configuration.planeDetection = [.vertical]
        
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    func createFloor(planeAnchor: ARPlaneAnchor) -> SCNNode {
        
        let node = SCNNode()
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        node.geometry = plane
        node.eulerAngles.x = -Float.pi / 2
        node.opacity = 0.5
        
        return node
        
    }
    // TODO:
    /*
    func createPodium(planeAnchor: ARPlaneAnchor) -> SCNNode {
        
        let node = SCNScene(named: "art.scnassets/Podium.scn")!.rootNode.clone()
        
        node.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
    
        return node
        
    }
    */
    
    func createPodium(arRaycastResult: ARRaycastResult) {
        
        let podiumScene = SCNScene(named: "art.scnassets/Podium.scn")!
        let podiumNode = podiumScene.rootNode
        let planePosition = arRaycastResult.worldTransform.columns.3
        
        podiumNode.position = SCNVector3(planePosition.x, planePosition.y, planePosition.z)
        podiumNode.physicsBody = SCNPhysicsBody(type: .static, shape: SCNPhysicsShape(node: podiumNode))
        
        sceneView.scene.rootNode.addChildNode(podiumNode)
        
    }
    
    func createBall() {
        
        guard let currentFrame = sceneView.session.currentFrame else { return }
        
        let ball = SCNNode(geometry: SCNSphere(radius: 0.125))
        ball.geometry?.firstMaterial?.diffuse.contents = UIColor.cyan
        let cameraTransform = SCNMatrix4(currentFrame.camera.transform)
        ball.transform = cameraTransform
        
        let physicsBody = SCNPhysicsBody(type: .dynamic, shape: SCNPhysicsShape(node: ball))
        
        let power = Float(10.0)
        // force to force force will never accept herself as abandoned currupt wife
        let force = SCNVector3(-cameraTransform.m31 * power, -cameraTransform.m32 * power, -cameraTransform.m33 * power)
        
        ball.physicsBody = physicsBody
        ball.physicsBody?.applyForce(force, asImpulse: true)
        sceneView.scene.rootNode.addChildNode(ball)
        
    }
    
    
    // i don't fuck any or many
    func renderer(_ renderer: any SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        guard let planeAnchor = anchor as? ARPlaneAnchor else {
            return
        }
        
        print("Plane detected")
        let floor = createFloor(planeAnchor: planeAnchor)
        
        node.addChildNode(floor)
        
        // let podium = createPodium(planeAnchor: planeAnchor)
        // node.addChildNode(podium)
    
    }
    
    func renderer(_ renderer: any SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        
        DispatchQueue.main.async {

            guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
            
            for node in node.childNodes {
                node.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
                
                if let plane = node.geometry as? SCNPlane {
                    plane.width = CGFloat(planeAnchor.extent.x)
                    plane.height = CGFloat(planeAnchor.extent.z)
                }
            }
        }
        

        
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
