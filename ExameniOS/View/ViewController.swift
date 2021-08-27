//
//  ViewController.swift
//  ExameniOS
//
//  Created by Luis Zavaleta on 27/08/21.
//

import UIKit
import FirebaseStorage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }

    func initView() {
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.rowHeight = UITableView.automaticDimension
        self.tableview.estimatedRowHeight = 100
        self.tableview.register(UINib(nibName: Name_TVC.identifier, bundle: nil), forCellReuseIdentifier: Name_TVC.identifier)
        self.tableview.register(UINib(nibName: Photo_TVC.identifier, bundle: nil), forCellReuseIdentifier: Photo_TVC.identifier)
        self.tableview.register(UINib(nibName: DescriptiionText_TVC.identifier, bundle: nil), forCellReuseIdentifier: DescriptiionText_TVC.identifier)
        
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func sendImage(_: UIButton) {
        let index = IndexPath(row: 0, section: 0)
        let cell: Name_TVC = self.tableview.cellForRow(at: index) as! Name_TVC
        let name = cell.nameEdit.text
        
        if self.photoUser != nil {
            let storageRef = Storage.storage(url:"gs://exameniosdbrt.appspot.com/").reference()
            let data = self.photoUser.pngData()
            let riversRef = storageRef.child("\(name ?? "imageProfile").png")
            _ = riversRef.putData(data!, metadata: nil) { (metadata, error) in
              guard let metadata = metadata else {
                return
              }
                _ = metadata.size
              riversRef.downloadURL { (url, error) in
                guard url != nil else {
                  return
                }
              }
            }
        } else {
            let alert = UIAlertController(title: "Atención", message: "Se requiere tomar una foto para subir la imagen", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    var photoUser: UIImage!
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var name_field: UITextField!

}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Name_TVC.identifier, for: indexPath) as! Name_TVC
            cell.initCell()
            return cell
        } else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: Photo_TVC.identifier, for: indexPath) as! Photo_TVC
            cell.initCell()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptiionText_TVC.identifier, for: indexPath) as! DescriptiionText_TVC
            cell.initCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let optionMenu = UIAlertController(title: nil, message: "Selecciona una opción", preferredStyle: .actionSheet)
            
            let deleteAction = UIAlertAction(title: "Ver foto", style: .default, handler: { (action) -> Void in
                if self.photoUser != nil {
                    let viewController = PhotoViewController(nibName: "PhotoViewController", bundle: nil)
                    viewController.photoUser = self.photoUser
                    self.navigationController?.pushViewController(viewController, animated: true)
                } else {
                    let alert = UIAlertController(title: "Atención", message: "Se requiere tomar una foto para ver la imagen", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            })
            
            let saveAction = UIAlertAction(title: "Retomar/Tomar foto", style: .default, handler: { (action) -> Void in
                let vc = UIImagePickerController()
                vc.sourceType = .camera
                vc.allowsEditing = true
                vc.delegate = self
                self.present(vc, animated: true)
            })
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
            
            optionMenu.addAction(deleteAction)
            optionMenu.addAction(saveAction)
            optionMenu.addAction(cancelAction)
                
            self.present(optionMenu, animated: true, completion: nil)
        } else if indexPath.row == 2 {
            let viewController = GraphicsViewController(nibName: "GraphicsViewController", bundle: nil)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        self.photoUser = image
    }
}
