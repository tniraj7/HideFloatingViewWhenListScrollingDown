import SwiftUI

struct FloatingView: View {
    @Binding var isVisible: Bool

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("Floating View")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding()
                    .frame(width: geometry.size.width)
                    .offset(y: isVisible ? 0 : geometry.size.height)
                    .animation(.spring(response: 0.7, dampingFraction: 0.7), value: isVisible)
            }
        }
    }
}
