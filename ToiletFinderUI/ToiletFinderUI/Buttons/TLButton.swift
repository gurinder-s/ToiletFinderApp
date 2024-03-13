//
//  TLButton.swift
//  ToiletFinderUI
//
//  Created by Gurinder Singh on 13/03/2024.
//

import UIKit

public class TLButton: UIButton {
    
    public enum FontSize {
        case large
        case med
        case small
    }
    
    public init(title:String, hasbackground: Bool = false, fontSize:FontSize) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.backgroundColor = hasbackground ? .systemBlue : .clear
        
        let titleColor: UIColor = hasbackground ? .white : .systemBlue
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize{
        case .large:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        case .med:
            self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
