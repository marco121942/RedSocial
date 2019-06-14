//
//  VerSnapViewController.swift
//  Snapchat
//
//  Created by Marco Antonio Sotomayor Lopez on 11/06/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class VerSnapViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var snap = Snap()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
      label.text? = snap.descrip
    imageView.sd_setImage(with: URL(string: snap.imagenURL))
    }
    override func viewWillDisappear(_ animated: Bool) {
        FIRDatabase.database().reference().child("usuarios").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").child(snap.id).removeValue()
        FIRStorage.storage().reference().child("imagenes").child("\(snap.imagenID).jpg").delete{(error) in
        print("se elimino la imagen correctamente")
        }
        
    }
}
