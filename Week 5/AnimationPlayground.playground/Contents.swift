//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white
        
        let square = UIView()
        
        square.frame = CGRect(x: 150, y: 250, width: 50, height: 50)
        square.backgroundColor = .blue
        
        view.addSubview(square)
        self.view = view
        
        //        UIView.animate(withDuration: 10, delay: 0, options: [.repeat, .autoreverse], animations:  {
        //            self.view.alpha = 0.5
        //
        //            square.backgroundColor = .red
        //            square.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        //        }) {(_) in
        //            square.frame =  CGRect(x: 150, y: 250, width: 50, height: 50)
        //            square.alpha = 1.0
        //            square.backgroundColor = .green
        //        }
        
        
        UIView.animate(withDuration: 2, delay: 0, options: [.repeat, .autoreverse], animations:  {
            
            self.view.alpha = 0.5
            square.backgroundColor = .red
            
            let affineScale = CGAffineTransform(scaleX: 2, y: 2)
            let affineRotate = CGAffineTransform(rotationAngle: .pi)
            let affineTranslate = CGAffineTransform(translationX: 50, y: 50)
            let combined = affineScale.concatenating(affineRotate).concatenating(affineTranslate)
            square.transform = combined
            
        })
    }
        
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
