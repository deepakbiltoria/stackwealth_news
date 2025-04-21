---

# Stack Wealth News

## Overview

This Flutter application is built with Clean Architecture principles and uses BLoC for state management. It fetches news data from the News API, supports search and pagination, and caches the last 5 search queries and their results **in-session** (in-memory) to enable offline access for recent searches.

### Screenshots
 ![splash](https://github.com/user-attachments/assets/2a77c503-5f45-4319-81a2-3cd1ff12e788)
![home](https://github.com/user-attachments/assets/38d7b0c3-9ec1-4991-a655-d275aaf9aa31)
![home loaded](https://github.com/user-attachments/assets/91b06caf-d657-4064-9386-74f627a83198)
![details screen](https://github.com/user-attachments/assets/d7c1966c-8806-4015-902a-4da0c4e8391b)


---

## How to Set Up and Run the Project Locally

### Prerequisites

- Flutter SDK (version 3.0 or above recommended)
- Dart SDK (comes with Flutter)
- Android Studio, VS Code, or any preferred IDE
- An emulator or physical device
- Internet connection (for initial API calls)

### Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/deepakbiltoria/stackwealth_news.git
   
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   Connect your device or start an emulator, then:

   ```bash
   flutter run
   ```

4. **API Key Configuration**

   The app uses [News API](https://newsapi.org/). You need to obtain an API key and add it to the project:
    
    - Create an .env file in the root of the project, then place the API Key with name NEWS_API_KEY 
    - for eg. Your .env should consist a line like this -
      NEWS_API_KEY =  "416*********41b68*8880";
    

---

## Key Design Decisions

- **Clean Architecture**: Separation of concerns into Presentation, Domain, and Data layers to improve maintainability and scalability.

- **BLoC for State Management**: Enables event-driven and reactive UI updates, handling loading, success, and error states efficiently.

- **In-Session Caching for Offline Support**: Instead of persistent storage like Hive, the app caches the last 5 search queries and their results in memory during the app session. This allows users to view recent search results offline without additional dependencies or complexity.

- **Pagination Support**: The app fetches data page-by-page from the News API to improve performance and user experience.

- **Error Handling**: Robust error states are implemented in BLoC to handle API failures and connectivity issues gracefully.

---

## Challenges Faced and How They Were Overcome

- **Offline Data Caching Without Persistence**: Initially, Hive was used for local storage but was removed to simplify the architecture. Implementing an efficient in-memory cache for the last 5 searches required designing a suitable data structure and ensuring it integrates well with BLoC state management.

- **Managing Pagination and Search Together**: Coordinating pagination with dynamic search queries was complex. This was solved by carefully managing page counters and resetting pagination on new searches within the BLoC.

- **API Rate Limits and Error Handling**: News API has rate limits. Implemented error handling and user feedback to manage API failures or quota exceedance gracefully.

- **Maintaining Clean Architecture Discipline**: Ensuring strict separation between layers required continuous refactoring and code reviews.

---

## Known Issues or Areas for Improvement

- **Cache Persistence**: Currently, cached searches are lost when the app is closed. Adding persistent storage (e.g., Hive or SharedPreferences) could improve offline experience.

- **Limited Offline Functionality**: Only last 5 searches are cached and available offline. Consider expanding cache size or implementing background sync.

- **UI/UX Improvements**: The UI can be enhanced for better responsiveness and accessibility.

- **Testing Coverage**: Increasing unit and widget test coverage, especially for BLoC and repository layers.

- **API Key Security**: API keys are stored in code/config files; consider more secure storage or obfuscation.

---

## Contact

For questions or feedback:

- Your Name — deepakbiltoria29@gmail.com
- GitHub: [DeepakBiltoria](https://github.com/deepakbiltoria/)

---
