# AVOD - iOS Technical Assessment

A modern iOS application built with **SwiftUI**, **MVVM + Clean Architecture**, and **Swift Concurrency** to display a video-on-demand catalog.

## 📱 Project Overview

This application fetches and displays a collection of video content from a remote API, presenting it in a user-friendly interface with horizontal scrolling sections, similar to popular streaming platforms like Netflix or BBC iPlayer.

### Key Features

- ✅ **Modern Architecture**: MVVM + Clean Architecture with clear separation of concerns
- ✅ **SwiftUI**: Declarative UI with `@Observable` macro (iOS 17+)
- ✅ **Swift Concurrency**: Async/await for network operations
- ✅ **Dependency Injection**: Protocol-based DI for testability
- ✅ **Unit Tests**: Comprehensive test coverage across all layers
- ✅ **Dynamic Layouts**: Adaptive card sizes based on aspect ratios (16:9, 2:3)
- ✅ **Error Handling**: Graceful error states with user feedback
- ✅ **Loading States**: Progress indicators during data fetching

---

## 🏗️ Architecture

### Clean Architecture + MVVM

```
┌─────────────────────────────────────────────────────┐
│                 Presentation Layer                  │
│  ┌──────────────┐         ┌──────────────────────┐ │
│  │  SwiftUI     │────────▶│  HomePageViewModel   │ │
│  │  Views       │         │  (@Observable)       │ │
│  └──────────────┘         └──────────────────────┘ │
└────────────────────────────────┬────────────────────┘
                                 │
┌────────────────────────────────▼────────────────────┐
│                   Domain Layer                      │
│  ┌──────────────────────────────────────────────┐  │
│  │  FetchHomePageUseCase                        │  │
│  │  (Business Logic)                            │  │
│  └──────────────────────────────────────────────┘  │
└────────────────────────────────┬────────────────────┘
                                 │
┌────────────────────────────────▼────────────────────┐
│                    Data Layer                       │
│  ┌──────────────────┐      ┌──────────────────┐    │
│  │ HomeRepository   │─────▶│ NetworkService   │    │
│  │                  │      │                  │    │
│  └──────────────────┘      └──────────────────┘    │
└─────────────────────────────────────────────────────┘
```

### Project Structure

```
AVOD/
├── Domain/
│   ├── Entities/                    # Data Models
│   │   ├── AVODHomePage.swift
│   │   ├── Record.swift
│   │   ├── Page.swift
│   │   ├── Sections.swift
│   │   ├── Items.swift
│   │   ├── Collection.swift
│   │   ├── Accessibility.swift
│   │   └── Metadata.swift
│   └── UseCases/                    # Business Logic
│       └── FetchHomePageUseCase.swift
│
├── Data/
│   ├── Network/                     # Networking Layer
│   │   └── NetworkService.swift
│   └── Repositories/                # Data Management
│       └── HomeRepository.swift
│
├── Presentation/
│   └── Home/
│       ├── View/
│       │   ├── HomeView.swift
│       │   ├── ContentView-Home.swift
│       │   └── Components/
│       │       ├── ItemCardView.swift
│       │       ├── SectionRowView.swift
│       │       └── BadgeView.swift
│       └── ViewModel/
│           └── HomePageViewModel.swift
│
├── DependencyInjection/
│   └── DIContainer.swift            # Dependency Injection
│
└── AVODTests/                        # Unit Tests
    ├── HomeRepositoryTests.swift
    ├── FetchHomePageUseCaseTests.swift
    ├── HomePageViewModelTests.swift
    └── ModelExtensions+Testing.swift
```

---

## 🛠️ Technical Stack

| Category | Technology |
|----------|-----------|
| **Language** | Swift 5.9+ |
| **UI Framework** | SwiftUI |
| **Architecture** | MVVM + Clean Architecture |
| **Concurrency** | Swift Async/Await, MainActor |
| **Dependency Injection** | Protocol-based DI |
| **Networking** | URLSession |
| **Testing** | XCTest |
| **Minimum iOS** | iOS 17.0+ |
| **Xcode** | Xcode 15.0+ |

---

## 🚀 Getting Started

### Prerequisites

- macOS Ventura (13.0) or later
- Xcode 15.0 or later
- iOS 17.0+ (Simulator or Device)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/AVOD.git
   cd AVOD
   ```

2. **Open in Xcode**
   ```bash
   open AVOD.xcodeproj
   ```

3. **Build and Run**
   - Select a simulator or device
   - Press `Cmd + R` to run
   - Or `Product → Run`

4. **Run Tests**
   ```bash
   # Run all tests
   Cmd + U
   
   # Or via command line
   xcodebuild test -scheme AVOD -destination 'platform=iOS Simulator,name=iPhone 15'
   ```

---

## 📡 API Details

### Endpoint
```
https://api.jsonbin.io/v3/b/69df608e36566621a8b675e1
```

### Response Structure
```json
{
  "record": {
    "page": {
      "id": "string",
      "name": "string",
      "imageUrl": "string",
      "adServed": boolean
    },
    "sections": [
      {
        "id": "string",
        "name": "string",
        "collection": {
          "imageAspectRatio": "16x9" | "2x3"
        },
        "items": [
          {
            "id": "string",
            "title": "string",
            "imageUrl": "string",
            "badges": ["string"]
          }
        ]
      }
    ]
  },
  "metadata": { ... }
}
```

---

## 🧪 Testing

### Test Coverage

The project includes comprehensive unit tests for all business logic layers:

```
✅ HomeRepositoryTests (3 tests)
   - Success response handling
   - Network error propagation
   - URL validation

✅ FetchHomePageUseCaseTests (3 tests)
   - Successful data retrieval
   - Error handling
   - Repository call verification

✅ HomePageViewModelTests (6 tests)
   - Initial state validation
   - Loading state management
   - Success data binding
   - Error message handling
   - Error state clearing
   - UseCase integration
```

### Running Tests

```bash
# Run all tests
xcodebuild test -scheme AVOD -destination 'platform=iOS Simulator,name=iPhone 15'

# Run with coverage
xcodebuild test -scheme AVOD -destination 'platform=iOS Simulator,name=iPhone 15' -enableCodeCoverage YES
```

### Code Coverage

To view code coverage in Xcode:
1. Edit Scheme → Test → Options
2. Enable "Code Coverage"
3. Run tests (`Cmd + U`)
4. View Report Navigator (`Cmd + 9`) → Coverage tab

**Target Coverage**: 70-80%

---

## 🎨 UI Features

### Dynamic Card Layouts

The app supports multiple aspect ratios:
- **16:9 (Landscape)**: 240x135pt cards for landscape content
- **2:3 (Portrait)**: 160x240pt cards for portrait content

### Components

1. **HomeView**: Main container with loading/error/success states
2. **ContentView**: Displays page title and sections
3. **SectionRowView**: Horizontal scrolling section with title
4. **ItemCardView**: Individual content card with:
   - AsyncImage for thumbnails
   - Title with line limit
   - Badge overlay (e.g., "RECENTLY ADDED")

### UI States

- **Loading**: `ProgressView` with loading indicator
- **Success**: Scrollable sections with content cards
- **Error**: Error icon + message with retry option
- **Empty**: "No data available" placeholder

---

## 🔑 Key Design Decisions

### 1. Clean Architecture
**Why**: Separates concerns, improves testability, and makes the codebase maintainable and scalable.

### 2. Protocol-Based Dependency Injection
**Why**: Enables easy mocking for unit tests and allows swapping implementations without changing dependent code.

### 3. Swift Concurrency (Async/Await)
**Why**: Modern, readable asynchronous code that's easier to understand than completion handlers or Combine.

### 4. @Observable Macro
**Why**: Simplifies state management in SwiftUI with less boilerplate than `@Published` properties.

### 5. Generic NetworkService
**Why**: Reusable across different endpoints and response types, reducing code duplication.

### 6. Factory Pattern for Tests
**Why**: Simplifies test data creation by using JSON decoding (the actual data flow).

---

## 🐛 Error Handling

### Network Errors

```swift
enum NetworkError: Error {
    case invalidURL
    case noData
    case invalidResponse(statusCode: Int)
    case decodingError(Error)
    case networkError(Error)
}
```

### User-Facing Errors

- Clear error messages displayed in the UI
- Error icon for visual feedback
- Descriptive text explaining the issue
- Future: Retry button for failed requests

---

## 🔮 Future Enhancements

### High Priority
- [ ] Detail view when tapping content items
- [ ] Pull-to-refresh functionality
- [ ] Retry button on error state
- [ ] Search and filter capabilities

### Medium Priority
- [ ] Image caching for better performance
- [ ] Pagination for large datasets
- [ ] Hero/featured banner section
- [ ] Share functionality

### Low Priority
- [ ] Dark mode optimization
- [ ] Accessibility improvements (VoiceOver)
- [ ] UI tests
- [ ] Offline mode with local caching

---

## 📝 Assignment Checklist

- [x] Fetch data from provided API endpoint
- [x] Parse JSON response into Swift models
- [x] Display content in scrollable sections
- [x] Handle different image aspect ratios
- [x] Show loading states during network requests
- [x] Display error states gracefully
- [x] Implement MVVM architecture
- [x] Apply Clean Architecture principles
- [x] Write unit tests for business logic
- [x] Use protocol-based dependency injection
- [x] Use Swift Concurrency (async/await)
- [x] Create reusable UI components
- [x] Handle optional values safely
- [x] Follow Swift best practices

---

## 👨‍💻 Development

### Code Style

- Swift API Design Guidelines
- SwiftLint (recommended)
- Protocol naming: `*Protocol` suffix
- Test naming: `test<Method>_<Scenario>_<ExpectedResult>`

### Git Workflow

```bash
# Feature development
git checkout -b feature/detail-view
# Make changes
git commit -m "feat: add detail view for content items"
git push origin feature/detail-view
# Create PR
```

---

## 📄 License

This project is created for technical assessment purposes.

---

## 🙏 Acknowledgments

- API provided by JSONBin.io
- Architecture inspired by Clean Architecture principles by Robert C. Martin
- UI design inspired by modern streaming platforms

---

## 📧 Contact

For questions or feedback, please reach out via GitHub issues.

---

**Built with ❤️ using Swift and SwiftUI**

