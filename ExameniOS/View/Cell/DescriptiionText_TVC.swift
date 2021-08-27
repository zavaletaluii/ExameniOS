//
//  DescriptiionText_TVC.swift
//  ExameniOS
//
//  Created by Luis Zavaleta on 27/08/21.
//

import UIKit

class DescriptiionText_TVC: UITableViewCell {
    
    static let identifier = "DescriptiionText_TVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initCell() {
        self.description_text.text = "Una gráfica o representación gráfica es un tipo de representación de datos, generalmente numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que se manifieste visualmente la relación matemática o correlación estadística que guardan entre sí. También es el nombre de un conjunto de puntos que se plasman en coordenadas cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de elementos o signos que permiten la interpretación de un fenómeno. La representación gráfica permite establecer valores que no se han obtenido experimentalmente sino mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del intervalo experimental)."
        
//        self.description_text.translatesAutoresizingMaskIntoConstraints = true
//        self.description_text.sizeToFit()
        self.description_text.isScrollEnabled = false
    }
    
    @IBOutlet weak var description_text: UITextView!
    
}
