//
//  ViewController.swift
//  teste
//
//  Created by Allan da Silva on 22/03/2018.
//  Copyright © 2018 Allan da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var peso: UITextField!
    @IBOutlet weak var altura: UITextField!
    @IBOutlet weak var lbresultado: UILabel!
    @IBOutlet weak var ivresultado: UIImageView!
    
    @IBOutlet weak var vresultado: UIView!
    var imc:Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBAction func calcular(_ sender: Any) {
        if let _peso = Double(peso.text!), let _altura = Double(altura.text!){
            imc = _peso / pow(_altura,2)
            mostrarResultado()
        }
    }
    
    func mostrarResultado() {
        var resultado:  String = ""
        var img:  String = ""
    
        switch imc {
        case 0..<16:
            resultado = "Magreza"
            img = "abaixo"
        case 16..<18.5:
            resultado = "Abaixdo do Peso"
            img = "abaixo"
        case  18.5..<25:
            resultado = "Peso Ideal"
            img = "ideal"
        case  25..<30:
            resultado = "Sobrepeso"
            img = "sobre"
        default:
            resultado = "Obesidade"
            img = "obesidade"
            
        }
        lbresultado.text = "\(Int(imc)):\(resultado)"
        ivresultado.image = UIImage(named:img)
        vresultado.isHidden = false
        view.endEditing(false)
    }

}

