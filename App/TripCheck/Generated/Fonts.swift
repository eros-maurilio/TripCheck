// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI

extension Font {
  public static func publicSans(_ style: PublicSansStyle, fixedSize: CGFloat) -> Font {
    return Font.custom(style.rawValue, fixedSize: fixedSize)
  }

  public static func publicSans(_ style: PublicSansStyle, size: CGFloat, relativeTo textStyle: TextStyle = .body) -> Font {
    return Font.custom(style.rawValue, size: size, relativeTo: textStyle)
  }

  public enum PublicSansStyle: String {
    case black = "PublicSans-Black"
    case blackItalic = "PublicSans-BlackItalic"
    case bold = "PublicSans-Bold"
    case boldItalic = "PublicSans-BoldItalic"
    case extraBold = "PublicSans-ExtraBold"
    case extraBoldItalic = "PublicSans-ExtraBoldItalic"
    case extraLight = "PublicSans-ExtraLight"
    case extraLightItalic = "PublicSans-ExtraLightItalic"
    case italic = "PublicSans-Italic"
    case light = "PublicSans-Light"
    case lightItalic = "PublicSans-LightItalic"
    case medium = "PublicSans-Medium"
    case mediumItalic = "PublicSans-MediumItalic"
    case regular = "PublicSans-Regular"
    case semiBold = "PublicSans-SemiBold"
    case semiBoldItalic = "PublicSans-SemiBoldItalic"
    case thin = "PublicSans-Thin"
    case thinItalic = "PublicSans-ThinItalic"
  }
}
