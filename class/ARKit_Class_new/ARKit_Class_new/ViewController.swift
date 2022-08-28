//
//  ViewController.swift
//  ARKit_Class_new
//
//  Created by 林峻霆 on 2022/6/6.
//
import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    var dragonNode: SCNNode?
    var SwordNode: SCNNode?
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
        let dragonScene = SCNScene(named: "art.scnassets/ARKit_Class_Model.scn")
        dragonNode = dragonScene?.rootNode
        
        let SwordScene = SCNScene(named: "art.scnassets/Handgun.scn")
        SwordNode = SwordScene?.rootNode
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARImageTrackingConfiguration()
        
        if let trackingImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main){
            configuration.trackingImages = trackingImages
            configuration.maximumNumberOfTrackedImages = 2
        }
        
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor : ARAnchor) -> SCNNode?{
        
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor{
            let size = imageAnchor.referenceImage.physicalSize
            let plane = SCNPlane(width: size.width, height: size.height)
            plane.firstMaterial?.diffuse.contents = UIColor.white.withAlphaComponent(0.5)
            plane.cornerRadius = 0.005
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
            node.addChildNode(planeNode)
            
            var shapeNode: SCNNode?

            switch imageAnchor.referenceImage.name{
            case "ARKit_Class_QRCode":
                shapeNode = dragonNode
            case "QRcode":
                shapeNode = SwordNode
            default:
                break

            }
//            if imageAnchor.referenceImage.name == "ARKit_Class_QRCode"{
//                shapeNode = dragonNode
//            }else{
//                shapeNode = SwordNode
//            }

//            if imageAnchor.referenceImage.name == "QRcode"{
//                shapeNode = SwordNode
//            }

            let shapeSpin = SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 10)
            let repeatSpin = SCNAction.repeatForever(shapeSpin)
            shapeNode?.runAction(repeatSpin)

            guard let shape = shapeNode else { return nil }
            node.addChildNode(shape)
            


        }
        
        return node
        
    }

}
