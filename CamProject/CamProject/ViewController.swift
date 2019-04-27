//
//  ViewController.swift
//  CamProject
//
//  Created by Deepashri Khawase on 27.04.19.
//  Copyright © 2019 Deep Yoga. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
var imagesArray :[UIImage] = []
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        collectionview.delegate = self
        collectionview.dataSource = self
        /*let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapButton))
        self.navigationItem.leftBarButtonItem = addButton
        let cameraButton_1 = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(tapButton))
        let cameraButton_2 = UIBarButtonItem(title: "Camera", style: .done , target: self , action: #selector(tapButton))
        self.navigationItem.rightBarButtonItem = cameraButton_1
        */
        
        // Do any additional setup after loading the view.
   

            //@objc func tapButton(){
             // print("you tap")
    }
    
    
    
    
    @IBAction func OpenCamera(_ sender: Any) {
        
        let picker:UIImagePickerController = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        //imagePickerController.delegate= self
         let actionSheet = UIAlertController(title: "photo source", message: "Choose a Source"
            , preferredStyle: .actionSheet)
       
        actionSheet.addAction(UIAlertAction(title: "PhotoLibrary", style: .default, handler: {(action:UIAlertAction)in picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
            
        }))
      
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action:UIAlertAction)in picker.sourceType = .camera
            self.present(picker, animated: true, completion: nil)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style:.cancel,handler: nil))
//        picker.delegate = self
//        picker.allowsEditing = false
        
        //picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        //
        //
        
        //picker.sourceType = .camera
        //picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
        //
//        self.present(picker, animated: true, completion: nil)
        self.present(actionSheet, animated: true, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
    //private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    guard let pickedimage = info[.originalImage] as? UIImage else {
    fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
    }
        print("before")
       print(imagesArray.count)
        imagesArray.append(pickedimage)
        //imagesArray = [pickedimage]
       print("after")
        
        print(imagesArray.count)
        
        //if let pickedimage = (info [UIImagePickerControllerOriginalImage] as? UIImage){
           // imagesArray = [pickedimage]
            
        //}
        collectionview.reloadData()
        dismiss(animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        //cell.imageView.image = UIImage(named: imagesArray[indexPath.row] )
        cell.configurecell(image: imagesArray[indexPath.row])
        
        return cell
        
    }
    
}




