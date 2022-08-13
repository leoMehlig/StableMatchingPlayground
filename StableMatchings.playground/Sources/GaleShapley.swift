import SwiftUI

public struct GaleShapleyView: View {
    @ObservedObject var matchings: Matchings

    public init(_ matchings: Matchings) {
        self.matchings = matchings
    }


    public var body: some View {
        VStack {
            Code(selected: matchings.line)
                .padding(20)

            MatchingsView(matchings)
        }
        .background(Color.white)
        .allowsHitTesting(false)
        .frame(width: 700, height: 700)
    }
}

