//
//  EditLoverTableViewController.swift
//  AddData
//
//  Created by user_20 on 2018/1/12.
//  Copyright © 2018年 SHIH-YING PAN. All rights reserved.
//

import UIKit

class EditFriendTableViewController: UITableViewController, UINavigationControllerDelegate {
    
    var friend: Friend?
    
    @IBOutlet weak var imageOfView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var starTextField: UITextField!
    @IBOutlet weak var interestTextField: UITextField!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var innerSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let friend = friend {
            nameTextField.text = friend.name
            starTextField.text = friend.star
            interestTextField.text = friend.interest
            birthdayLabel.text = friend.birth
            innerSwitch.isOn = friend.innerBeauty
            //imageOfView.image = UIImage(named: friend.imageName)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        friend?.name = nameTextField.text ?? ""
        friend?.star = starTextField.text ?? ""
        friend?.interest = interestTextField.text ?? ""
        friend?.innerBeauty = innerSwitch.isOn
    }
}
