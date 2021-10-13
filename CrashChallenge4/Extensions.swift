//
//  Extensions.swift
//  CrashChallenge4
//
//  Created by Eros Maurilio on 07/10/21.
//

import Foundation
import SwiftUI

extension Color {
    public static var deepBlue: Color { Color("Blue") }
    
    public static var shadowColor: Color { Color("ShadowColor") }
    
    public static var gradientHomeTop: Color { Color("GradientHomeTop") }
    
    public static var gradientHomeBot: Color { Color("GradientHomeBottom") }
    
    public static var gradientDangerTop: Color { Color ("GradientDangerousTop") }
    
    public static var gradientDangerBot: Color { Color("GradientDangerousBottom") }
    
    public static var gradientUnsafeTop: Color { Color("GradientUnsafeTop") }
    
    public static var gradientUnsafeBot: Color { Color("GradientUnsafeBottom") }
    
    public static var gradientCautionTop: Color { Color("GradientCautionTop") }
                                                     
    public static var gradientCautionBot: Color { Color("GradientCautionBottom") }
    
    public static var gradientLowRiskDecreaseTop: Color { Color("GradientLowRiskDecreaseTop") }
    
    public static var gradientLowRiskDecreaseBot: Color { Color("GradientLowRiskDecreaseBottom") }
    
    public static var gradientLowRiskSinergyTop: Color { Color("GradientLowRiskSinergyTop") }
    
    public static var gradientLowRisKSinergyBot: Color { Color("GradientLowRiskSinergyBottom") }
    
    public static var gradientLowRiskNoSinergyTop: Color { Color("GradientLowRiskNoSinergyTop") }
    
    public static var gradientLowRisKNoSinergyBot: Color { Color("GradientLowRiskNoSinergyBottom") }
    
}

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
