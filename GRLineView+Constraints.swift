//
//  GRLineView+Constraints.swift
//  iOS-FinanceApp
//
//  Created by Dmitry Aksyonov on 03.08.2020.
//  Copyright © 2020 Dmitry Aksyonov. All rights reserved.
//

import Foundation

extension GRLineView {
    
    func constrainSelf() {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let superview = superview {
            let safeArea = superview.safeAreaLayoutGuide
            
            let constraints = [
                centerXAnchor.constraint(
                    equalTo: superview.centerXAnchor
                ),
                leadingAnchor.constraint(
                    equalTo: safeArea.leadingAnchor,
                    constant: 20
                ),
                trailingAnchor.constraint(
                    equalTo: safeArea.trailingAnchor,
                    constant: -20
                ),
                heightAnchor.constraint(
                    equalToConstant: 250
                )
            ]
            
            constraints.forEach { $0.isActive = true }
        }
    }
    
    func constrainLabels() {
        titleLabel
            .translatesAutoresizingMaskIntoConstraints = false
        totalLabel
            .translatesAutoresizingMaskIntoConstraints = false
        maxLabel
            .translatesAutoresizingMaskIntoConstraints = false
        medLabel
            .translatesAutoresizingMaskIntoConstraints = false
        minLabel
            .translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = safeAreaLayoutGuide
        
        let constraints = [
            titleLabel.topAnchor.constraint(
                equalTo: safeArea.topAnchor,
                constant: 6
            ),
            titleLabel.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor,
                constant: 8
            ),
            totalLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor
            ),
            totalLabel.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor,
                constant: 8
            ),
            maxLabel.topAnchor.constraint(
                equalTo: totalLabel.bottomAnchor,
                constant: 7.61
            ),
            maxLabel.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor,
                constant: 8
            ),
            medLabel.topAnchor.constraint(
                equalTo: maxLabel.bottomAnchor,
                constant: 48
            ),
            medLabel.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor,
                constant: 8
            ),
            minLabel.topAnchor.constraint(
                equalTo: medLabel.bottomAnchor,
                constant: 46
            ),
            minLabel.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor,
                constant: 8
            ),
        ]
        
        constraints.forEach({ $0.isActive = true })
    }
    
}
