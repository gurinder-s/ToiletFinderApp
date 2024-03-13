//
//  TLTextField.swift
//  ToiletFinderUI
//
//  Created by Gurinder Singh on 13/03/2024.
//

import UIKit

public class TLTextField: UITextField {

    enum TLTextFieldVariant{
        case regular
        case username
        case email
        case password
    }
    
    private let authFieldType: TLTextFieldVariant
    
    init(authFieldType: TLTextFieldVariant) {
        self.authFieldType = authFieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
