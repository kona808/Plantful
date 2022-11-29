//
//  PictureCaptureViewController.swift
//  Plantful
//
//  Created by Jacob Perez on 11/17/22.
//

import UIKit

class PictureCaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var cameraRollButton: UIButton!
    @IBOutlet weak var capturedImage: UIImageView!
    
    @IBOutlet weak var cameraRollPreview: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    
    var imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
//        checkPermissions()
    }
    
    // MARK: - Actions
    
    @IBAction func cameraRollButtonTapped(_ sender: Any) {
        self.imagePickerController.sourceType = .photoLibrary
        self.present(self.imagePickerController, animated: true, completion: nil)
    }
    @IBAction func cameraButtonTapped(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
        
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if picker.sourceType == .photoLibrary {
           cameraRollPreview?.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        } else {
            capturedImage?.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
