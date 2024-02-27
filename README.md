# shopping-app
The project includes 3 layers:
- Domain Layer: it contains the core business logic and rules reside. It includes Repository protocol, Model and Use Case
- Data Layer: it contains the implementation of the repository as well as data sources, both from local sources (such as SwiftData, etc.) and remote sources (APIs).
- Presentation: it focuses on how the information is displayed and interacted with by users. In this case, presentation layer would contain screens and its view model.

Note: 
- SwiftData does not support visionOS platform
