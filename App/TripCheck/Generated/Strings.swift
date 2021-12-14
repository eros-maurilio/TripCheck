// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {

  internal enum Api {
    internal enum Query {
      /// drugA
      internal static let drugA = Strings.tr("Strings", "api.query.drugA")
      /// drugB
      internal static let drugB = Strings.tr("Strings", "api.query.drugB")
    }
    internal enum Url {
      /// https://tripbot.tripsit.me/api/
      internal static let base = Strings.tr("Strings", "api.url.base")
      /// tripsit/getInteraction/
      internal static let getInteraction = Strings.tr("Strings", "api.url.getInteraction")
    }
  }

  internal enum Sf {
    internal enum Symbols {
      /// chevron.left
      internal static let back = Strings.tr("Strings", "sf.Symbols.back")
      /// info.circle
      internal static let info = Strings.tr("Strings", "sf.Symbols.info")
      /// checkmark
      internal static let selected = Strings.tr("Strings", "sf.Symbols.selected")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
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
