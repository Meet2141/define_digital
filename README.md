# Savings & Transactions App

A Flutter application to manage savings and withdrawals, utilizing BLoC for state management. It features data persistence with Hive and a structured architecture for maintainability.

## 🏗️ State Management

This project uses **BLoC (Business Logic Component)** for state management. BLoC helps keep UI and business logic separate, improving testability and maintainability.

- **Event-driven architecture**: UI triggers events → BLoC handles logic → UI updates state.
- **Decoupled layers**: UI, business logic, and data management are well-separated.

### BLoC Components Used:
- **Events**: Define user actions (e.g., `AddSavingsEvent`, `WithdrawEvent`)
- **States**: Represent the UI state (e.g., `HistoryLoaded`, `SavingsUpdated`)
- **Blocs**: Handle business logic and emit new states based on events.

## 🚀 Features
- **Savings Entry**: Split into `CompA` and `CompB`
- **Withdrawals**: Deduct amounts from specific components
- **History Tracking**: View past savings and withdrawals
- **Local Storage**: Data persists using Hive


## 📂 Project Structure

```plaintext
lib/
│── core/
│   ├── adapter/                # Hive adapters for local storage
│   │   ├── saving_adapter.dart
│   │   ├── transaction_adapter.dart
│   ├── services/               # Service classes for handling storage
│   │   ├── storage_service.dart
│
│── data/
│   ├── models/                 # Data models for savings & transactions
│   │   ├── saving_model.dart
│   │   ├── transaction_model.dart
│   ├── repositories/           # Repositories for data handling
│   │   ├── savings_repository.dart
│
│── presentation/
│   ├── bloc/                   # BLoC state management
│   ├── screens/                # UI screens
│   │   ├── history/
│   │   ├── home/
│   │   ├── saving/
│   │   ├── withdraw/
│   ├── widgets/                # Reusable UI components
│   │   ├── savings_card.dart
│   │   ├── transaction_list.dart
│
│── utils/                      # Utility files (constants, helpers)
│   ├── constants.dart
│   ├── helpers.dart
│
│── main.dart                    # App entry point