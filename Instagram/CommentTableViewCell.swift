//
//  CommentTableViewCell.swift
//  Instagram
//
//  Created by KUNI K on 2019/04/08.
//  Copyright © 2019 QQ201901. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var existingCommnetLabel: UILabel!
    @IBOutlet weak var commnetText: UITextField!
    @IBOutlet weak var commnetCancelButton: UIButton!
    @IBOutlet weak var commnetAddButton: UIButton!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setPostData(_ postData: PostData) {
        //課題
        if postData.comment != nil{
            self.existingCommnetLabel.text = "\(postData.comment!)"      //課題
        }
        
    }
    
}
