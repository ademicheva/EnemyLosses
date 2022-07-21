//
//  Alert.swift
//  EnemyLosses
//
//  Created by Алина on 21.07.2022.
//

import Foundation
import UIKit

struct Alert {
    
    private static func showAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        DispatchQueue.main.async {
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    static func showErrorValueAlert(on vc: UIViewController) {
        showAlert(on: vc, with: "WARNING", message: "There is no info on this day. Please, enter another day")
    }
}
