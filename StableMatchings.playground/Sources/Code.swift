//
//  Code.swift
//  StableMatchings
//
//  Created by Leonard Mehlig on 13.04.21.
//

import SwiftUI

struct Code: View {

    var selected: Int?

    @Namespace var namespace
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            (Text("while let")
                .foregroundColor(.keyword)
                .fontWeight(.semibold)
            + Text(" human = ")
            + Text("matchings.firstFreeHuman")
                .foregroundColor(.method)
            + Text("(),"))
                .highlight(selected == 0, in: namespace)

            (Text("let")
                .foregroundColor(.keyword)
                .fontWeight(.semibold)
             + Text(" animal = ")
             + Text("matchings.firstUnproposedAnimal")
                .foregroundColor(.method)
                + Text("(for: human) {"))
                .highlight(selected == 1, in: namespace)

                .padding(.leading, 43)

            (Text("if")
                .foregroundColor(.keyword)
                .fontWeight(.semibold)
                + Text(" matchings.propose")
                    .foregroundColor(.method)
             + Text("(human, to: animal) {"))
                .highlight(selected == 2, in: namespace)

                .padding(.leading, 30)

            (Text("matchings.accepted")
                .foregroundColor(.method)
            + Text("(human, by: animal)"))
                .highlight(selected == 3, in: namespace)

                .padding(.leading, 60)
            Group {
                (Text("}")
                    + Text(" else ")
                    .foregroundColor(.keyword)
                    .fontWeight(.semibold)
                    + Text("{"))
                    .highlight(false, in: namespace)
                    .padding(.leading, 30)
                (Text("matchings.rejected")
                    .foregroundColor(.method)
                    + Text("(human, by: animal)"))
                    .highlight(selected == 4, in: namespace)

                    .padding(.leading, 60)
                Text("}")
                    .highlight(false, in: namespace)
                    .padding(.leading, 30)
                Text("}")
                    .highlight(false, in: namespace)
                Text("")
                    .highlight(false, in: namespace)
                (Text("matchings.finished")
                    .foregroundColor(.method)
                    + Text("()"))
                    .highlight(selected == 5, in: namespace)
                 
            }
        }
        .lineLimit(1)
        .foregroundColor(.black)
        .font(.system(size: 12, weight: .regular, design: .monospaced))
        .animation(.spring())
    }
}

extension View {
    func highlight(_ flag: Bool, in namespace: Namespace.ID) -> some View {
        self
            .padding(4)
            .background(Group {
                if flag {
                    Color.gray
                        .opacity(0.5)
                        .cornerRadius(4)
                        .matchedGeometryEffect(id: "code", in: namespace)
                }
            })
    }
}

extension Color {
    static var keyword: Color {
        Color(.sRGB,
              red: 155 / 255,
              green: 35 / 255,
              blue: 147 / 255,
              opacity: 1)
    }

    static var method: Color {
        Color(.sRGB,
              red: 50 / 255,
              green: 109 / 255,
              blue: 116 / 255,
              opacity: 1)
    }
}

struct Code_Previews: PreviewProvider {
    static var previews: some View {
        Code(selected: nil)
            .previewLayout(.fixed(width: 500, height: 200))
    }
}
