# Savings & Transactions App

A Flutter application to manage savings and withdrawals, utilizing BLoC for state management. It features data persistence with Hive and a structured architecture for maintainability.

## 📂 Project Structure


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

## 📌 Getting Started

1. **Clone the Repository**  
