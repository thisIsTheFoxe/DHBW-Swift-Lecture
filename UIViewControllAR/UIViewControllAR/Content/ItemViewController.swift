//
//  ItemViewController.swift
//  UIViewControllAR
//
//  Created by Henrik Storch on 30.05.19.
//  Copyright © 2019 Henrik Storch. All rights reserved.
//

import ARKit

class ItemViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var itemPickerView: UIPickerView!
    
    var item: ARItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        item = ARItem()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sizeChanged(_ sender: UISlider) {
        item.scale = SCNVector3(sender.value, sender.value, sender.value)
    }
    
    @IBAction func changeItemColor(_ sender: UIButton) {
        item.geometry?.materials.first?.diffuse.contents = sender.backgroundColor
        
    }
    
    // MARK: - UIButtons

    @IBAction func rotateItem(_ sender: Any) {
        item.rotate()
    }
    
    @IBAction func destroyItem(_ sender: Any) {
        item.destroy()
    }
    
    @IBAction func reCreateItem(_ sender: Any) {
        item.reCreate()
    }
    
    
    // MARK: - PickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ItemTypes.AllCases().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ItemTypes.AllCases()[row].rawValue
        
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        item.changeType(to: ItemTypes.AllCases()[row])
    }
    
}
