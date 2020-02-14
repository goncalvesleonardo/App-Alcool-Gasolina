//
//  ViewController.swift
//  Alcool ou gasolina
//
//  Created by Leonardo Oliveira on 14/02/20.
//  Copyright © 2020 Leonardo Gonçalves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var resultadoLegenda: UILabel!
    @IBOutlet weak var alcoolCampo: UITextField!
    @IBOutlet weak var gasolinaCampo: UITextField!
    
    
    @IBAction func calcularCombustivel(_ sender: Any) {
        if let precoAlcool = alcoolCampo.text {
            if let precoGasolina = gasolinaCampo.text {
                // validar valores digitados
                let resultado = self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                
                if resultado {
                    // calcular melhor combustivel
                    self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                    
                } else {
                    resultadoLegenda.text = "Digite os preços para calcular."
                }
                
            }
        }
    }
    
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String){
        // converter valorpara numeros
        if let valorAlcool = Double(precoAlcool) {
            if let valorGasolina = Double(precoGasolina) {
                let resultadoPreco = valorAlcool / valorGasolina
                if resultadoPreco >= 0.7 {
                    self.resultadoLegenda.text = "Melhor utilizar gasolina!"
                } else {
                    self.resultadoLegenda.text = "Melhor utilizar alcool!"
                }
            }
        }
    }
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool{
        var camposValidados = true
        
        if precoAlcool.isEmpty {
            camposValidados = false
        } else if precoGasolina.isEmpty {
            camposValidados = false
        }
        
        return camposValidados
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

