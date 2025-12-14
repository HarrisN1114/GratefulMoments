import SwiftUI
import SwiftData

struct MomentsView: View {
    @State private var showCreateMoment = false
    @Query(sort: \Moment.timestamp)
    private var moments: [Moment]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                pathItems
                    .frame(maxWidth: .infinity)
            }
            .overlay {
                if moments.isEmpty {
                    ContentUnavailableView {
                        Label("No moments yet!", systemImage: "exclaimationmark.circle.fill")
                    } description: {
                        Text("Post a note or photo to start fillin this space with gratitide.")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showCreateMoment = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showCreateMoment) {
                        MomentEntryView()
                    }
                }
            }
            .navigationTitle("Grateful Moments")
        }
    }
    
    private var pathItems: some View {
        ForEach(moments) { moment in
            NavigationLink {
                MomentDetailView(moment: moment)
            } label: {
                Text(moment.title)
            }
        }
    }
}

#Preview {
    MomentsView()
        .sampleDataContainer()
}

#Preview("No Moment") {
    MomentsView()
        .modelContainer(for: [Moment.self])
}
