import SwiftData

class DataContainer {
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    init() {
        let schema = Schema([
            Moment.self,
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            try context.save()
        } catch {
            fatalError("Could not create ModelConatiner \(error)")
        }
    }
}
