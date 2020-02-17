# Requirements:
- Android Studio
- Xcode (for ios and mac)
- flutter 1.13, go 1.13
- Clone [https://github.com/deromask/derosuite](https://github.com/deromask/derosuite) and put it next to this repo. You can put it anywhere but then you need to update this repo's `go.mod`.

# Desktop
Follow this instruction: [https://github.com/go-flutter-desktop/hover](https://github.com/go-flutter-desktop/hover)

# Mobile
. Follow instruction on cmd/mobile/build_note.txt to get output file (derocore.framework for ios and derocore.aar for android).
## android:
- copy `derocore.aar` to android/app/src/main/libs
- run `flutter run` for debugging
- run `flutter build apk` for manual delivery.
- run `flutter build appbundle` for Play Store.
## ios:
- open ios folder in Xcode
- drag and drop `Derocore.framework` to Runner (make sure `Copy items if needed` is selected).
- using Xcode to build and publish the app
