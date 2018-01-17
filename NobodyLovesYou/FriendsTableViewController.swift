//
//  LoversTableViewController.swift
//  AddData
//
//  Created by SHIH-YING PAN on 22/12/2017.
//  Copyright © 2017 SHIH-YING PAN. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    var friends = [Friend]()
    
    @IBOutlet weak var friendNumberLabel: UILabel!
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        friends.remove(at: indexPath.row)
        Friend.saveToFile(friends: friends)
        tableView.reloadData()
        
    }
    
    @IBAction func goBackToFriendsTableViewController(segue: UIStoryboardSegue) {
        if let controller = segue.source as? AddFriendTableViewController {
            friends.append(controller.friend)
            Friend.saveToFile(friends: friends)
            tableView.reloadData()
            
        }
        
    }
    
    @IBAction func unwindToFriendsPage(segue: UIStoryboardSegue) {
        let source = segue.source as? EditFriendTableViewController
        if let friend = source?.friend, let row = tableView.indexPathForSelectedRow?.row {
            friends[row] = friend
            Friend.saveToFile(friends: friends)
            tableView.reloadData()
            //nameLabel[row].text = lover.name
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "邊緣人的日常"))
        self.tableView.backgroundView?.alpha = 0.1
        
        if let friends = Friend.readFriendsFromFile() {
            self.friends = friends
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let friendNumber = friends.count
        if friendNumber == 0 {
            friendNumberLabel.text = "朋友數:" + String(friendNumber) + "  你沒有朋友，好可憐QQ"
        }
        else if friendNumber > 0 && friendNumber <= 5 {
            friendNumberLabel.text = "朋友數:" + String(friendNumber) + "  你竟然開始有朋友，珍奶假的？！"
        }
        else if friendNumber > 5 && friendNumber <= 10 {
            friendNumberLabel.text = "朋友數：" + String(friendNumber) + "  你朋友越來越多了，邊緣人叛徒！！！"
        }
        else {
            friendNumberLabel.text = "朋友數：" + String(friendNumber) + "  叛徒叛徒叛徒，我也好想有朋友喔ＱＱ"
        }
        
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "loverCell", for: indexPath) as? FriendTableViewCell else  {
            assert(false)
        }

        // Configure the cell...
        let friend = friends[indexPath.row]
        cell.nameLabel.text = friend.name
        cell.interestLabel.text = friend.interest
        cell.birthdayLabel.text = friend.birth
        cell.imageView?.image = friend.image
        
        
        return cell
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let editFriendTableViewController = segue.destination as? EditFriendTableViewController, let row = tableView.indexPathForSelectedRow?.row {
            editFriendTableViewController.friend = friends[row]
        }
    }
    

}
