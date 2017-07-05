//
//  ViewController.swift
//  userDefaults2F
//
//  Created by Fausto Checa on 5/7/17.
//  Copyright © 2017 Fausto Checa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var numberInTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    var resultados:[Int] = []
    var resultadosInversos:[Int] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultadosInversos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String(resultadosInversos[indexPath.row])
        return cell
        
    }
    
    @IBAction func Go(_ sender: Any) {
        
        loadFromDefaults()
        let myNumberString = numberInTextField.text
        let number:Int = Int(myNumberString!)!
        resultados.append(number)
        resultadosInversos = resultados.reversed()
        saveInDefaults()
        tableView.reloadData()
        
    }
    
    func saveInDefaults() {
        UserDefaults.standard.set(resultados, forKey: "resultados")
    
    }
    
    func loadFromDefaults() {
        let obj = UserDefaults.standard.array(forKey: "resultados")
        if let myArray = obj as NSArray? {
            resultados = myArray as! [Int]
            
        }
    
    
    }
    
    @IBAction func ClearData(_ sender: Any) {
        
        resultados = []
        resultadosInversos = []
        saveInDefaults()
        loadFromDefaults()
        tableView.reloadData()
        
    }
    
 
}

