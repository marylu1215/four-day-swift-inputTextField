//
//  ViewController.swift
//  four-day-swift-inputTextField
//
//  Created by MacBook Pro on 2019/3/31.
//  Copyright © 2019年 MacBookPro. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController,UITextViewDelegate {
    var limitedTextView:UITextView!
    var allowInputNumberLabel:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
         self.view.backgroundColor = UIColor.white
        
       
        
        self.initNavigationBar()
        
        
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(note:)), name: NSNotification.Name.UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
         self.initInputField()
        
        
        
    }
   
    func initInputField() {
        let naviFrame = self.navigationController?.navigationBar.frame
        let statusBarFrame = UIApplication.shared.statusBarFrame
        let avatarImgView = UIImageView(frame: CGRect(x: 0, y: (naviFrame?.height)! + statusBarFrame.height + 10, width: 70, height: 70))
        avatarImgView.image = #imageLiteral(resourceName: "avatar.jpg")
        self.view.addSubview(avatarImgView)
        
        limitedTextView = UITextView(frame: CGRect(x: 80, y: avatarImgView.frame.height, width: self.view.frame.width - 70 - 20, height: 300))
        self.view.addSubview(limitedTextView)
        limitedTextView.delegate = self
        limitedTextView.font = UIFont.systemFont(ofSize: 20)
        
        allowInputNumberLabel = UILabel(frame: CGRect(x: self.view.frame.width - 50, y: self.view.frame.height - 40, width: 50, height: 40))
        self.view.addSubview(allowInputNumberLabel)
        allowInputNumberLabel.text = "140"
        allowInputNumberLabel.textAlignment = .right
    }
    
    
    
    @objc func keyboardWillChangeFrame(note: Notification) {
        let duration = note.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        let endFrame = (note.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let y = endFrame.origin.y
        
        //计算工具栏距离底部的间距
        let margin = UIScreen.main.bounds.height - y
        UIView.animate(withDuration: duration) {
            //            键盘弹出
            if margin > 0 {
                self.allowInputNumberLabel.frame.origin.y = self.allowInputNumberLabel.frame.origin.y - margin
            }
                //            键盘收起
            else {
                self.allowInputNumberLabel.frame.origin.y = self.view.frame.height - 40
            }
        }
        
    }
    
   
    
    
    
    
    
    func initNavigationBar() {

        
       
        let leftItem = UIBarButtonItem(title: "close", style: .plain, target: self, action: nil)
        
        self.navigationItem.leftBarButtonItem = leftItem
        
        let rightItem = UIBarButtonItem(title: "Tweet", style: .plain, target: self, action: nil)
        rightItem.tintColor = UIColor.green
        navigationItem.rightBarButtonItem = rightItem
        
        
        func textViewDidChange(_ textView: UITextView) {
            let currentCharactorCount = (textView.text?.characters.count)!
            if  currentCharactorCount >= 140 {
                limitedTextView.resignFirstResponder()
            }
            allowInputNumberLabel.text = "\(140 - currentCharactorCount)"
        }
      
        func keyboardWillChangeFrame(note: Notification) {
            let duration = note.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
            let endFrame = (note.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            let y = endFrame.origin.y
            
            //计算工具栏距离底部的间距
            let margin = UIScreen.main.bounds.height - y
            UIView.animate(withDuration: duration) {
                //            键盘弹出
                if margin > 0 {
                    self.allowInputNumberLabel.frame.origin.y = self.allowInputNumberLabel.frame.origin.y - margin
                }
                    //            键盘收起
                else {
                    self.allowInputNumberLabel.frame.origin.y = self.view.frame.height - 40
                }
            }
       
        }
        
        
    }
    
    

    
//    func textFieldDidEndEditing(textField: UITextField) {
//        print("5 textFieldDidEndEditing")
//    }
//
//    func textFieldDidBeginEditing(textField: UITextField) {
//        print("2 textFieldDidBeginEditing")
//    }
//

    

}

