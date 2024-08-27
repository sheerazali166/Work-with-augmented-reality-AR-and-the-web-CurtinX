//
//  ViewController.swift
//  TheImageApp
//
//  Created by Sheeraz on 8/27/24.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func shareButtonTapped(_ sender: UIButton) {
        
        print("shareButtonTapped")
        
        // 1
        guard let image = imageView.image
            else { return }
        
        // 2
        let uiActivityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        // 3
        uiActivityViewController.popoverPresentationController?.sourceView = sender
        
        // 4
        present(uiActivityViewController, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func safariButtonTapped(_ sender: UIButton) {
        
        print("safariButtonTapped")
    
      
        if let url = URL(string: "https://www.curtin.edu.au") {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
            
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        
        print("cameraButtonTapped")
    
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in print("Camera was selected")} )
        
        // let photoLibraryAction = UIAlertAction(title: "Photo Libray", style: .default, handler: { action in print("Photo library was selected") })
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
                action in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)})
            
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let photoLibraryAction = UIAlertAction(title: "Photo library", style: .default, handler: {
                action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            
            alertController.addAction(photoLibraryAction)
        }
        
        alertController.addAction(cancelAction)
        // alertController.addAction(cameraAction)
        // alertController.addAction(photoLibraryAction)
        
        
        alertController.popoverPresentationController?.sourceView = sender
        
        present(alertController, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = selectedImage
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        
        print("emailButtonTapped")
        
        if !MFMailComposeViewController.canSendMail() {
            print("can not send mail")
            return
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients(["Taylor@swift.com"])
        mailComposer.setSubject("Testing for you Taylor Swift")
        mailComposer.setMessageBody("Hello, Taylor!", isHTML: false)
        
        present(mailComposer, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: (any Error)?) {
        
        dismiss(animated: true, completion: nil)
    }
    
}

