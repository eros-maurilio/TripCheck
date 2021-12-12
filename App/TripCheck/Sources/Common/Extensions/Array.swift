import Foundation

extension Array {
    func safeElement(atIndex index: Int) -> Element? {
        if index >= 0 && index < self.count {
            return self[index]
        }
        return nil
    }
}
