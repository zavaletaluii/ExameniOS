//
//  GraphicsDataViewModel.swift
//  ExameniOS
//
//  Created by Luis Zavaleta on 27/08/21.
//

import Foundation

class GraphicsDataViewModel: NSObject {
    var apiService: APIService!
    
    private(set) var data : CommentsPostResponse! {
        didSet {
            self.bindGraphicsData()
        }
    }
    
    var bindGraphicsData : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        self.callGraphicsData()
    }
    
    func callGraphicsData() {
        self.apiService.apiGetGraphicsData() { (data) in
            self.data = data
        }
    }
}
