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
    
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var cameraRollPreview: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    
    var imagePickerController = UIImagePickerController()
    
    var searchedImage: UIImage? = nil
    
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
    @IBAction func cancelButtonTapped(_ sender: Any) {
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func selectImageButtonTapped(_ sender: Any) {
        // When the user taps this button the image from the imageView will be sent to the API.
        guard let unwrappedImage = searchedImage else { return } 
        // When recieving data it will load the data in the detail view and navigate the user there.
        APIService().uploadImageToServer(imageToUpload: unwrappedImage)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if picker.sourceType == .photoLibrary {
            let capturedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
           cameraRollPreview?.image = capturedImage
            searchedImage = capturedImage
        } else {
            let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            capturedImage?.image = selectedImage
            searchedImage = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}
