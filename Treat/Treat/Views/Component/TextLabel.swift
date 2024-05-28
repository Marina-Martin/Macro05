//
//  TextLabel.swift
//  Treat
//
//  Created by Marina Martin on 27/05/24.
//

import UIKit

class TextLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    init(text: String) {
        super.init(frame: .zero)
        
        setLabel()
        
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabel(){
        self.text = "Nome da atividade"
        self.textColor = UIColor(named: "AppWhite")
        self.font = UIFont(name: "RadioCanada-Regular_bold", size: 20)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
