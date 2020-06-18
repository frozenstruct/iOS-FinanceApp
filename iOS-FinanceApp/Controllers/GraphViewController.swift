//
//  GraphViewController.swift
//  iOS-FinanceApp
//
//  Created by Dmitry Aksyonov on 16.03.2020.
//  Copyright © 2020 Dmitry Aksyonov. All rights reserved.
//

import UIKit
import RealmSwift

class GraphViewController: UIViewController {
    let segmentedControl = UISegmentedControl()
    let lineGraphView = LineGraphView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentedControl()
        setupLineGraphView()
        setupStackView()
    }
    
    func setupSegmentedControl() {
        view.addSubview(segmentedControl)
        
        let items = ["All", "Year", "Month", "Week", "Day"]
        
        let margins = view.layoutMarginsGuide
        
        for item in items {
            var index = 0
            segmentedControl.insertSegment(withTitle: item, at: index, animated: true)
            index += 1
        }
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 350, height: 50))
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        let segmentedViewConstraints = [
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ]
        
        segmentedViewConstraints.forEach { constraint in
            constraint.isActive = true
        }
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlTapped(_:)), for: .valueChanged)
    }
    
    func setupLineGraphView() {
        view.addSubview(lineGraphView)
        
        let margins = view.layoutMarginsGuide
        
        lineGraphView.backgroundColor = .clear
        lineGraphView.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 300, height: 250))
        
        lineGraphView.translatesAutoresizingMaskIntoConstraints = false
        
        let graphViewConstraints = [
            lineGraphView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lineGraphView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 32.5),
            lineGraphView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            lineGraphView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            lineGraphView.heightAnchor.constraint(equalToConstant: 250)
        ]
        
        graphViewConstraints.forEach { constraint in
            constraint.isActive = true
        }
        
        let graphLabels = (1...4).map { _ in UILabel() }
        
        
        graphLabels[0].frame = CGRect(x: 15, y: 10, width: 40, height: 40)
        graphLabels[0].text = "Profit and Loss Breakdown"
        graphLabels[0].font = UIFont.init(name: "Avenir Next Bold", size: 12)
        lineGraphView.addSubview(graphLabels[0])
        
        var labelYPoint: CGFloat = 52.25
        
        graphLabels[1...3].forEach { label in
            label.frame = CGRect(x: 15, y: labelYPoint, width: 40, height: 40)
            label.text = "XX"
            labelYPoint += 65
            label.font = UIFont.init(name: "Avenir Next", size: 12)
            lineGraphView.addSubview(label)
        }
        
        let lineMargins = lineGraphView.layoutMarginsGuide
        
        graphLabels.forEach { label in
            label.textColor = .white
            label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            label.textAlignment = .natural
            label.sizeToFit()
        }
    }
    
    func setupStackView() {
        
        let margins = lineGraphView.layoutMarginsGuide
        
        
        let stackView = UIStackView()
        lineGraphView.addSubview(stackView)
        stackView.frame = CGRect(x: 15, y: 100, width: 100, height: 100)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 25
        stackView.sizeToFit()
        
        let label = UILabel(frame: CGRect.zero)
        var stackViewLabels: [UILabel] = (1...7).map { _ in UILabel()}
        let labelTexts = [
            ["00:00", "03:00", "06:00", "09:00"],
            ["S", "M", "T", "W", "T", "F", "S"],
            ["W1", "W2", "W3", "W4"],
            ["Q1", "Q2", "Q3", "Q4"],
            ["MIN", "MID", "MAX"]
        ]
        
        for label in stackViewLabels {
            var i = 0
            let weekTexts = labelTexts[1]
            label.text = weekTexts[i]
            label.font = UIFont.init(name: "Avenir Next Medium", size: 12)
            label.textColor = .white
            stackView.addArrangedSubview(label)
            i += 1
            print(label.text)
        }
        
        let constraints = [
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 34),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant:  -15)
        ]
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    @objc func segmentedControlTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            DataManager.getGraphDataSource(timeFrame: .day, input: entries)
        case 1:
            DataManager.getGraphDataSource(timeFrame: .week, input: entries)
        case 2:
            DataManager.getGraphDataSource(timeFrame: .month, input: entries)
        case 3:
            DataManager.getGraphDataSource(timeFrame: .year, input: entries)
        case 4:
            DataManager.getGraphDataSource(timeFrame: .all, input: entries)
        default:
            break
        }
    }
}
