//
//  FOViewController+Constraints.swift
//  iOS-FinanceApp
//
//  Created by Dmitry Aksyonov on 03.08.2020.
//  Copyright © 2020 Dmitry Aksyonov. All rights reserved.
//

import Foundation

extension FOViewController {
    
    func constrain() {
        currentBalanceLabel
            .translatesAutoresizingMaskIntoConstraints = false
        currentBalanceTitle
            .translatesAutoresizingMaskIntoConstraints = false
        topStackView
            .translatesAutoresizingMaskIntoConstraints = false
        breakdownLabel
            .translatesAutoresizingMaskIntoConstraints = false
        pivotTableView
            .translatesAutoresizingMaskIntoConstraints = false
        addEntryButton
            .translatesAutoresizingMaskIntoConstraints = false
        
    
        currentBalanceTitle.centerXAnchor.constraint(
            equalTo: view.centerXAnchor)
            .isActive = true
        currentBalanceTitle.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 40)
            .isActive = true
        
        currentBalanceLabel.centerXAnchor.constraint(
            equalTo: view.centerXAnchor)
            .isActive = true
        currentBalanceLabel.topAnchor.constraint(
            equalTo: currentBalanceTitle.bottomAnchor,
            constant: 30)
            .isActive = true
        
        topStackView.centerXAnchor.constraint(
            equalTo: view.centerXAnchor)
            .isActive = true
         topStackView.topAnchor.constraint(
            equalTo: currentBalanceLabel.bottomAnchor,
            constant: 30)
            .isActive = true
        
        breakdownLabel.topAnchor.constraint(
            equalTo: topStackView.bottomAnchor,
            constant: 50)
            .isActive = true
        breakdownLabel.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
            constant: 31)
            .isActive = true
        
        pivotTableView.topAnchor.constraint(
            equalTo: breakdownLabel.bottomAnchor,
            constant: 5)
            .isActive = true
        pivotTableView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
            constant: -50)
            .isActive = true
        pivotTableView.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
            constant: 18)
            .isActive = true
        pivotTableView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -40)
            .isActive = true
       
        addEntryButton.centerXAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            .isActive = true
        addEntryButton.topAnchor.constraint(
            equalTo: pivotTableView.bottomAnchor,
            constant: 3).isActive = true
        addEntryButton.titleLabel?.resizeToText()
    }
    
}
