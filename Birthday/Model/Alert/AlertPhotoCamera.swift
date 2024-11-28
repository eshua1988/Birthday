//
//  AlertPhotoCamera.swift
//  Birthday
//
//  Created by Olekssandr on 24/11/2024.
//

import UIKit

extension UIViewController {
    
    func alertPhotoCamera (complitionHandler: @escaping(UIImagePickerController.SourceType) -> Void) {
        let alertControler = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default) {_ in
            let camera = UIImagePickerController.SourceType.camera
            complitionHandler(camera)
            
        }
        let photoLibrary = UIAlertAction(title: "photoLibrary", style: .default) { _ in
            let photoLibrary = UIImagePickerController.SourceType.photoLibrary
            complitionHandler(photoLibrary)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        
        alertControler.addAction(camera)
        alertControler.addAction(photoLibrary)
        alertControler.addAction(cancel)
        present(alertControler, animated: true)
    }
}
