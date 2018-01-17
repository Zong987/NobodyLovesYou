//
//  AddLoverTableViewController.swift
//  AddData
//
//  Created by SHIH-YING PAN on 22/12/2017.
//  Copyright © 2017 SHIH-YING PAN. All rights reserved.
//

import UIKit

class AddFriendTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var isChangeImage = false
    
    @IBOutlet weak var headButton: UIButton!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        headButton.setBackgroundImage(info[UIImagePickerControllerOriginalImage] as? UIImage, for: .normal)
        isChangeImage = true
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func changePhotoButtonPressed(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        present(controller, animated: true, completion: nil)
        
    }
    var friend: Friend!
    
    @IBOutlet weak var innerBeautySwitch: UISwitch!
    
    @IBOutlet weak var starTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var interestTextField: UITextField!
    
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    func showAlert(message: String) {
        let controller = UIAlertController(title: "錯誤", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        guard let name = nameTextField.text, name.count > 0 else {
            
            showAlert(message: "請輸入名字")
            return false
        }
        
        guard let star = starTextField.text, star.count > 0 else {
            
            showAlert(message: "請輸入星座")

            return false
        }
        
        /*guard star == "aquarius" else {
            showAlert(message: "只能喜歡水瓶座")
            return false
        }*/
        
        guard let interest = interestTextField.text, interest.count > 0 else {
            
            showAlert(message: "請輸入興趣")
            
            return false
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let birth = formatter.string(from:birthDatePicker.date)
        
        guard innerBeautySwitch.isOn else {
            showAlert(message: "不夠宅是不行的!多看卡通")
            return false
        }
        
        var imageName: String?
        if isChangeImage {
            imageName = "\(Date().timeIntervalSinceReferenceDate)"
            let url = Friend.documentsDirectory.appendingPathComponent(imageName!)
            let data = UIImageJPEGRepresentation(headButton.backgroundImage(for: .normal)!, 0.9)
            
            try? data?.write(to: url)
        }

        
        friend = Friend(name: name, star: star, interest: interest, birth: birth, innerBeauty: innerBeautySwitch.isOn, imageName: imageName)
        
        return true 
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
      
    }
    

}
