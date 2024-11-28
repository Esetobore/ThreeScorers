# ThreeScorers Application

## Project Overview
This is a mobile application developed using Flutter, designed to provide comprehensive football match insights, including momentum analysis, video highlights, and team statistics.

## Development Approach

### Architecture
- Clean, modular Flutter architecture
- State management using StatefulWidgets
- Separation of concerns with dedicated service and model classes alongside abstracting the API calls and widgets for each section of the screen
- Asynchronous data fetching with Future and FutureBuilder

### Key Features
- Match Momentum Chart
- Match Stats
- Game Information and Player of the Match
- Team Performance Visualization

## Prerequisites

### Requirements
- Flutter SDK (Latest stable version)
- Dart SDK
- Android Studio or VS Code with Flutter extensions
- Android/iOS simulator or physical device

### Dependencies
Ensure the following dependencies are in your `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  fl_chart: ^0.65.0  # For momentum charts
  http: ^1.2.0       # For API calls
  cached_network_image: ^3.3.0  # For efficient image loading
```

## Project Setup

### 1. Clone the Repository
```bash
git clone https://github.com/Esetobore/ThreeScorers.git
cd threescorers_assessment
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the Application
```bash
# For debug mode
flutter run

# For release mode
flutter run --release
```

## Architectural Components

### Data Models
- `VideoHighlight`: Represents video highlight metadata
- `MomentumData`: Captures match momentum statistics
- Others can be found within the data_models folder

### Services
- `MatchDetailsService`: Handles API calls for fetching match data
- Implements error handling and data transformation

### Constants
- `Endpoints`: Contains URLs for API calls
- `AssetPath`: App-wide string constants for all assets

## Assumptions & Limitations

### Assumptions
- Specific state management implementation. This is partly my fault as i didn't take note of this until after developing the project required us to use Bloc.
- Valid image and video URLs. Not sure if its just me but couldn't call the thumbnail url.

### Limitations
- Lack of control over the Figma design. Couldn't create Penalty Shootout as that section was covered and could't be accessed.

## Code Quality
- Follows Flutter best practices
- Modular and maintainable code structure
- Consistent code formatting