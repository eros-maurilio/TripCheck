// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.MyColor", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.MyColor
@available(*, deprecated, renamed: "ImageAsset.MyImage", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.MyImage

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Assets {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let blue = ColorAsset(name: "Blue")
  internal static let shadowColor = ColorAsset(name: "ShadowColor")
  internal static let gradientCautionBottom = ColorAsset(name: "GradientCautionBottom")
  internal static let gradientCautionTop = ColorAsset(name: "GradientCautionTop")
  internal static let gradientDangerousBottom = ColorAsset(name: "GradientDangerousBottom")
  internal static let gradientDangerousTop = ColorAsset(name: "GradientDangerousTop")
  internal static let gradientHomeBottom = ColorAsset(name: "GradientHomeBottom")
  internal static let gradientHomeTop = ColorAsset(name: "GradientHomeTop")
  internal static let gradientLowRiskDecreaseBottom = ColorAsset(name: "GradientLowRiskDecreaseBottom")
  internal static let gradientLowRiskDecreaseTop = ColorAsset(name: "GradientLowRiskDecreaseTop")
  internal static let gradientLowRiskNoSinergyBottom = ColorAsset(name: "GradientLowRiskNoSinergyBottom")
  internal static let gradientLowRiskNoSinergyTop = ColorAsset(name: "GradientLowRiskNoSinergyTop")
  internal static let gradientLowRiskSinergyBottom = ColorAsset(name: "GradientLowRiskSinergyBottom")
  internal static let gradientLowRiskSinergyTop = ColorAsset(name: "GradientLowRiskSinergyTop")
  internal static let gradientUnsafeBottom = ColorAsset(name: "GradientUnsafeBottom")
  internal static let gradientUnsafeTop = ColorAsset(name: "GradientUnsafeTop")
  internal static let alert = ImageAsset(name: "alert")
  internal static let death = ImageAsset(name: "death")
  internal static let decrease = ImageAsset(name: "decrease")
  internal static let heart = ImageAsset(name: "heart")
  internal static let icon = ImageAsset(name: "icon")
  internal static let sinergy = ImageAsset(name: "sinergy")
  internal static let stable = ImageAsset(name: "stable")
  internal static let symptom = ImageAsset(name: "symptom")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias MyColor = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias MyColor = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: MyColor = {
    guard let color = MyColor(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> MyColor {
    let bundle = BundleToken.bundle
    guard let color = MyColor(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.MyColor {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias MyImage = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias MyImage = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: MyImage {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = MyImage(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = MyImage(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> MyImage {
    let bundle = BundleToken.bundle
    guard let result = MyImage(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.MyImage {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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

