//
//  ItemViewController.swift
//  UIViewControllAR
//
//  Created by Henrik Storch on 30.05.19.
//  Copyright © 2019 Henrik Storch. All rights reserved.
//

import ARKit

class ItemViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var bgButtons: [UIButton]!
    
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var itemPickerView: UIPickerView!
    
    var item: ARItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let _ = item else {
            item = ARItem()
            return
        }
        DispatchQueue.main.async {
            self.thumbnailView.image = UIImage(named: ItemTypes.allCases.first!.rawValue)
        }
        // Do any additional setup after loading the view.
    }


    
    @IBAction func sizeChanged(_ sender: UISlider) {
        item?.scale(to: sender.value)
    }
    
    @IBAction func changeItemColor(_ sender: UIButton) {
        for btn in bgButtons{
            btn.isEnabled = true
            btn.backgroundColor = btn.backgroundColor?.withAlphaComponent(1)
        }
        
        item?.changeColor(to: sender.backgroundColor) 
        sender.backgroundColor = sender.backgroundColor?.withAlphaComponent(0.5)
        sender.isEnabled = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("hmm")
    }
    
    // MARK: - UIButtons

    @IBAction func rotateItem(_ sender: Any) {
        item?.rotate()
    }
    
    @IBAction func destroyItem(_ sender: Any) {
        item?.destroy()
    }
    
    @IBAction func reCreateItem(_ sender: Any) {
        item?.reCreate()
    }
    
    
    // MARK: - PickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ItemTypes.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ItemTypes.allCases[row].rawValue
        
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let newItemType = ItemTypes.allCases[row]
        item?.changeType(to: newItemType)
        thumbnailView.image = UIImage(named: newItemType.rawValue)
    }
    
}
