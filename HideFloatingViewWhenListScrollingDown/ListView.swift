import SwiftUI

struct ListView: View {
    
    @State private var scrollOffset: CGFloat = 0
    @State private var scrollDirection: ScrollDirection = .up
    private let SCROLLVIEW_COORDINATE_SPACE = "scrollView"

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollViewReader { scrollViewProxy in
                ScrollView {
                    GeometryReader { geometry in
                        Color.red
                            .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named(SCROLLVIEW_COORDINATE_SPACE)).minY)
                    }
                    .frame(height: 1)
                    .offset(y: -8)
                    VStack {
                        ForEach(1...60, id: \.self) { index in
                            Text("Item \(index)")
                                .frame(height: 100)
                        }
                    }
                    .padding()

                    GeometryReader { geometry in
                        Color.green
                            .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named(SCROLLVIEW_COORDINATE_SPACE)).minY)
                    }
                    .frame(height: 1)
                    .offset(y: 8)
                }
                .coordinateSpace(name: SCROLLVIEW_COORDINATE_SPACE)
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    let delta = value - scrollOffset
                    scrollOffset = value
                    scrollDirection = (delta < 0 ) ? .up : .down
                }
            }
            FloatingView(isVisible: .constant(scrollDirection == .down))
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
