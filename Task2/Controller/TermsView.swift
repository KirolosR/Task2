//
//  TermsView.swift
//  Task2
//
//  Created by Kirolos on 4/6/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import UIKit


class TermsView: UIViewController  {
    
    

    @IBAction func back(_ sender: Any) {
        
        performSegue(withIdentifier: "Back", sender: nil)
    }
    
   
    @IBOutlet weak var webView: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string : TERMS_URL)
        let request = NSURLRequest.init(url: url as! URL)
        webView.loadRequest(request as URLRequest);
      

    }

   
    
  
    
    
    
    
}
