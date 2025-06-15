Apk Download link: 
# 📝 Flutter Notes App

A simple yet powerful **Notes App built with Flutter**, using the `sqflite` plugin for local data storage. The app allows users to **create**, **read**, **update**, and **delete** notes efficiently with a clean and intuitive user interface.

## 🚀 Features

* 📄 Create and save new notes
* 🗂️ View all saved notes in a list
* ✏️ Edit existing notes
* ❌ Delete unwanted notes
* 🗃️ Local storage using SQLite with the `sqflite` Flutter plugin
* 📱 Responsive and clean UI design

## 🛠️ Built With

* **Flutter**
* **Dart**
* [`sqflite`](https://pub.dev/packages/sqflite) - SQLite plugin for Flutter
* [`path_provider`](https://pub.dev/packages/path_provider) - Used to find the local path for the database

## 📦 Getting Started

### Prerequisites

* Flutter SDK installed
* Android Studio or VS Code
* Emulator or physical device

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/flutter-notes-app.git
   cd flutter-notes-app
   ```

2. **Get dependencies**:

   ```bash
   flutter pub get
   ```

3. **Run the app**:

   ```bash
   flutter run
   ```

## 📁 Project Structure

* `main.dart` – Entry point
* `models/note.dart` – Note model class
* `screens/home.dart` – Displays list of notes
* `screens/edit_note.dart` – Add/edit note UI
* `database/notes_database.dart` – All SQLite database operations (CRUD)

## 🧠 How It Works

* The app initializes a local SQLite database using `sqflite`.
* Notes are stored as rows in a `notes` table with fields like `id`, `title`, `content`, and `timestamp`.
* UI is updated in real-time after any CRUD operation is performed.

## 📸 Screenshots

![WhatsApp Image 2025-06-15 at 22 30 57_f8b57ba0](https://github.com/user-attachments/assets/39076ad5-3c5b-4eb4-a1ae-3241c22b3cc4)
![WhatsApp Image 2025-06-15 at 22 30 58_ad6169d5](https://github.com/user-attachments/assets/d401c44a-7077-4544-a9d9-876e17ddf8c3)
![WhatsApp Image 2025-06-15 at 22 31 02_cf4b2b08](https://github.com/user-attachments/assets/3ec248af-dbf5-423b-8ce9-ec883c93917e)
![WhatsApp Image 2025-06-15 at 22 31 02_ba9fa11f](https://github.com/user-attachments/assets/f6fa8bef-c570-4bd5-876a-e485c4050b93)


## 📝 License

This project is open-source and available under the [MIT License](LICENSE).

---
