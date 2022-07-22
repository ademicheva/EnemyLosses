//
//  SplashViewController.swift
//  EnemyLosses
//
//  Created by Алина on 19.07.2022.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var progressVIew: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressVIew.trackTintColor = .white
        progressVIew.progressTintColor = .darkGray
        progressVIew.transform = CGAffineTransform(scaleX: 1, y: 4)
        progressVIew.setProgress(0, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.performSegue(withIdentifier: "main", sender: nil)
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.progressVIew.progress != 1 {
                self.progressVIew.progress += 0.25
            }
        }
    }
}
