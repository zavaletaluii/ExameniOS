//
//  Name_TVC.swift
//  ExameniOS
//
//  Created by Luis Zavaleta on 27/08/21.
//

import UIKit

class Name_TVC: UITableViewCell {
    static let identifier = "Name_TVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initCell() {
        self.nameEdit.text = ""
    }

    @IBOutlet weak var nameEdit: UITextField!
}
