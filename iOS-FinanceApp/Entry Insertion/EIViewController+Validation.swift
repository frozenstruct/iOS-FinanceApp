//
//  EI + Validation.swift
//  iOS-FinanceApp
//
//  Created by Dmitry Aksyonov on 29.06.2020.
//  Copyright © 2020 Dmitry Aksyonov. All rights reserved.
//

import Foundation
extension EIViewController {
    
    func validateUserInput() throws {
        let validator = TextValidation()
        
        //MARK: - Validate Name Field
        
        guard !nameInputTextField.text!.isEmpty else {
            self.present(
                Helpers
                    .createAlertController(
                        with: Helpers.alertData[0][0],
                        message: Helpers.alertData[0][1],
                        and: .alert
                ),
                animated: true,
                completion: nil
            )
            throw ValidationErrors.nameIsEmpty
        }
        
        guard TextValidation.inputIsValidated(
            input: nameInputTextField.text!,
            pattern: validator.regExes["alphaNumericRegEx"]!
            ) else {
                self.present(
                    Helpers
                        .createAlertController(
                            with: Helpers.alertData[1][0],
                            message: Helpers.alertData[1][1],
                            and: .alert
                    ),
                    animated: true,
                    completion: nil
                )
                throw ValidationErrors.nameMismatch
        }
        
        //MARK: - Validate Amount Field
        
        guard !amntInputTextField.text!.isEmpty else {
            self.present(
                Helpers
                    .createAlertController(
                        with: Helpers.alertData[2][0],
                        message: Helpers.alertData[2][1],
                        and: .alert
                ),
                animated: true,
                completion: nil
            )
            throw ValidationErrors.amntIsEmpty
        }
        
        guard TextValidation.inputIsValidated(
            input: amntInputTextField.text!,
            pattern: validator.regExes["numericRegEx"]!
            ) else {
                self.present(
                    Helpers
                        .createAlertController(
                            with: Helpers.alertData[3][0],
                            message: Helpers.alertData[3][1],
                            and: .alert
                    ),
                    animated: true,
                    completion: nil
                )
                throw ValidationErrors.amntMismatch
        }
        
        //MARK: - Validate Category Field
        
        guard !categoryInputTextField.text!.isEmpty else {
            self.present(
                Helpers
                    .createAlertController(
                        with: Helpers.alertData[6][0],
                        message: Helpers.alertData[6][1],
                        and: .alert
                ),
                animated: true,
                completion: nil
            )
            throw ValidationErrors.categoryIsEmpty
        }
        
        guard TextValidation.inputIsValidated(
            input: categoryInputTextField.text!,
            pattern: validator.regExes["alphaNumericRegEx"]!
            ),
            pickerData.contains(categoryInputTextField.text!) else {
                self.present(
                    Helpers
                        .createAlertController(
                            with: Helpers.alertData[7][0],
                            message: Helpers.alertData[7][1],
                            and: .alert
                    ),
                    animated: true,
                    completion: nil
                )
                throw ValidationErrors.categoryMismatch
        }
    }
    
}
