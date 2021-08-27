//
//  PhotoViewController.swift
//  ExameniOS
//
//  Created by Luis Zavaleta on 27/08/21.
//

import UIKit

class PhotoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.photoUser_ImageView.image = self.photoUser
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    var photoUser: UIImage!
    @IBOutlet weak var photoUser_ImageView: UIImageView!

}
