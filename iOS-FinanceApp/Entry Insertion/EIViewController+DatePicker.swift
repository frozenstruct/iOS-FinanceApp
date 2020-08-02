//
//  EI + DatePicker.swift
//  iOS-FinanceApp
//
//  Created by Dmitry Aksyonov on 29.06.2020.
//  Copyright © 2020 Dmitry Aksyonov. All rights reserved.
//

import Foundation
import UIKit

extension EIViewController {
    
    // MARK: - Date Picker & Toolbar
    
    func createDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.addTarget(
            self,
            action: #selector(datePickerValueChanged(for:)),
            for: .valueChanged
        )
        datePicker.backgroundColor = .white
    }
    
    func createDatePickerToolbar() {
        let todayButton = UIBarButtonItem(
            title: "Today",
            style: .plain,
            target: self,
            action: #selector(todayButtonPressed(sender :))
        )
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(doneButtonPressed(sender:))
        )
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: self,
            action: nil
        )
        
        toolBar = UIToolbar()
        toolBar.setItems(
            [todayButton, flexibleSpace, doneButton],
            animated: true
        )
        
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
    }
    
    // MARK: - Date Picker Methods
    
    @objc func datePickerValueChanged(for datePicker: UIDatePicker) {
        dateInputTextField.text = Helpers.createDateFormatter(
            dateStyle: .medium,
            timeStyle: .none)
            .string(from: datePicker.date)
    }
    
    @objc func todayButtonPressed(sender: UIBarButtonItem) {
        dateInputTextField.text = Helpers.createDateFormatter(
            dateStyle: .medium,
            timeStyle: .none)
            .string(from: Date())
        
        dateInputTextField.resignFirstResponder()
    }
    
    @objc func doneButtonPressed(sender: UIBarButtonItem) {
        dateInputTextField.resignFirstResponder()
    }
    
    func controllerDidWriteAndDismiss(input: Entry) {
        DataManager.createEntry(input)
        self.dismiss(
            animated: true,
            completion: flushTextFields
        )
    }
    
}
