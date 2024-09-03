//
//  ViewController.swift
//  NasaDailyPhoto
//
//  Created by Sheeraz on 9/3/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    let photoInfoController = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            
            if let photoInfo = photoInfo {
                self.updateUI(with: photoInfo)
            }
        }
    }
    
    
    func updateUI(with photoInfo: PhotoInfo) {
        
        let task = URLSession.shared.dataTask(with: photoInfo.url, completionHandler: {(data, response, error) in
            guard let data = data,
                  let image = UIImage(data: data) else { return }
   
    
        DispatchQueue.main.async {
            
            self.title = photoInfo.title
            self.imageView.image = image
            
            self.descriptionLabel.text = photoInfo.description
            
            if let copyright = photoInfo.copyright {
                self.copyrightLabel.text = "Copyright \(copyright)"
                
            } else {
                self.copyrightLabel.isHidden = true
            }
            
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            }
        }
    )

        // bravo
        task.resume()
    }
    
}
