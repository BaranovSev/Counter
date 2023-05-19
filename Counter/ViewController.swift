//
//  ViewController.swift
//  Counter
//
//  Created by Stepan Baranov on 18.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var countLabel: UILabel!
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var dropButton: UIButton!
    @IBOutlet weak private var statisticsTextView: UITextView!
    private var count: Int = 0
    private var currentTime: String {   // calculated
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy в HH:mm:ss"
        return formatter.string(from: Date())
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countLabel.text = "0"                             // default text settings
        statisticsTextView.text = "История изменений:"
        plusButton.backgroundColor = .red                 // default buttons background color settings
        minusButton.backgroundColor = .blue
        dropButton.backgroundColor = .clear
        
    }

    @IBAction private func plusButtonTab(_ sender: Any) {
        count += 1
        countLabel.text = "Значение счётчика: \(count)"
        statisticsTextView.text.append("\n\(currentTime): значение изменено на +1")
    }
    
    @IBAction private func minusButtonTab(_ sender: Any) {
        if count == 1 {
            count -= 1
            countLabel.text = "0"
            statisticsTextView.text.append("\n\(currentTime): значение изменено на -1")
        } else if count > 0 {
            count -= 1
            countLabel.text = "Значение счётчика: \(count)"
            statisticsTextView.text.append("\n\(currentTime): значение изменено на -1")
        } else {
            countLabel.text = "0"
            statisticsTextView.text.append("\n\(currentTime): попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func dropButtonTab(_ sender: Any) {
        count = 0
        countLabel.text = "0"
        statisticsTextView.text.append("\n\(currentTime): значение сброшено")
    }
}

