import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Moments", image: "MomentsTab") {
                MomentsView()
            }
            Tab("Achievements", systemImage: "medal.fill") {
                AchievementsView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .sampleDataContainer()
}

#Preview("Dark Mode") {
    ContentView()
        .sampleDataContainer()
        .preferredColorScheme(.dark)
}
