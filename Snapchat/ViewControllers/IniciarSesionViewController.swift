//
//  iniciarSesionViewController.swift
//  Snapchat
//
//  Created by Marco Antonio Sotomayor Lopez on 21/05/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit
import Firebase

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func iniciarSesionTapped(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {(user, error) in
            print("Intentamos iniciar sesion")
            
            if error != nil {
                print("Tenemos el siguiente error \(String(describing: error))")
                print("Intentemos crear un usuario")
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {(user, error) in
                    if error != nil {
                        print("Tenemos el siguiente error \(String(describing: error))")
                    } else {
                        print("El usuario fue creado exitosamente")
                        FIRDatabase.database().reference().child("usuarios").child(user!.uid).child("email").setValue(user!.email)
                        
                        //Database.database().reference().child("usuarios").child(Auth.auth().currentUser!.uid).child("email").setValue(Auth.auth().currentUser?.email)
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
            }else{
                print("inicio se sesiòn exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        })
        
    }
    
}

