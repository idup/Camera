//
//  ViewController.swift
//  CameraDemo
//
//  Created by  Harold LIU on 12/14/15.
//  Copyright © 2015  Harold LIU. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    let imagePicker = UIImagePickerController()

    @IBOutlet weak var originImgView: UIImageView!
    @IBOutlet weak var editImgView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }

 
    @IBAction func openCamera() {
        
        let optionMenu = UIAlertController(title: nil, message: "您想从哪里获得照片呢?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let photoLibraryOption = UIAlertAction(title: "照片⛵️", style: UIAlertActionStyle.Default, handler: { (alert: UIAlertAction!) -> Void in
            // 弹出 照片库
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .PhotoLibrary
            self.imagePicker.modalPresentationStyle = .Popover
            self.presentViewController(self.imagePicker, animated: true, completion: nil)

        })
        let cameraOption = UIAlertAction(title: "相机📷", style: UIAlertActionStyle.Default, handler: { (alert: UIAlertAction!) -> Void in
          
            //弹出 相机
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .Camera
            self.imagePicker.modalPresentationStyle = .Popover
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
            
        })
        let cancelOption = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            //取消
            self.dismissViewControllerAnimated(true, completion: nil)
        })
        
   
        optionMenu.addAction(photoLibraryOption)
        optionMenu.addAction(cancelOption)
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) == true {
            optionMenu.addAction(cameraOption)} else {
            print ("I don't have a camera.")
        }
        
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
    }

    
    //MARK-: UIImagePickerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        print("finished picking image")
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //handle media here i.e. do stuff with photo
        
        print("imagePickerController called")
        
        let originImg = info[UIImagePickerControllerOriginalImage] as! UIImage
        originImgView.image = originImg
        
        let editImg = info[UIImagePickerControllerEditedImage] as! UIImage
        editImgView.image = editImg
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        //what happens when you cancel
        //which, in our case, is just to get rid of the photo picker which pops up
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}

