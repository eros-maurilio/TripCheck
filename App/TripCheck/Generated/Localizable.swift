// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localizable {

  internal enum Combination {
    internal enum Alert {
      /// Ok
      internal static let action = Localizable.tr("Localizable", "combination.alert.action")
      /// The information available here is for quick reference, it is recommended that further research be done so that you can make the best decision.
      /// Furthermore, all data comes from Tripsit.
      internal static let text = Localizable.tr("Localizable", "combination.alert.text")
      /// Important
      internal static let title = Localizable.tr("Localizable", "combination.alert.title")
    }
  }

  internal enum Home {
    internal enum Button {
      /// Trip Check
      internal static let text = Localizable.tr("Localizable", "home.button.text")
    }
    internal enum Subtitle {
      /// Select two substances to see how they interact
      internal static let text = Localizable.tr("Localizable", "home.subtitle.text")
    }
    internal enum Title {
      /// Harm Reduction
      internal static let text = Localizable.tr("Localizable", "home.title.text")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localizable {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
