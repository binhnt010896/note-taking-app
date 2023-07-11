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

### Screenshots:
<img src="https://github.com/binhnt010896/note-taking-app/assets/110758393/8ee49b2e-7338-43c2-b913-fbe6e27c0a77" width="280">
<img src="https://github.com/binhnt010896/note-taking-app/assets/110758393/4666b848-3e35-4e4c-a2be-93d9a039563a" width="280">
<img src="https://github.com/binhnt010896/note-taking-app/assets/110758393/0e1b358d-8509-444f-a202-952eab38c119" width="280">
<img src="https://github.com/binhnt010896/note-taking-app/assets/110758393/078fbcd6-3836-4e41-b86c-952fcefd3779" width="280">
<img src="https://github.com/binhnt010896/note-taking-app/assets/110758393/1ec68f40-ad16-4b8f-aa93-75f83e331414" width="280">
<img src="https://github.com/binhnt010896/note-taking-app/assets/110758393/fee06dbd-4994-401e-bc49-5df5e7a02375" width="280">
