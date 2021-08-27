//
//  GraphicsViewController.swift
//  ExameniOS
//
//  Created by Luis Zavaleta on 27/08/21.
//

import UIKit

class GraphicsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }

    func initView() {
        self.viewModel = GraphicsDataViewModel()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.rowHeight = UITableView.automaticDimension
        self.tableview.estimatedRowHeight = 100
        self.tableview.register(UINib(nibName: Graphics_TVC.identifier, bundle: nil), forCellReuseIdentifier: Graphics_TVC.identifier)
        
        self.viewModel.bindGraphicsData = {
            self.graphicsData = self.viewModel.data
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
            
        }
    }

    var viewModel: GraphicsDataViewModel!
    var graphicsData: CommentsPostResponse!
    @IBOutlet weak var tableview: UITableView!
}

extension GraphicsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.graphicsData != nil {
            return self.graphicsData.questions.count
        } else {
            return 0
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Graphics_TVC.identifier, for: indexPath) as! Graphics_TVC
        if self.graphicsData != nil {
            cell.initCell(question: self.graphicsData.questions[indexPath.row], colors: self.graphicsData.colors)
        }
        return cell
    }
    
    
}
