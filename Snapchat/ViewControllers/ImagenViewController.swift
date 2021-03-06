//
//  ImagenViewController.swift
//  Snapchat
//
//  Created by Marco Antonio Sotomayor Lopez on 28/05/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit
import Firebase
class ImagenViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var elegirContactoBoton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descripcionTextField: UITextField!
    var imagePicker = UIImagePickerController()
    var imagenID = NSUUID().uuidString
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        elegirContactoBoton.isEnabled = false

        // Do any additional setup after loading the view.
    }

    //override func didReceiveMemoryWarning() {
    //    super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
 //   }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        elegirContactoBoton.isEnabled = true
        imagePicker.dismiss(animated: true, completion: nil)
    }
    @IBAction func camaraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        present(imagePicker, animated:true, completion: nil)
    }
    
    @IBAction func elegirContactoTapped(_ sender: Any) {
        elegirContactoBoton.isEnabled = false
        let imagenesFolder = FIRStorage.storage().reference().child("imagenes")
        let imagenData = UIImageJPEGRepresentation(imageView.image!, 0.1)!
        
        imagenesFolder.child("\(imagenID).jpg").put(imagenData, metadata:nil, completion:{(metadata,error)in
            print("Intentando subir la imagen")
            if error != nil{
                print("Ocurrio un erro: \(String(describing: error))")
            }
            else{
                 self.performSegue(withIdentifier: "seleccionarContactoSegue", sender: metadata?.downloadURL()!.absoluteString)
            }
        })
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    let siguienteVC = segue.destination as! ElegirUsuarioViewController
        siguienteVC.imagenURL = sender as! String
        siguienteVC.descrip = descripcionTextField.text!
       siguienteVC.imagenID = imagenID
        
       
        
        //let imagenesFolder = FIRStorage.storage().reference().child("imagenes")
        //let imagenData = UIImagePNGRepresentation(imageView.image!)!
        
        //imagenesFolder.child("imagenes").put(imagenData, metadata: nil, completion://{(metadata,error)in
            //print("Intentando subir la imagen")
            //if error != nil{
           //     print("Ocurrio un error:\(String(describing: error))")
         //   }
            
       // })
    }
    
}
