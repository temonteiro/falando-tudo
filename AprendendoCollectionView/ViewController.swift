//
//  ViewController.swift
//  AprendendoCollectionView
//
//  Created by thalita.monteiro on 28/09/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var falarAlgo: UITextField!
    let items = ["Acabou","Algo a dizer","Onde","Fome","Estar", "Beber", "Eu", "Quer"]
    
    let images: [UIImage] = [
        UIImage(named: "acabou")!,
        UIImage(named: "algo-dizer")!,
        UIImage(named: "onde")!,
        UIImage(named: "fome")!,
        UIImage(named: "estar")!,
        UIImage(named: "beber")!,
        UIImage(named: "eu")!,
        UIImage(named: "quer")!,
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.nomes.text = items[indexPath.item]
        cell.pictograma.image = images[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        falarAlgo.text = (falarAlgo.text ?? "") + " \(items[indexPath.item])"
    }

   
    @IBAction func readAndSpeak(_ sender: UIButton) {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: (falarAlgo.text ?? "Selecione um ícone"))
        
        utterance.voice = AVSpeechSynthesisVoice(identifier: "Karen")
        utterance.voice = AVSpeechSynthesisVoice(language: "pt-br")
        
        utterance.rate = 0.5

        synthesizer.speak(utterance)
    }
}

