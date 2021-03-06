//
//  ViewController.swift
//  iosdev-imesh
//
//  Created by Tharindu Randunu on 5/20/19.
//  Copyright © 2019 NIBM. All rights reserved.
//

import UIKit
import FirebaseUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        
        // Get the default auth UI object
        
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {
        // Log the error
            return
        }
        
        // Set ourselves as the delegate
        authUI?.delegate = self
        
        // Get a reference to the auth UI view controller
        let authViewController = authUI!.authViewController()
        
        // Show it
        present(authViewController, animated: true, completion: nil)
    }
    
}

extension ViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        // Check if there was an Error
        if error != nil {
            // Log the error
            return
        }
        // authDataResult?.user.uid
        
        performSegue(withIdentifier: "goHome", sender: self)
    }
    
    
   }

