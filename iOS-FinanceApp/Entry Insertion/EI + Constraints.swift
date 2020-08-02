//
//  EI + Constraints.swift
//  iOS-FinanceApp
//
//  Created by Dmitry Aksyonov on 02.08.2020.
//  Copyright © 2020 Dmitry Aksyonov. All rights reserved.
//

import Foundation

extension EIViewController {
    func constrain() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        callToActionLabel
            .translatesAutoresizingMaskIntoConstraints = false
        
        imageForCategory
            .translatesAutoresizingMaskIntoConstraints = false
        
        topStackView
            .translatesAutoresizingMaskIntoConstraints = false
        
        typeControl
            .translatesAutoresizingMaskIntoConstraints = false
        
        addEntryButton
            .translatesAutoresizingMaskIntoConstraints = false
        
        addCategoryButton
            .translatesAutoresizingMaskIntoConstraints = false
        
        
        callToActionLabel.topAnchor.constraint(
            equalTo: safeArea.topAnchor,
            constant: 25)
            .isActive = true
        
        callToActionLabel.leadingAnchor.constraint(
            equalTo: safeArea.leadingAnchor,
            constant: 20)
            .isActive = true
        
        
        topStackView.topAnchor.constraint(
            equalTo: callToActionLabel.bottomAnchor,
            constant: 10)
            .isActive = true
        
        topStackView.leadingAnchor.constraint(
            equalTo: safeArea.leadingAnchor,
            constant: 20).isActive = true
        
        topStackView.widthAnchor.constraint(
            equalToConstant: 170)
            .isActive = true
        
        
        addCategoryButton.leadingAnchor.constraint(
            equalTo: topStackView.trailingAnchor,
            constant: 7)
            .isActive = true
        
        addCategoryButton.bottomAnchor.constraint(
            equalTo: topStackView.bottomAnchor,
            constant: -41)
            .isActive = true
        
        
        addEntryButton.centerXAnchor.constraint(
            equalTo: safeArea.centerXAnchor)
            .isActive = true
        
        addEntryButton.centerYAnchor.constraint(
            equalTo: safeArea.centerYAnchor)
            .isActive = true
        
        addEntryButton.titleLabel?.resizeToText()
        
        
        imageForCategory.topAnchor.constraint(
            equalTo: topStackView.topAnchor)
            .isActive = true
        
        imageForCategory.trailingAnchor.constraint(
            equalTo: safeArea.trailingAnchor,
            constant: -30)
            .isActive = true
        
        
        categoryIconPlaceholderLabel.centerXAnchor.constraint(
            equalTo: imageForCategory.centerXAnchor)
            .isActive = true
        
        categoryIconPlaceholderLabel.topAnchor.constraint(
            equalTo: imageForCategory.bottomAnchor,
            constant: 5)
            .isActive = true
        
        categoryIconPlaceholderLabel.resizeToText()
    }
}
