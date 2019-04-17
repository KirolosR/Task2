//
//  ViewController.swift
//  Task2
//
//  Created by Kirolos on 4/3/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import UIKit
import iOSDropDown

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var regLabel: UILabel!
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var byClickLabel: UILabel!
    @IBOutlet weak var termsAndCodition: UIButton!
    
    
    
   
    @IBOutlet weak var menuHC: NSLayoutConstraint!
    @IBOutlet weak var CityHC: NSLayoutConstraint!
    @IBOutlet weak var AreaHC: NSLayoutConstraint!
    @IBOutlet weak var CodeHC: NSLayoutConstraint!
    
    @IBOutlet weak var counteryMenu: UITableView!
    @IBOutlet weak var cityMenu: UITableView!
    @IBOutlet weak var areaMenu: UITableView!
    @IBOutlet weak var codeMenu: UITableView!
    
    
    @IBOutlet weak var countryMenuBtn: UIButton!
    @IBOutlet weak var cityMenuBtn: UIButton!
    @IBOutlet weak var areaMenuBtn: UIButton!
    @IBOutlet weak var codeMenuBtn: UIButton!
    
    var countries : [Country] = []
    var cities : [City] = []
    var areas : [Area] = []
    var codes : [String] = []
    
    var isVisible = false
    var isCityVisible = false
    var isAreaVisible = false
    var isCodeVisible = false
    
    var citiesUrl = ""
    var areaUrl = ""
    
    var isArabic = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if(UIScreen.main.bounds.width <= 320)
        {
              byClickLabel.font = UIFont.systemFont(ofSize: 11)
             termsAndCodition.titleLabel?.font =  UIFont.systemFont(ofSize: 11)
        }
        
       termsAndCodition.titleLabel?.adjustsFontSizeToFitWidth = true
       byClickLabel.adjustsFontSizeToFitWidth = true
       counteryMenu.delegate = self
       counteryMenu.dataSource = self
       menuHC.constant = 0
        
       cityMenu.delegate = self
       cityMenu.dataSource = self
       CityHC.constant = 0
        
       areaMenu.delegate = self
       areaMenu.dataSource = self
       AreaHC.constant = 0
        
       codeMenu.delegate = self
       codeMenu.dataSource = self
       CodeHC.constant = 0
        
          loadCountries()
            
    }
    
    
    
    func loadCountries ()
    {
       // DispatchQueue.main.async{
            getData.instance.getCountries(Url: COUNTRIES_URL, completion: { (Success) in
                if(Success){
                    debugPrint("Success!")
                    self.countries = getData.countries!
                    self.counteryMenu.reloadData()
                    
                    for i in 0...(self.countries.count - 1) {
                        self.codes.append(self.countries[i].Code!)
                    }
                    self.codeMenu.reloadData()
                }
            })
         //   DispatchQueue.main.async(execute: self.finishThread)
      //  }
       
    }
    
    func loadCities ()
    {
        // DispatchQueue.main.async{
        getData.instance.getCities(Url: citiesUrl, completion: { (Success) in
            if(Success){
                debugPrint("Success!")
                self.cities = getData.cities!
                self.cityMenu.reloadData()
            }
        })
        //   DispatchQueue.main.async(execute: self.finishThread)
        //  }
        
    }
    
    func loadAreas()
    {
        // DispatchQueue.main.async{
        getData.instance.getAreas(Url: areaUrl, completion: { (Success) in
            if(Success){
                debugPrint("Success!")
                self.areas = getData.areas!
                self.areaMenu.reloadData()
            }
        })
        //   DispatchQueue.main.async(execute: self.finishThread)
        //  }
        
    }
    
    
    
    func finishThread(){
      //  self.spin.isHidden = true
       // self.spin.stopAnimating()
      
    }
        
    @IBAction func countryMenuPressed(_ sender: Any) {
        
        
        UIView.animate(withDuration: 0.5 )
        {
            if(self.isVisible == false) {
                self.isVisible = true
                self.menuHC.constant = 44.0 * 3.0
            }
            else {
                self.menuHC.constant = 0
                self.isVisible = false
            }
            self.view.layoutIfNeeded()
        }
        
        
    }
    
    
   
    @IBAction func cityMenuPressed(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5 )
        {
            if(self.isCityVisible == false) {
                self.isCityVisible = true
                self.CityHC.constant = 44.0 * 3.0
            }
            else {
                self.CityHC.constant = 0
                self.isCityVisible = false
            }
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    @IBAction func areaMenuPressed(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5 )
        {
            if(self.isAreaVisible == false) {
                self.isAreaVisible = true
                self.AreaHC.constant = 44.0 * 3.0
            }
            else {
                self.AreaHC.constant = 0
                self.isAreaVisible = false
            }
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    @IBAction func codeMenuPressed(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5 )
        {
            if(self.isCodeVisible == false) {
                self.isCodeVisible = true
                self.CodeHC.constant = 44.0 * 3.0
            }
            else {
                self.CodeHC.constant = 0
                self.isCodeVisible = false
            }
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == counteryMenu
        {
        return countries.count
        }
        else if tableView == cityMenu
        {
          return cities.count
        }
        else if tableView == areaMenu
        {
            return areas.count
        }
        else if tableView == codeMenu
        {
            return codes.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == counteryMenu ,
            let cell = counteryMenu.dequeueReusableCell(withIdentifier: "Country", for: indexPath) as? menuItem {
        if(isArabic)
        {
          cell.CountryLabel.text = countries[indexPath.row].TitleAR
          cell.CountryLabel.font = UIFont(name: "GE Dinar One Medium.ttf", size: 17)
          cell.CountryLabel.textAlignment = .right
        }
        else
        {
           cell.CountryLabel.text = countries[indexPath.row].TitleEN
           cell.CountryLabel.font = UIFont(name: "Montserrat-Regular.ttf", size: 17)
           cell.CountryLabel.textAlignment = .left
        }
        return cell
          }
        else if tableView == cityMenu ,
        let cell = cityMenu.dequeueReusableCell(withIdentifier: "City", for: indexPath) as? menuItem {
            if(isArabic){
                cell.CityLabel.text = cities[indexPath.row].TitleAR
                cell.CityLabel.font = UIFont(name: "GE Dinar One Medium.ttf", size: 17)
                cell.CityLabel.textAlignment = .right
            }
            else
            {
                cell.CityLabel.text = cities[indexPath.row].TitleEN
                cell.CityLabel.font = UIFont(name: "Montserrat-Regular.ttf", size: 17)
                cell.CityLabel.textAlignment = .left
            }
            return cell
        }
        else if tableView == areaMenu ,
            let cell = areaMenu.dequeueReusableCell(withIdentifier: "Area", for: indexPath) as? menuItem {
            if(isArabic)
            {
                cell.AreaLabel.text = areas[indexPath.row].FullTitleAR
                cell.AreaLabel.font = UIFont(name: "GE Dinar One Medium.ttf", size: 17)
                cell.AreaLabel.textAlignment = .right
            }
            else
            {
                 cell.AreaLabel.text = areas[indexPath.row].FullTitleEN
                 cell.AreaLabel.font = UIFont(name: "Montserrat-Regular.ttf", size: 17)
                 cell.AreaLabel.textAlignment = .left
            }
            return cell
        }
        else if tableView == codeMenu ,
            let cell = codeMenu.dequeueReusableCell(withIdentifier: "Code", for: indexPath) as? menuItem {
            cell.CodeLabel.text = codes[indexPath.row]
            if(isArabic)
            {
              cell.CodeLabel.textAlignment = .right
            }
            else
            {
              cell.CodeLabel.textAlignment = .left
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == counteryMenu {
        if(isArabic)
        {
           countryMenuBtn.setTitle(countries[indexPath.row].TitleAR, for: .normal)
        }
        else {
        countryMenuBtn.setTitle(countries[indexPath.row].TitleEN, for: .normal)
         }
        counteryMenu.deselectRow(at: indexPath, animated: true)
        UIView.animate(withDuration: 0.5 )
        {
            self.menuHC.constant = 0
            self.isVisible = false
            self.view.layoutIfNeeded()
        }
        self.citiesUrl = "\(CITIES_URL)\(indexPath.row)"
        loadCities()
        
      }
        else  if tableView == cityMenu {
            if(isArabic)
            {
              cityMenuBtn.setTitle(cities[indexPath.row].TitleAR, for: .normal)
            }
            else {
             cityMenuBtn.setTitle(cities[indexPath.row].TitleEN, for: .normal)
            }
            cityMenu.deselectRow(at: indexPath, animated: true)
            UIView.animate(withDuration: 0.5 )
            {
                self.CityHC.constant = 0
                self.isCityVisible = false
                self.view.layoutIfNeeded()
            }
           self.areaUrl = "\(AREAS_URL)\(indexPath.row)"
            loadAreas()
        }
        
        else  if tableView == areaMenu {
            if(isArabic)
            {
               areaMenuBtn.setTitle(areas[indexPath.row].FullTitleAR, for: .normal)
            }
            else {
            areaMenuBtn.setTitle(areas[indexPath.row].FullTitleEN, for: .normal)
            }
            areaMenu.deselectRow(at: indexPath, animated: true)
            UIView.animate(withDuration: 0.5 )
            {
                self.AreaHC.constant = 0
                self.isAreaVisible = false
                self.view.layoutIfNeeded()
            }
            // self.citiesUrl = "\(CITIES_URL)\(indexPath.row)"
            
        }
        else  if tableView == codeMenu {
            codeMenuBtn.setTitle(codes[indexPath.row], for: .normal)
            if(isArabic) {
              countryMenuBtn.setTitle(countries[indexPath.row].TitleAR, for: .normal)
            }
            else {
            countryMenuBtn.setTitle(countries[indexPath.row].TitleEN, for: .normal)
            }
            codeMenu.deselectRow(at: indexPath, animated: true)
            UIView.animate(withDuration: 0.5 )
            {
                self.CodeHC.constant = 0
                self.isCodeVisible = false
                self.view.layoutIfNeeded()
            }
            self.citiesUrl = "\(CITIES_URL)\(indexPath.row)"
            loadCities()
            
        }
        
    }
    
    @IBAction func changePressed(_ sender: Any) {
       
       if(!isArabic)
      {
            regLabel.text = "تسجيل"
            regLabel.font = UIFont(name: "GE Dinar One Medium.ttf", size: 17)
            fullName.placeholder = "الاسم بالكامل"
            fullName.textAlignment = .right
            fullName.font = UIFont(name: "GE Dinar One Medium.ttf", size: 17)
            password.placeholder = "الباسورد"
            password.textAlignment = .right
            codeMenuBtn.setTitle("كود", for: .normal)
            codeMenuBtn.setBackgroundImage(#imageLiteral(resourceName: "list_small_ar"), for: .normal)
            codeMenuBtn.contentHorizontalAlignment = .right
            number.placeholder = "١٢٣٤٥"
            number.textAlignment = .right
            number.font = UIFont(name: "GE Dinar One Medium.ttf", size: 17)
            email.placeholder = "إيميل"
            email.textAlignment = .right
            email.font = UIFont(name: "GE Dinar One Medium.ttf", size: 17)
            countryMenuBtn.setTitle("الدولة", for: .normal)
            countryMenuBtn.setBackgroundImage(#imageLiteral(resourceName: "list_ar"), for: .normal)
            countryMenuBtn.contentHorizontalAlignment = .right
            cityMenuBtn.setTitle("المدينة", for: .normal)
            cityMenuBtn.setBackgroundImage(#imageLiteral(resourceName: "list_ar"), for: .normal)
            cityMenuBtn.contentHorizontalAlignment = .right
            areaMenuBtn.setTitle("المنظقة", for: .normal)
            areaMenuBtn.setBackgroundImage( #imageLiteral(resourceName: "list_ar"), for: .normal)
            areaMenuBtn.contentHorizontalAlignment = .right
            counteryMenu.reloadData()
            cityMenu.reloadData()
            areaMenu.reloadData()
            stack.semanticContentAttribute = .forceRightToLeft
          // let centerVertically = NSLayoutConstraint(item: stack, attribute: .centerX,relatedBy: .equal,toItem: view,attribute: .centerX, multiplier: 1.0, constant: 0.0)
           // NSLayoutConstraint.activate([centerVertically])
            byClickLabel.textAlignment = .right
            byClickLabel.font = UIFont(name: "GE Dinar One Medium.ttf", size: 14)
            byClickLabel.text = "عند اختيار تسجيل فانت توافق على"
            byClickLabel.adjustsFontSizeToFitWidth = true
            termsAndCodition.setTitle("الشروط والاحكام", for: .normal)
            termsAndCodition.titleLabel?.font = UIFont(name: "GE Dinar One Medium.ttf", size: 14)
            termsAndCodition.contentHorizontalAlignment = .right
            termsAndCodition.titleLabel?.adjustsFontSizeToFitWidth = true
            if(UIScreen.main.bounds.width <= 320)
            {
                byClickLabel.font = UIFont.systemFont(ofSize: 13)
                termsAndCodition.titleLabel?.font =  UIFont.systemFont(ofSize: 13)
            }
        
            isArabic = true
        }
      else
       {
            regLabel.text = "RIGETER"
            regLabel.font = UIFont(name: "Montserrat-Regular.ttf", size: 17)
            fullName.placeholder = "Full Name"
            fullName.font = UIFont(name: "Montserrat-Regular.ttf", size: 17)
            fullName.textAlignment = .left
            password.placeholder = "Password"
            password.textAlignment = .left
            codeMenuBtn.setTitle(" Code", for: .normal)
            codeMenuBtn.setBackgroundImage(#imageLiteral(resourceName: "list_small_en"), for: .normal)
            codeMenuBtn.contentHorizontalAlignment = .left
            number.placeholder = "12345"
            number.textAlignment = .left
            number.font = UIFont(name: "Montserrat-Regular.ttf", size: 17)
            email.placeholder = "Email"
            email.textAlignment = .left
            email.font = UIFont(name: "Montserrat-Regular.ttf", size: 17)
            countryMenuBtn.setTitle(" Country", for: .normal)
            countryMenuBtn.setBackgroundImage(#imageLiteral(resourceName: "list_en"), for: .normal)
            countryMenuBtn.contentHorizontalAlignment = .left
            cityMenuBtn.setTitle(" City", for: .normal)
            cityMenuBtn.setBackgroundImage(#imageLiteral(resourceName: "list_en"), for: .normal)
            cityMenuBtn.contentHorizontalAlignment = .left
            areaMenuBtn.setTitle(" Area", for: .normal)
            areaMenuBtn.setBackgroundImage( #imageLiteral(resourceName: "list_en"), for: .normal)
            areaMenuBtn.contentHorizontalAlignment = .left
            counteryMenu.reloadData()
            cityMenu.reloadData()
            areaMenu.reloadData()
            stack.semanticContentAttribute = .forceLeftToRight
            byClickLabel.textAlignment = .left
            byClickLabel.font = UIFont(name: "Montserrat-Regular.ttf", size: 14)
            byClickLabel.text = "By clicking rigester you agree to"
            byClickLabel.adjustsFontSizeToFitWidth = true
            termsAndCodition.setTitle("Terms and Condition", for: .normal)
            termsAndCodition.titleLabel?.font =  UIFont(name: "Montserrat-Regular.ttf", size: 14)
            termsAndCodition.contentHorizontalAlignment = .left
            termsAndCodition.titleLabel?.adjustsFontSizeToFitWidth = true
            termsAndCodition.titleLabel?.adjustsFontForContentSizeCategory = true
            if(UIScreen.main.bounds.width <= 320)
            {
                byClickLabel.font = UIFont.systemFont(ofSize: 11)
                termsAndCodition.titleLabel?.font =  UIFont.systemFont(ofSize: 11)
            }
        
            isArabic = false
       }
        
        
    }
    
    @IBAction func terms(_ sender: Any) {
        performSegue(withIdentifier: "terms", sender: nil)
    }
    
}






