import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var substances = ["2C-T-X",
                                 "2C-X",
                                 "5-MeO-xxT",
                                 "Alcohol",
                                 "Amphetamines",
                                 "Benzodiazepines",
                                 "Caffeine",
                                 "Cannabis",
                                 "Cocaine",
                                 "DMT",
                                 "DOx",
                                 "DXM",
                                 "GHB/GBL",
                                 "Ketamine",
                                 "LSD",
                                 "MAOIs",
                                 "MDMA",
                                 "MXE",
                                 "Mescaline",
                                 "Mushrooms",
                                 "NBOMes",
                                 "Nitrous",
                                 "Opioids",
                                 "SSRIs",
                                 "Tramadol"]
    @Published var spacing: CGFloat = 20
    @Published var padding: CGFloat = 20
    @Published var alignmentIndex = 0
    
    let alignments: [HorizontalAlignment] = [.leading, .center, .trailing]
    
    var alignment: HorizontalAlignment {
        alignments[alignmentIndex]
    }
}
