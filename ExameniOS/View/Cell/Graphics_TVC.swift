//
//  Graphics_TVC.swift
//  ExameniOS
//
//  Created by Luis Zavaleta on 27/08/21.
//

import UIKit
import Charts

class Graphics_TVC: UITableViewCell {
    
    static let identifier = "Graphics_TVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initCell(question: Question, colors: [String]) {
        self.colors = colors
        self.question_text.text = question.text
        customizeChart(question: question)
    }
    
    func customizeChart(question: Question) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<question.chartData.count {
            let dataEntry = PieChartDataEntry(value: Double(question.chartData[i].percetnage), label: question.chartData[i].text, data:  question.chartData[i].text as AnyObject)
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        pieChartDataSet.colors = self.colorsOfCharts(data: question, colorsString: self.colors)
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        graphics_view.data = pieChartData
    }
    
    func colorsOfCharts(data: Question, colorsString: [String]) -> [UIColor] {
        var colors: [UIColor] = []
        for i in 0..<data.chartData.count {
            let color = UIColor(hexString:colorsString[i])
            colors.append(color)
        }
        
        return colors
    }
    
    var colors: [String] = []
    
    @IBOutlet weak var graphics_view: PieChartView!
    @IBOutlet weak var question_text: UILabel!
    
}
