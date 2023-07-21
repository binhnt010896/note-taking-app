# Note Taking App

This is the repo for a cool Note Taking App.
### Features:
- Authentication
  - Login with Email/Password
  - Sign up with Email/Password
  - View profile
  - Sign out
- Notes
  - Add a new note
  - Update existing note
  - Save note to local storage (if user has not signed in)
  - Save note to cloud (if user has signed in)
  - Upload local storage notes to cloud when user sign in/ sign up

### Services
- Supabase: I use Supabase as the Database and Backend system for my Note App. It helps me store, query and authenticate users.
- flutter_quill: I use flutter_quill to enhance my note editing functions. The package provides the ability to edit rich text.

### How to use
1. Clone the repo
2. Create an ```.env``` file
3. Put in the .env the following variables:
   ```
   SUPABASE_URL=
   SUPABASE_KEY=
   ```
5. Run ```flutter pub get``` to get packages
6. Run ```cd ios && pod install && cd ..``` to install pods for iOS devices
7. Run ```flutter run -d "iPhone 14 Pro Max"``` to run on iPhone 14 Pro Max simulator
