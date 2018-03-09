//
//  InfoVC.swift
//  Social
//
//  Created by Tomas Giraldo on 3/9/18.
//  Copyright © 2018 Tomas Giraldo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage
import SwiftKeychainWrapper

class InfoVC: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var userImagePicker: UIImageView!
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var plusPhoto: UIButton!
    
    var imagePicker : UIImagePickerController?
    var imageSelected = false
    var userId : String?
    var username : String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker?.delegate = self
        imagePicker = UIImagePickerController()
        imagePicker?.allowsEditing = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: "uid" ){
            performSegue(withIdentifier: "toMessages", sender: nil)
        }
    }

    @IBAction func selectedImagePicker(_ sender: Any) {
        present(imagePicker!, animated: true, completion: nil)
        imagePicker.didfin
        userImagePicker.image = [UIImagePickerControllerOriginalImage] as? UIImage
 
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

        
    }
        
    
}
