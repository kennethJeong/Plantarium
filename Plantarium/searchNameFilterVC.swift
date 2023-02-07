//
//  searchNameFilterVC.swift
//  newNotitle1
//
//  Created by 정은후 on 2020. 8. 10..
//  Copyright © 2020년 정은후. All rights reserved.
//

import UIKit

class searchNameFilterVC: UIViewController {
    @IBOutlet var viewBackground: UIView!
    @IBOutlet var viewCaryophyllales: UIView!
    @IBOutlet var viewLamiales: UIView!
    @IBOutlet var viewEricales: UIView!
    @IBOutlet var viewOxales: UIView!
    @IBOutlet var viewPoales: UIView!
    
    // IBOutlet variables -> buttons
    @IBOutlet var btnCaryophyllales: UIButton!
    @IBOutlet var btnDioncophyllaceae: UIButton!
    @IBOutlet var btnTriphyophyllum: UIButton!
    @IBOutlet var btnDroseraceae: UIButton!
    @IBOutlet var btnAldrovanda: UIButton!
    @IBOutlet var btnDionaea: UIButton!
    @IBOutlet var btnDrosera: UIButton!
    @IBOutlet var btnDrosophyllaceae: UIButton!
    @IBOutlet var btnDrosophyllum: UIButton!
    @IBOutlet var btnNepenthaceae: UIButton!
    @IBOutlet var btnNepenthes: UIButton!
    
    @IBOutlet var btnLamiales: UIButton!
    @IBOutlet var btnByblidaceae: UIButton!
    @IBOutlet var btnByblis: UIButton!
    @IBOutlet var btnLentibulariaceae: UIButton!
    @IBOutlet var btnPinguicula: UIButton!
    @IBOutlet var btnGenlisea: UIButton!
    @IBOutlet var btnUtricularia: UIButton!
    @IBOutlet var btnMartyniaceae: UIButton!
    @IBOutlet var btnIbicella: UIButton!
    @IBOutlet var btnPlantaginaceae: UIButton!
    @IBOutlet var btnPhilcoxia: UIButton!
    
    @IBOutlet var btnEricales: UIButton!
    @IBOutlet var btnRoridulaceae: UIButton!
    @IBOutlet var btnRoridula: UIButton!
    @IBOutlet var btnSarraceniaceae: UIButton!
    @IBOutlet var btnDarlingtonia: UIButton!
    @IBOutlet var btnHeliamphora: UIButton!
    @IBOutlet var btnSarracenia: UIButton!
    
    @IBOutlet var btnOxales: UIButton!
    @IBOutlet var btnCephalotaceae: UIButton!
    @IBOutlet var btnCephalotus: UIButton!
    
    @IBOutlet var btnPoales: UIButton!
    @IBOutlet var btnBromeliaceae: UIButton!
    @IBOutlet var btnBrocchinia: UIButton!
    @IBOutlet var btnCatopsis: UIButton!
    //
    
    @IBOutlet var checkboxCaryophyllales : [UIButton]!
    @IBOutlet var checkboxLamiales : [UIButton]!
    @IBOutlet var checkboxEricales : [UIButton]!
    @IBOutlet var checkboxOxales : [UIButton]!
    @IBOutlet var checkboxPoales : [UIButton]!
    
    // default variables
    var btnCaryophyllales_default = false
    var btnDioncophyllaceae_default = false
    var btnTriphyophyllum_default = false
    var btnDroseraceae_default = false
    var btnAldrovanda_default = false
    var btnDionaea_default = false
    var btnDrosera_default = false
    var btnDrosophyllaceae_default = false
    var btnDrosophyllum_default = false
    var btnNepenthaceae_default = false
    var btnNepenthes_default = false
    
    var btnLamiales_default = false
    var btnByblidaceae_default = false
    var btnByblis_default = false
    var btnLentibulariaceae_default = false
    var btnPinguicula_default = false
    var btnGenlisea_default = false
    var btnUtricularia_default = false
    var btnMartyniaceae_default = false
    var btnIbicella_default = false
    var btnPlantaginaceae_default = false
    var btnPhilcoxia_default = false
    
    var btnEricales_default = false
    var btnRoridulaceae_default = false
    var btnRoridula_default = false
    var btnSarraceniaceae_default = false
    var btnDarlingtonia_default = false
    var btnHeliamphora_default = false
    var btnSarracenia_default = false
    
    var btnOxales_default = false
    var btnCephalotaceae_default = false
    var btnCephalotus_default = false
    
    var btnPoales_default = false
    var btnBromeliaceae_default = false
    var btnBrocchinia_default = false
    var btnCatopsis_default = false
    //
    
    var selection = [[String : [String]]]()
    var selectionCaryophyllales = [String:[String]]()
    var selectionLamiales = [String:[String]]()
    var selectionEricales = [String:[String]]()
    var selectionOxales = [String:[String]]()
    var selectionPoales = [String:[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBorderToView()
        
        selectionCaryophyllales = ["order":[String](), "family":[String](), "genus":[String]()]
        selectionLamiales = ["order":[String](), "family":[String](), "genus":[String]()]
        selectionEricales = ["order":[String](), "family":[String](), "genus":[String]()]
        selectionOxales = ["order":[String](), "family":[String](), "genus":[String]()]
        selectionPoales = ["order":[String](), "family":[String](), "genus":[String]()]
    }
    
    // searchNameVC 로 selection 데이터 전달 함수
    func sendFilterSelection() {
        selection = [selectionCaryophyllales, selectionLamiales, selectionEricales, selectionOxales, selectionPoales]
        let vc = parent as! searchNameVC
        vc.getFilterSelection(selection)
    }
    
    // 각 view에 테두리 생성 함수
    func setBorderToView() {
        var views = [UIView]()
        views.append(viewCaryophyllales)
        views.append(viewLamiales)
        views.append(viewEricales)
        views.append(viewOxales)
        views.append(viewPoales)
        
        for eachView in views {
            eachView.layer.borderColor = UIColor.white.cgColor
            eachView.layer.borderWidth = 1.0
            eachView.layer.cornerRadius = 10.0
        }
    }
    
    // 각 체크박스 선택 시 작동 함수
    // Caryophyllales
    //
    @IBAction func clickCaryophyllales(_ sender: UIButton) {
        let name = "Caryophyllales"
        if !btnCaryophyllales_default {
            checkboxCaryophyllales.forEach {
                $0.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            }
            
            btnCaryophyllales_default = true
            btnDioncophyllaceae_default = true
            btnTriphyophyllum_default = true
            btnDroseraceae_default = true
            btnAldrovanda_default = true
            btnDionaea_default = true
            btnDrosera_default = true
            btnDrosophyllaceae_default = true
            btnDrosophyllum_default = true
            btnNepenthaceae_default = true
            btnNepenthes_default = true
            
            selectionCaryophyllales["order"] = [name]
            phylogeny[name]!.forEach {
                let family = $0.key
                let genus = $0.value
                selectionCaryophyllales["family"]?.append(family)
                genus.forEach {
                    selectionCaryophyllales["genus"]?.append($0)
                }
            }
        } else {
            checkboxCaryophyllales.forEach {
                $0.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            }
            
            btnCaryophyllales_default = false
            btnDioncophyllaceae_default = false
            btnTriphyophyllum_default = false
            btnDroseraceae_default = false
            btnAldrovanda_default = false
            btnDionaea_default = false
            btnDrosera_default = false
            btnDrosophyllaceae_default = false
            btnDrosophyllum_default = false
            btnNepenthaceae_default = false
            btnNepenthes_default = false
            
            selectionCaryophyllales["order"] = []
            selectionCaryophyllales["family"] = []
            selectionCaryophyllales["genus"] = []
        }
        sendFilterSelection()
    }
    @IBAction func clickDioncophyllaceae(_ sender: UIButton) {
        let name = "Dioncophyllaceae"
        let order = "Caryophyllales"
        if !btnDioncophyllaceae_default {
            btnCaryophyllales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDioncophyllaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnTriphyophyllum.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnCaryophyllales_default = true
            btnDioncophyllaceae_default = true
            btnTriphyophyllum_default = true
            
            selectionCaryophyllales["order"] = [order]
            if !(selectionCaryophyllales["family"]?.contains(name))! {
                selectionCaryophyllales["family"]?.append(name)
            }
            phylogeny[order]?[name]!.forEach {
                let genus = $0
                if !(selectionCaryophyllales["genus"]?.contains(genus))! {
                    selectionCaryophyllales["genus"]?.append(genus)
                }
            }
        } else {
            btnDioncophyllaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnTriphyophyllum.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            
            btnDioncophyllaceae_default = false
            btnTriphyophyllum_default = false
            
            selectionCaryophyllales["family"] = selectionCaryophyllales["family"]?.filter(){$0 != name}
            selectionCaryophyllales["genus"] = selectionCaryophyllales["genus"]?.filter {!phylogeny[order]![name]!.contains($0)}
            
            if selectionCaryophyllales["family"]!.count == 0 {
                btnCaryophyllales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnCaryophyllales_default = false
                selectionCaryophyllales["order"] = selectionCaryophyllales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickTriphyophyllum(_ sender: UIButton) {
        let name = "Triphyophyllum"
        let order = "Caryophyllales"
        let family = "Dioncophyllaceae"
        if !btnTriphyophyllum_default {
            btnCaryophyllales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDioncophyllaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnTriphyophyllum.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnCaryophyllales_default = true
            btnDioncophyllaceae_default = true
            btnTriphyophyllum_default = true
            
            selectionCaryophyllales["order"] = [order]
            if !(selectionCaryophyllales["family"]?.contains(family))! {
                selectionCaryophyllales["family"]?.append(family)
            }
            if !(selectionCaryophyllales["genus"]?.contains(name))! {
                selectionCaryophyllales["genus"]?.append(name)
            }
        } else {
            btnTriphyophyllum.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnTriphyophyllum_default = false
            selectionCaryophyllales["genus"] = selectionCaryophyllales["genus"]?.filter(){$0 != name}
            
            btnDioncophyllaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnDioncophyllaceae_default = false
            selectionCaryophyllales["family"] = selectionCaryophyllales["family"]?.filter(){$0 != family}
            
            if selectionCaryophyllales["family"]!.count == 0 {
                btnCaryophyllales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnCaryophyllales_default = false
                selectionCaryophyllales["order"] = selectionCaryophyllales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickDroseraceae(_ sender: UIButton) {
        let name = "Droseraceae"
        let order = "Caryophyllales"
        if !btnDroseraceae_default {
            btnCaryophyllales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDroseraceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnAldrovanda.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDionaea.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDrosera.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnCaryophyllales_default = true
            btnDroseraceae_default = true
            btnAldrovanda_default = true
            btnDionaea_default = true
            btnDrosera_default = true
            
            selectionCaryophyllales["order"] = [order]
            if !(selectionCaryophyllales["family"]?.contains(name))! {
                selectionCaryophyllales["family"]?.append(name)
            }
            phylogeny[order]?[name]!.forEach {
                let genus = $0
                if !(selectionCaryophyllales["genus"]?.contains(genus))! {
                    selectionCaryophyllales["genus"]?.append(genus)
                }
            }
        } else {
            btnDroseraceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnAldrovanda.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnDionaea.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnDrosera.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            
            btnDroseraceae_default = false
            btnAldrovanda_default = false
            btnDionaea_default = false
            btnDrosera_default = false
            
            selectionCaryophyllales["family"] = selectionCaryophyllales["family"]?.filter(){$0 != name}
            selectionCaryophyllales["genus"] = selectionCaryophyllales["genus"]?.filter {!phylogeny[order]![name]!.contains($0)}
            
            if selectionCaryophyllales["family"]!.count == 0 {
                btnCaryophyllales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnCaryophyllales_default = false
                selectionCaryophyllales["order"] = selectionCaryophyllales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickAldrovanda(_ sender: UIButton) {
        let name = "Aldrovanda"
        let order = "Caryophyllales"
        let family = "Droseraceae"
        if !btnAldrovanda_default {
            btnCaryophyllales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDroseraceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnAldrovanda.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnCaryophyllales_default = true
            btnDroseraceae_default = true
            btnAldrovanda_default = true
            
            selectionCaryophyllales["order"] = [order]
            if !(selectionCaryophyllales["family"]?.contains(family))! {
                selectionCaryophyllales["family"]?.append(family)
            }
            if !(selectionCaryophyllales["genus"]?.contains(name))! {
                selectionCaryophyllales["genus"]?.append(name)
            }
        } else {
            btnAldrovanda.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnAldrovanda_default = false
            selectionCaryophyllales["genus"] = selectionCaryophyllales["genus"]?.filter(){$0 != name}
            
            if !selectionCaryophyllales["genus"]!.contains("Dionaea") && !selectionCaryophyllales["genus"]!.contains("Drosera") {
                btnDroseraceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnDroseraceae_default = false
                selectionCaryophyllales["family"] = selectionCaryophyllales["family"]?.filter(){$0 != family}
                
                if selectionCaryophyllales["family"]!.count == 0 {
                    btnCaryophyllales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                    btnCaryophyllales_default = false
                    selectionCaryophyllales["order"] = selectionCaryophyllales["order"]?.filter(){$0 != order}
                }
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickDionaea(_ sender: UIButton) {
        let name = "Dionaea"
        let order = "Caryophyllales"
        let family = "Droseraceae"
        if !btnDionaea_default {
            btnCaryophyllales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDroseraceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDionaea.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnCaryophyllales_default = true
            btnDroseraceae_default = true
            btnDionaea_default = true
            
            selectionCaryophyllales["order"] = [order]
            if !(selectionCaryophyllales["family"]?.contains(family))! {
                selectionCaryophyllales["family"]?.append(family)
            }
            if !(selectionCaryophyllales["genus"]?.contains(name))! {
                selectionCaryophyllales["genus"]?.append(name)
            }
        } else {
            btnDionaea.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnDionaea_default = false
            selectionCaryophyllales["genus"] = selectionCaryophyllales["genus"]?.filter(){$0 != name}
            
            if !selectionCaryophyllales["genus"]!.contains("Aldrovanda") && !selectionCaryophyllales["genus"]!.contains("Drosera") {
                btnDroseraceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnDroseraceae_default = false
                selectionCaryophyllales["family"] = selectionCaryophyllales["family"]?.filter(){$0 != family}
                
                if selectionCaryophyllales["family"]!.count == 0 {
                    btnCaryophyllales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                    btnCaryophyllales_default = false
                    selectionCaryophyllales["order"] = selectionCaryophyllales["order"]?.filter(){$0 != order}
                }
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickDrosera(_ sender: UIButton) {
        let name = "Drosera"
        let order = "Caryophyllales"
        let family = "Droseraceae"
        if !btnDrosera_default {
            btnCaryophyllales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDroseraceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDrosera.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnCaryophyllales_default = true
            btnDroseraceae_default = true
            btnDrosera_default = true
            
            selectionCaryophyllales["order"] = [order]
            if !(selectionCaryophyllales["family"]?.contains(family))! {
                selectionCaryophyllales["family"]?.append(family)
            }
            if !(selectionCaryophyllales["genus"]?.contains(name))! {
                selectionCaryophyllales["genus"]?.append(name)
            }
        } else {
            btnDrosera.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnDrosera_default = false
            selectionCaryophyllales["genus"] = selectionCaryophyllales["genus"]?.filter(){$0 != name}
            
            if !selectionCaryophyllales["genus"]!.contains("Aldrovanda") && !selectionCaryophyllales["genus"]!.contains("Dionaea") {
                btnDroseraceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnDroseraceae_default = false
                selectionCaryophyllales["family"] = selectionCaryophyllales["family"]?.filter(){$0 != family}
                
                if selectionCaryophyllales["family"]!.count == 0 {
                    btnCaryophyllales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                    btnCaryophyllales_default = false
                    selectionCaryophyllales["order"] = selectionCaryophyllales["order"]?.filter(){$0 != order}
                }
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickDrosophyllaceae(_ sender: UIButton) {
        let name = "Drosophyllaceae"
        let order = "Caryophyllales"
        if !btnDrosophyllaceae_default {
            btnCaryophyllales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDrosophyllaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDrosophyllum.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnCaryophyllales_default = true
            btnDrosophyllaceae_default = true
            btnDrosophyllum_default = true
            
            selectionCaryophyllales["order"] = [order]
            if !(selectionCaryophyllales["family"]?.contains(name))! {
                selectionCaryophyllales["family"]?.append(name)
            }
            phylogeny[order]?[name]!.forEach {
                let genus = $0
                if !(selectionCaryophyllales["genus"]?.contains(genus))! {
                    selectionCaryophyllales["genus"]?.append(genus)
                }
            }
        } else {
            btnDrosophyllaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnDrosophyllum.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            
            btnDrosophyllaceae_default = false
            btnDrosophyllum_default = false
            
            selectionCaryophyllales["family"] = selectionCaryophyllales["family"]?.filter(){$0 != name}
            selectionCaryophyllales["genus"] = selectionCaryophyllales["genus"]?.filter {!phylogeny[order]![name]!.contains($0)}
            
            if selectionCaryophyllales["family"]!.count == 0 {
                btnCaryophyllales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnCaryophyllales_default = false
                selectionCaryophyllales["order"] = selectionCaryophyllales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickDrosophyllum(_ sender: UIButton) {
        let name = "Drosophyllum"
        let order = "Caryophyllales"
        let family = "Drosophyllaceae"
        if !btnDrosophyllum_default {
            btnCaryophyllales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDrosophyllaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDrosophyllum.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnCaryophyllales_default = true
            btnDrosophyllaceae_default = true
            btnDrosophyllum_default = true
            
            selectionCaryophyllales["order"] = [order]
            if !(selectionCaryophyllales["family"]?.contains(family))! {
                selectionCaryophyllales["family"]?.append(family)
            }
            if !(selectionCaryophyllales["genus"]?.contains(name))! {
                selectionCaryophyllales["genus"]?.append(name)
            }
        } else {
            btnDrosophyllum.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnDrosophyllum_default = false
            selectionCaryophyllales["genus"] = selectionCaryophyllales["genus"]?.filter(){$0 != name}
            
            btnDrosophyllaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnDrosophyllaceae_default = false
            selectionCaryophyllales["family"] = selectionCaryophyllales["family"]?.filter(){$0 != family}
            
            if selectionCaryophyllales["family"]!.count == 0 {
                btnCaryophyllales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnCaryophyllales_default = false
                selectionCaryophyllales["order"] = selectionCaryophyllales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickNepenthaceae(_ sender: UIButton) {
        let name = "Nepenthaceae"
        let order = "Caryophyllales"
        if !btnNepenthaceae_default {
            btnCaryophyllales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnNepenthaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnNepenthes.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnCaryophyllales_default = true
            btnNepenthaceae_default = true
            btnNepenthes_default = true
            
            selectionCaryophyllales["order"] = [order]
            if !(selectionCaryophyllales["family"]?.contains(name))! {
                selectionCaryophyllales["family"]?.append(name)
            }
            phylogeny[order]?[name]!.forEach {
                let genus = $0
                if !(selectionCaryophyllales["genus"]?.contains(genus))! {
                    selectionCaryophyllales["genus"]?.append(genus)
                }
            }
        } else {
            btnNepenthaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnNepenthes.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            
            btnNepenthaceae_default = false
            btnNepenthes_default = false
            
            selectionCaryophyllales["family"] = selectionCaryophyllales["family"]?.filter(){$0 != name}
            selectionCaryophyllales["genus"] = selectionCaryophyllales["genus"]?.filter {!phylogeny[order]![name]!.contains($0)}
            
            if selectionCaryophyllales["family"]!.count == 0 {
                btnCaryophyllales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnCaryophyllales_default = false
                selectionCaryophyllales["order"] = selectionCaryophyllales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickNepenthes(_ sender: UIButton) {
        let name = "Nepenthes"
        let order = "Caryophyllales"
        let family = "Nepenthaceae"
        if !btnNepenthes_default {
            btnCaryophyllales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnNepenthaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnNepenthes.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnCaryophyllales_default = true
            btnNepenthaceae_default = true
            btnNepenthes_default = true
            
            selectionCaryophyllales["order"] = [order]
            if !(selectionCaryophyllales["family"]?.contains(family))! {
                selectionCaryophyllales["family"]?.append(family)
            }
            if !(selectionCaryophyllales["genus"]?.contains(name))! {
                selectionCaryophyllales["genus"]?.append(name)
            }
        } else {
            btnNepenthes.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnNepenthes_default = false
            selectionCaryophyllales["genus"] = selectionCaryophyllales["genus"]?.filter(){$0 != name}
            
            btnNepenthaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnNepenthaceae_default = false
            selectionCaryophyllales["family"] = selectionCaryophyllales["family"]?.filter(){$0 != family}
            
            if selectionCaryophyllales["family"]!.count == 0 {
                btnCaryophyllales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnCaryophyllales_default = false
                selectionCaryophyllales["order"] = selectionCaryophyllales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    
    // Lamiales
    //
    @IBAction func clickLamiales(_ sender: UIButton) {
        let name = "Lamiales"
        if !btnLamiales_default {
            checkboxLamiales.forEach {
                $0.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            }
            btnLamiales_default = true
            btnByblidaceae_default = true
            btnLentibulariaceae_default = true
            btnPinguicula_default = true
            btnGenlisea_default = true
            btnUtricularia_default = true
            btnMartyniaceae_default = true
            btnIbicella_default = true
            btnPlantaginaceae_default = true
            btnPhilcoxia_default = true
            
            selectionLamiales["order"] = [name]
            phylogeny[name]!.forEach {
                let family = $0.key
                let genus = $0.value
                selectionLamiales["family"]?.append(family)
                genus.forEach {
                    selectionLamiales["genus"]?.append($0)
                }
            }
        } else {
            checkboxLamiales.forEach {
                $0.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            }
            btnLamiales_default = false
            btnByblidaceae_default = false
            btnLentibulariaceae_default = false
            btnPinguicula_default = false
            btnGenlisea_default = false
            btnUtricularia_default = false
            btnMartyniaceae_default = false
            btnIbicella_default = false
            btnPlantaginaceae_default = false
            btnPhilcoxia_default = false
            
            selectionLamiales["order"] = []
            selectionLamiales["family"] = []
            selectionLamiales["genus"] = []
        }
        sendFilterSelection()
    }
    @IBAction func clickByblidaceae(_ sender: UIButton) {
        let name = "Byblidaceae"
        let order = "Lamiales"
        if !btnByblidaceae_default {
            btnLamiales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnByblidaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnByblis.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnLamiales_default = true
            btnByblidaceae_default = true
            btnByblis_default = true
            
            selectionLamiales["order"] = [order]
            if !(selectionLamiales["family"]?.contains(name))! {
                selectionLamiales["family"]?.append(name)
            }
            phylogeny[order]?[name]!.forEach {
                let genus = $0
                if !(selectionLamiales["genus"]?.contains(genus))! {
                    selectionLamiales["genus"]?.append(genus)
                }
            }
        } else {
            btnByblidaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnByblis.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            
            btnByblidaceae_default = false
            btnByblis_default = false
            
            selectionLamiales["family"] = selectionLamiales["family"]?.filter(){$0 != name}
            selectionLamiales["genus"] = selectionLamiales["genus"]?.filter {!phylogeny[order]![name]!.contains($0)}
            
            if selectionLamiales["family"]!.count == 0 {
                btnLamiales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnLamiales_default = false
                selectionLamiales["order"] = selectionLamiales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickByblis(_ sender: UIButton) {
        let name = "Byblis"
        let order = "Lamiales"
        let family = "Byblidaceae"
        if !btnByblis_default {
            btnLamiales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnByblidaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnByblis.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnLamiales_default = true
            btnByblidaceae_default = true
            btnByblis_default = true
            
            selectionLamiales["order"] = [order]
            if !(selectionLamiales["family"]?.contains(family))! {
                selectionLamiales["family"]?.append(family)
            }
            if !(selectionLamiales["genus"]?.contains(name))! {
                selectionLamiales["genus"]?.append(name)
            }
        } else {
            btnByblis.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnByblis_default = false
            selectionLamiales["genus"] = selectionLamiales["genus"]?.filter(){$0 != name}
            
            btnByblidaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnByblidaceae_default = false
            selectionLamiales["family"] = selectionLamiales["family"]?.filter(){$0 != family}
            
            if selectionLamiales["family"]!.count == 0 {
                btnLamiales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnLamiales_default = false
                selectionLamiales["order"] = selectionLamiales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickLentibulariaceae(_ sender: UIButton) {
        let name = "Lentibulariaceae"
        let order = "Lamiales"
        if !btnLentibulariaceae_default {
            btnLamiales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnLentibulariaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnPinguicula.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnGenlisea.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnUtricularia.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnLamiales_default = true
            btnLentibulariaceae_default = true
            btnPinguicula_default = true
            btnGenlisea_default = true
            btnUtricularia_default = true
            
            selectionLamiales["order"] = [order]
            if !(selectionLamiales["family"]?.contains(name))! {
                selectionLamiales["family"]?.append(name)
            }
            phylogeny[order]?[name]!.forEach {
                let genus = $0
                if !(selectionLamiales["genus"]?.contains(genus))! {
                    selectionLamiales["genus"]?.append(genus)
                }
            }
        } else {
            btnLentibulariaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnPinguicula.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnGenlisea.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnUtricularia.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            
            btnLentibulariaceae_default = false
            btnPinguicula_default = false
            btnGenlisea_default = false
            btnUtricularia_default = false
            
            selectionLamiales["family"] = selectionLamiales["family"]?.filter(){$0 != name}
            selectionLamiales["genus"] = selectionLamiales["genus"]?.filter {!phylogeny[order]![name]!.contains($0)}
            
            if selectionLamiales["family"]!.count == 0 {
                btnLamiales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnLamiales_default = false
                selectionLamiales["order"] = selectionLamiales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickPinguicula(_ sender: UIButton) {
        let name = "Pinguicula"
        let order = "Lamiales"
        let family = "Lentibulariaceae"
        if !btnPinguicula_default {
            btnLamiales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnLentibulariaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnPinguicula.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnLamiales_default = true
            btnLentibulariaceae_default = true
            btnPinguicula_default = true
            
            selectionLamiales["order"] = [order]
            if !(selectionLamiales["family"]?.contains(family))! {
                selectionLamiales["family"]?.append(family)
            }
            if !(selectionLamiales["genus"]?.contains(name))! {
                selectionLamiales["genus"]?.append(name)
            }
        } else {
            btnPinguicula.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnPinguicula_default = false
            selectionLamiales["genus"] = selectionLamiales["genus"]?.filter(){$0 != name}
            
            if !selectionLamiales["genus"]!.contains("Genlisea") && !selectionLamiales["genus"]!.contains("Utricularia") {
                btnLentibulariaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnLentibulariaceae_default = false
                selectionLamiales["family"] = selectionLamiales["family"]?.filter(){$0 != family}
                
                if selectionLamiales["family"]!.count == 0 {
                    btnLamiales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                    btnLamiales_default = false
                    selectionLamiales["order"] = selectionLamiales["order"]?.filter(){$0 != order}
                }
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickGenlisea(_ sender: UIButton) {
        let name = "Genlisea"
        let order = "Lamiales"
        let family = "Lentibulariaceae"
        if !btnGenlisea_default {
            btnLamiales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnLentibulariaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnGenlisea.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnLamiales_default = true
            btnLentibulariaceae_default = true
            btnGenlisea_default = true
            
            selectionLamiales["order"] = [order]
            if !(selectionLamiales["family"]?.contains(family))! {
                selectionLamiales["family"]?.append(family)
            }
            if !(selectionLamiales["genus"]?.contains(name))! {
                selectionLamiales["genus"]?.append(name)
            }
        } else {
            btnGenlisea.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnGenlisea_default = false
            selectionLamiales["genus"] = selectionLamiales["genus"]?.filter(){$0 != name}
            
            if !selectionLamiales["genus"]!.contains("Pinguicula") && !selectionLamiales["genus"]!.contains("Utricularia") {
                btnLentibulariaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnLentibulariaceae_default = false
                selectionLamiales["family"] = selectionLamiales["family"]?.filter(){$0 != family}
                
                if selectionLamiales["family"]!.count == 0 {
                    btnLamiales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                    btnLamiales_default = false
                    selectionLamiales["order"] = selectionLamiales["order"]?.filter(){$0 != order}
                }
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickUtricularia(_ sender: UIButton) {
        let name = "Utricularia"
        let order = "Lamiales"
        let family = "Lentibulariaceae"
        if !btnUtricularia_default {
            btnLamiales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnLentibulariaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnUtricularia.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnLamiales_default = true
            btnLentibulariaceae_default = true
            btnUtricularia_default = true
            
            selectionLamiales["order"] = [order]
            if !(selectionLamiales["family"]?.contains(family))! {
                selectionLamiales["family"]?.append(family)
            }
            if !(selectionLamiales["genus"]?.contains(name))! {
                selectionLamiales["genus"]?.append(name)
            }
        } else {
            btnUtricularia.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnUtricularia_default = false
            selectionLamiales["genus"] = selectionLamiales["genus"]?.filter(){$0 != name}
            
            if !selectionLamiales["genus"]!.contains("Pinguicula") && !selectionLamiales["genus"]!.contains("Genlisea") {
                btnLentibulariaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnLentibulariaceae_default = false
                selectionLamiales["family"] = selectionLamiales["family"]?.filter(){$0 != family}
                
                if selectionLamiales["family"]!.count == 0 {
                    btnLamiales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                    btnLamiales_default = false
                    selectionLamiales["order"] = selectionLamiales["order"]?.filter(){$0 != order}
                }
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickMartyniaceae(_ sender: UIButton) {
        let name = "Martyniaceae"
        let order = "Lamiales"
        if !btnMartyniaceae_default {
            btnLamiales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnMartyniaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnIbicella.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnLamiales_default = true
            btnMartyniaceae_default = true
            btnIbicella_default = true
            
            selectionLamiales["order"] = [order]
            if !(selectionLamiales["family"]?.contains(name))! {
                selectionLamiales["family"]?.append(name)
            }
            phylogeny[order]?[name]!.forEach {
                let genus = $0
                if !(selectionLamiales["genus"]?.contains(genus))! {
                    selectionLamiales["genus"]?.append(genus)
                }
            }
        } else {
            btnMartyniaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnIbicella.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            
            btnMartyniaceae_default = false
            btnIbicella_default = false
            
            selectionLamiales["family"] = selectionLamiales["family"]?.filter(){$0 != name}
            selectionLamiales["genus"] = selectionLamiales["genus"]?.filter {!phylogeny[order]![name]!.contains($0)}
            
            if selectionLamiales["family"]!.count == 0 {
                btnLamiales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnLamiales_default = false
                selectionLamiales["order"] = selectionLamiales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickIbicella(_ sender: UIButton) {
        let name = "Ibicella"
        let order = "Lamiales"
        let family = "Martyniaceae"
        if !btnIbicella_default {
            btnLamiales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnMartyniaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnIbicella.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnLamiales_default = true
            btnMartyniaceae_default = true
            btnIbicella_default = true
            
            selectionLamiales["order"] = [order]
            if !(selectionLamiales["family"]?.contains(family))! {
                selectionLamiales["family"]?.append(family)
            }
            if !(selectionLamiales["genus"]?.contains(name))! {
                selectionLamiales["genus"]?.append(name)
            }
        } else {
            btnIbicella.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnIbicella_default = false
            selectionLamiales["genus"] = selectionLamiales["genus"]?.filter(){$0 != name}
            
            btnMartyniaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnMartyniaceae_default = false
            selectionLamiales["family"] = selectionLamiales["family"]?.filter(){$0 != family}
            
            if selectionLamiales["family"]!.count == 0 {
                btnLamiales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnLamiales_default = false
                selectionLamiales["order"] = selectionLamiales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickPlantaginaceae(_ sender: UIButton) {
        let name = "Plantaginaceae"
        let order = "Lamiales"
        if !btnPlantaginaceae_default {
            btnLamiales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnPlantaginaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnPhilcoxia.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnLamiales_default = true
            btnPlantaginaceae_default = true
            btnPhilcoxia_default = true
            
            selectionLamiales["order"] = [order]
            if !(selectionLamiales["family"]?.contains(name))! {
                selectionLamiales["family"]?.append(name)
            }
            phylogeny[order]?[name]!.forEach {
                let genus = $0
                if !(selectionLamiales["genus"]?.contains(genus))! {
                    selectionLamiales["genus"]?.append(genus)
                }
            }
        } else {
            btnPlantaginaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnPhilcoxia.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            
            btnPlantaginaceae_default = false
            btnPhilcoxia_default = false
            
            selectionLamiales["family"] = selectionLamiales["family"]?.filter(){$0 != name}
            selectionLamiales["genus"] = selectionLamiales["genus"]?.filter {!phylogeny[order]![name]!.contains($0)}
            
            if selectionLamiales["family"]!.count == 0 {
                btnLamiales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnLamiales_default = false
                selectionLamiales["order"] = selectionLamiales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickPhilcoxia(_ sender: UIButton) {
        let name = "Philcoxia"
        let order = "Lamiales"
        let family = "Plantaginaceae"
        if !btnPhilcoxia_default {
            btnLamiales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnPlantaginaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnPhilcoxia.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnLamiales_default = true
            btnPlantaginaceae_default = true
            btnPhilcoxia_default = true
            
            selectionLamiales["order"] = [order]
            if !(selectionLamiales["family"]?.contains(family))! {
                selectionLamiales["family"]?.append(family)
            }
            if !(selectionLamiales["genus"]?.contains(name))! {
                selectionLamiales["genus"]?.append(name)
            }
        } else {
            btnPhilcoxia.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnPhilcoxia_default = false
            selectionLamiales["genus"] = selectionLamiales["genus"]?.filter(){$0 != name}
            
            btnPlantaginaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnPlantaginaceae_default = false
            selectionLamiales["family"] = selectionLamiales["family"]?.filter(){$0 != family}
            
            if selectionLamiales["family"]!.count == 0 {
                btnLamiales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnLamiales_default = false
                selectionLamiales["order"] = selectionLamiales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    
    // Ericales
    //
    @IBAction func clickEricales(_ sender: UIButton) {
        let name = "Ericales"
        if !btnEricales_default {
            checkboxEricales.forEach {
                $0.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            }
            btnEricales_default = true
            btnRoridulaceae_default = true
            btnRoridula_default = true
            btnSarraceniaceae_default = true
            btnDarlingtonia_default = true
            btnHeliamphora_default = true
            btnSarracenia_default = true
            
            selectionEricales["order"] = [name]
            phylogeny[name]!.forEach {
                let family = $0.key
                let genus = $0.value
                selectionEricales["family"]?.append(family)
                genus.forEach {
                    selectionEricales["genus"]?.append($0)
                }
            }
        } else {
            checkboxEricales.forEach {
                $0.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            }
            btnEricales_default = false
            btnRoridulaceae_default = false
            btnRoridula_default = false
            btnSarraceniaceae_default = false
            btnDarlingtonia_default = false
            btnHeliamphora_default = false
            btnSarracenia_default = false
            
            selectionEricales["order"] = []
            selectionEricales["family"] = []
            selectionEricales["genus"] = []
        }
        sendFilterSelection()
    }
    @IBAction func clickRoridulaceae(_ sender: UIButton) {
        let name = "Roridulaceae"
        let order = "Ericales"
        if !btnRoridulaceae_default {
            btnEricales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnRoridulaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnRoridula.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnEricales_default = true
            btnRoridulaceae_default = true
            btnRoridula_default = true
            
            selectionEricales["order"] = [order]
            if !(selectionEricales["family"]?.contains(name))! {
                selectionEricales["family"]?.append(name)
            }
            phylogeny[order]?[name]!.forEach {
                let genus = $0
                if !(selectionEricales["genus"]?.contains(genus))! {
                    selectionEricales["genus"]?.append(genus)
                }
            }
        } else {
            btnRoridulaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnRoridula.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            
            btnRoridulaceae_default = false
            btnRoridula_default = false
            
            selectionEricales["family"] = selectionEricales["family"]?.filter(){$0 != name}
            selectionEricales["genus"] = selectionEricales["genus"]?.filter {!phylogeny[order]![name]!.contains($0)}

            if selectionEricales["family"]!.count == 0 {
                btnEricales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnEricales_default = false
                selectionEricales["order"] = selectionEricales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickRoridula(_ sender: UIButton) {
        let name = "Roridula"
        let order = "Ericales"
        let family = "Roridulaceae"
        if !btnRoridula_default {
            btnEricales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnRoridulaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnRoridula.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnEricales_default = true
            btnRoridulaceae_default = true
            btnRoridula_default = true
            
            selectionEricales["order"] = [order]
            if !(selectionEricales["family"]?.contains(family))! {
                selectionEricales["family"]?.append(family)
            }
            if !(selectionEricales["genus"]?.contains(name))! {
                selectionEricales["genus"]?.append(name)
            }
        } else {
            btnRoridula.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnRoridula_default = false
            selectionEricales["genus"] = selectionEricales["genus"]?.filter(){$0 != name}
            
            btnRoridulaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnRoridulaceae_default = false
            selectionEricales["family"] = selectionEricales["family"]?.filter(){$0 != family}
            
            if selectionEricales["family"]!.count == 0 {
                btnEricales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnEricales_default = false
                selectionEricales["order"] = selectionEricales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickSarraceniaceae(_ sender: UIButton) {
        let name = "Sarraceniaceae"
        let order = "Ericales"
        if !btnSarraceniaceae_default {
            btnEricales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnSarraceniaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDarlingtonia.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnHeliamphora.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnSarracenia.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnEricales_default = true
            btnSarraceniaceae_default = true
            btnDarlingtonia_default = true
            btnHeliamphora_default = true
            btnSarracenia_default = true
            
            selectionEricales["order"] = [order]
            if !(selectionEricales["family"]?.contains(name))! {
                selectionEricales["family"]?.append(name)
            }
            phylogeny[order]?[name]!.forEach {
                let genus = $0
                if !(selectionEricales["genus"]?.contains(genus))! {
                    selectionEricales["genus"]?.append(genus)
                }
            }
        } else {
            btnSarraceniaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnDarlingtonia.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnHeliamphora.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnSarracenia.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            
            btnSarraceniaceae_default = false
            btnDarlingtonia_default = false
            btnHeliamphora_default = false
            btnSarracenia_default = false
            
            selectionEricales["family"] = selectionEricales["family"]?.filter(){$0 != name}
            selectionEricales["genus"] = selectionEricales["genus"]?.filter {!phylogeny[order]![name]!.contains($0)}
            
            if selectionEricales["family"]!.count == 0 {
                btnEricales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnEricales_default = false
                selectionEricales["order"] = selectionEricales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickDarlingtonia(_ sender: UIButton) {
        let name = "Darlingtonia"
        let order = "Ericales"
        let family = "Sarraceniaceae"
        if !btnDarlingtonia_default {
            btnEricales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnSarraceniaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnDarlingtonia.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnEricales_default = true
            btnSarraceniaceae_default = true
            btnDarlingtonia_default = true
            
            selectionEricales["order"] = [order]
            if !(selectionEricales["family"]?.contains(family))! {
                selectionEricales["family"]?.append(family)
            }
            if !(selectionEricales["genus"]?.contains(name))! {
                selectionEricales["genus"]?.append(name)
            }
        } else {
            btnDarlingtonia.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnDarlingtonia_default = false
            selectionEricales["genus"] = selectionEricales["genus"]?.filter(){$0 != name}
            
            if !selectionEricales["genus"]!.contains("Heliamphora") && !selectionEricales["genus"]!.contains("Sarracenia") {
                btnSarraceniaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnSarraceniaceae_default = false
                selectionEricales["family"] = selectionEricales["family"]?.filter(){$0 != family}
                
                if selectionEricales["family"]!.count == 0 {
                    btnEricales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                    btnEricales_default = false
                    selectionEricales["order"] = selectionEricales["order"]?.filter(){$0 != order}
                }
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickHeliamphora(_ sender: UIButton) {
        let name = "Heliamphora"
        let order = "Ericales"
        let family = "Sarraceniaceae"
        if !btnHeliamphora_default {
            btnEricales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnSarraceniaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnHeliamphora.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnEricales_default = true
            btnSarraceniaceae_default = true
            btnHeliamphora_default = true
            
            selectionEricales["order"] = [order]
            if !(selectionEricales["family"]?.contains(family))! {
                selectionEricales["family"]?.append(family)
            }
            if !(selectionEricales["genus"]?.contains(name))! {
                selectionEricales["genus"]?.append(name)
            }
        } else {
            btnHeliamphora.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnHeliamphora_default = false
            selectionEricales["genus"] = selectionEricales["genus"]?.filter(){$0 != name}
            
            if !selectionEricales["genus"]!.contains("Darlingtonia") && !selectionEricales["genus"]!.contains("Sarracenia") {
                btnSarraceniaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnSarraceniaceae_default = false
                selectionEricales["family"] = selectionEricales["family"]?.filter(){$0 != family}
                
                if selectionEricales["family"]!.count == 0 {
                    btnEricales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                    btnEricales_default = false
                    selectionEricales["order"] = selectionEricales["order"]?.filter(){$0 != order}
                }
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickSarracenia(_ sender: UIButton) {
        let name = "Sarracenia"
        let order = "Ericales"
        let family = "Sarraceniaceae"
        if !btnSarracenia_default {
            btnEricales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnSarraceniaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnSarracenia.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnEricales_default = true
            btnSarraceniaceae_default = true
            btnSarracenia_default = true
            
            selectionEricales["order"] = [order]
            if !(selectionEricales["family"]?.contains(family))! {
                selectionEricales["family"]?.append(family)
            }
            if !(selectionEricales["genus"]?.contains(name))! {
                selectionEricales["genus"]?.append(name)
            }
        } else {
            btnSarracenia.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnSarracenia_default = false
            selectionEricales["genus"] = selectionEricales["genus"]?.filter(){$0 != name}
            
            if !selectionEricales["genus"]!.contains("Darlingtonia") && !selectionEricales["genus"]!.contains("Heliamphora") {
                btnSarraceniaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnSarraceniaceae_default = false
                selectionEricales["family"] = selectionEricales["family"]?.filter(){$0 != family}
                
                if selectionEricales["family"]!.count == 0 {
                    btnEricales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                    btnEricales_default = false
                    selectionEricales["order"] = selectionEricales["order"]?.filter(){$0 != order}
                }
            }
        }
        sendFilterSelection()
    }
    
    // Oxales
    //
    @IBAction func clickOxales(_ sender: UIButton) {
        let name = "Oxales"
        if !btnOxales_default {
            checkboxOxales.forEach {
                $0.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            }
            btnOxales_default = true
            btnCephalotaceae_default = true
            btnCephalotus_default = true
            
            selectionOxales["order"] = [name]
            phylogeny[name]!.forEach {
                let family = $0.key
                let genus = $0.value
                selectionOxales["family"]?.append(family)
                genus.forEach {
                    selectionOxales["genus"]?.append($0)
                }
            }
        } else {
            checkboxOxales.forEach {
                $0.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            }
            btnOxales_default = false
            btnCephalotaceae_default = false
            btnCephalotus_default = false
            
            selectionOxales["order"] = []
            selectionOxales["family"] = []
            selectionOxales["genus"] = []
        }
        sendFilterSelection()
    }
    @IBAction func clickCephalotaceae(_ sender: UIButton) {
        let name = "Cephalotaceae"
        let order = "Oxales"
        if !btnCephalotaceae_default {
            btnOxales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnCephalotaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnCephalotus.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnOxales_default = true
            btnCephalotaceae_default = true
            btnCephalotus_default = true
            
            selectionOxales["order"] = [order]
            if !(selectionOxales["family"]?.contains(name))! {
                selectionOxales["family"]?.append(name)
            }
            phylogeny[order]?[name]!.forEach {
                let genus = $0
                if !(selectionOxales["genus"]?.contains(genus))! {
                    selectionOxales["genus"]?.append(genus)
                }
            }
        } else {
            btnCephalotaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnCephalotus.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            
            btnCephalotaceae_default = false
            btnCephalotus_default = false
            
            selectionOxales["family"] = selectionOxales["family"]?.filter(){$0 != name}
            selectionOxales["genus"] = selectionOxales["genus"]?.filter {!phylogeny[order]![name]!.contains($0)}
            
            if selectionOxales["family"]!.count == 0 {
                btnOxales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnOxales_default = false
                selectionOxales["order"] = selectionOxales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickCephalotus(_ sender: UIButton) {
        let name = "Cephalotus"
        let order = "Oxales"
        let family = "Cephalotaceae"
        if !btnCephalotus_default {
            btnOxales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnCephalotaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnCephalotus.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnOxales_default = true
            btnCephalotaceae_default = true
            btnCephalotus_default = true
            
            selectionOxales["order"] = [order]
            if !(selectionOxales["family"]?.contains(family))! {
                selectionOxales["family"]?.append(family)
            }
            if !(selectionOxales["genus"]?.contains(name))! {
                selectionOxales["genus"]?.append(name)
            }
        } else {
            btnCephalotus.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnCephalotus_default = false
            selectionOxales["genus"] = selectionOxales["genus"]?.filter(){$0 != name}
            
            btnCephalotaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnCephalotaceae_default = false
            selectionOxales["family"] = selectionOxales["family"]?.filter(){$0 != family}
            
            if selectionOxales["family"]!.count == 0 {
                btnOxales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnOxales_default = false
                selectionOxales["order"] = selectionOxales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    
    // Poales
    //
    @IBAction func clickPoales(_ sender: UIButton) {
        let name = "Poales"
        if !btnPoales_default {
            checkboxPoales.forEach {
                $0.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            }
            btnPoales_default = true
            btnBromeliaceae_default = true
            btnBrocchinia_default = true
            btnCatopsis_default = true
            
            selectionPoales["order"] = [name]
            phylogeny[name]!.forEach {
                let family = $0.key
                let genus = $0.value
                selectionPoales["family"]?.append(family)
                genus.forEach {
                    selectionPoales["genus"]?.append($0)
                }
            }
        } else {
            checkboxPoales.forEach {
                $0.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            }
            btnPoales_default = false
            btnBromeliaceae_default = false
            btnBrocchinia_default = false
            btnCatopsis_default = false
            
            selectionPoales["order"] = []
            selectionPoales["family"] = []
            selectionPoales["genus"] = []
        }
        sendFilterSelection()
    }
    @IBAction func clickBromeliaceae(_ sender: UIButton) {
        let name = "Bromeliaceae"
        let order = "Poales"
        if !btnBromeliaceae_default {
            btnPoales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnBromeliaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnBrocchinia.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnCatopsis.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnPoales_default = true
            btnBromeliaceae_default = true
            btnBrocchinia_default = true
            btnCatopsis_default = true
            
            selectionPoales["order"] = [order]
            if !(selectionPoales["family"]?.contains(name))! {
                selectionPoales["family"]?.append(name)
            }
            phylogeny[order]?[name]!.forEach {
                let genus = $0
                if !(selectionPoales["genus"]?.contains(genus))! {
                    selectionPoales["genus"]?.append(genus)
                }
            }
        } else {
            btnBromeliaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnBrocchinia.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnCatopsis.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            
            btnBromeliaceae_default = false
            btnBrocchinia_default = false
            btnCatopsis_default = false
            
            selectionPoales["family"] = selectionPoales["family"]?.filter(){$0 != name}
            selectionPoales["genus"] = selectionPoales["genus"]?.filter {!phylogeny[order]![name]!.contains($0)}
            
            if selectionPoales["family"]!.count == 0 {
                btnPoales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnPoales_default = false
                selectionPoales["order"] = selectionPoales["order"]?.filter(){$0 != order}
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickBrocchinia(_ sender: UIButton) {
        let name = "Brocchinia"
        let order = "Poales"
        let family = "Bromeliaceae"
        if !btnBrocchinia_default {
            btnPoales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnBromeliaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnBrocchinia.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnPoales_default = true
            btnBromeliaceae_default = true
            btnBrocchinia_default = true
            
            selectionPoales["order"] = [order]
            if !(selectionPoales["family"]?.contains(family))! {
                selectionPoales["family"]?.append(family)
            }
            if !(selectionPoales["genus"]?.contains(name))! {
                selectionPoales["genus"]?.append(name)
            }
        } else {
            btnBrocchinia.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnBrocchinia_default = false
            selectionPoales["genus"] = selectionPoales["genus"]?.filter(){$0 != name}
            
            if !selectionPoales["genus"]!.contains("Catopsis") {
                btnBromeliaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnBromeliaceae_default = false
                selectionPoales["family"] = selectionPoales["family"]?.filter(){$0 != family}
                
                if selectionPoales["family"]!.count == 0 {
                    btnPoales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                    btnPoales_default = false
                    selectionPoales["order"] = selectionPoales["order"]?.filter(){$0 != order}
                }
            }
        }
        sendFilterSelection()
    }
    @IBAction func clickCatopsis(_ sender: UIButton) {
        let name = "Catopsis"
        let order = "Poales"
        let family = "Bromeliaceae"
        if !btnCatopsis_default {
            btnPoales.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnBromeliaceae.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            btnCatopsis.setImage(UIImage(named: "image_checkbox_on"), for: .normal)
            
            btnPoales_default = true
            btnBromeliaceae_default = true
            btnCatopsis_default = true
            
            selectionPoales["order"] = [order]
            if !(selectionPoales["family"]?.contains(family))! {
                selectionPoales["family"]?.append(family)
            }
            if !(selectionPoales["genus"]?.contains(name))! {
                selectionPoales["genus"]?.append(name)
            }
        } else {
            btnCatopsis.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
            btnCatopsis_default = false
            selectionPoales["genus"] = selectionPoales["genus"]?.filter(){$0 != name}
            
            if !selectionPoales["genus"]!.contains("Brocchinia") {
                btnBromeliaceae.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                btnBromeliaceae_default = false
                selectionPoales["family"] = selectionPoales["family"]?.filter(){$0 != family}
                
                if selectionPoales["family"]!.count == 0 {
                    btnPoales.setImage(UIImage(named: "image_checkbox_off"), for: .normal)
                    btnPoales_default = false
                    selectionPoales["order"] = selectionPoales["order"]?.filter(){$0 != order}
                }
            }
        }
        sendFilterSelection()
    }
}
