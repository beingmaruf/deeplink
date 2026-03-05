# DeepLink – Flutter Deep Link Demo

A Flutter application that demonstrates how to implement **deep links** (custom URL scheme) and **App Links / Universal Links** (HTTPS) using the [`go_router`](https://pub.dev/packages/go_router) package.

---

## Supported Deep Links

| Platform | Scheme | Example URL |
|---|---|---|
| Android / iOS | Custom scheme | `deeplink://app.example.com/` |
| Android (App Link) | HTTPS | `https://app.example.com/product/42` |
| iOS (Universal Link) | HTTPS | `https://app.example.com/profile/johndoe` |

### Routes

| Path | Screen | Description |
|---|---|---|
| `/` | Home | Landing screen with navigation buttons |
| `/product/:id` | Product | Product detail page, opened by product ID |
| `/profile/:username` | Profile | User profile page, opened by username |
| *(anything else)* | Not Found | 404 error screen |

---

## Getting Started

### Prerequisites

- [Flutter SDK ≥ 3.10](https://docs.flutter.dev/get-started/install)
- Android Studio / Xcode for platform-specific configuration

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

---

## Android Setup

The `AndroidManifest.xml` already contains the required `<intent-filter>` blocks for both the custom scheme and HTTPS App Links.

To test deep links on Android with `adb`:

```bash
# Custom scheme
adb shell am start \
  -W -a android.intent.action.VIEW \
  -d "deeplink://app.example.com/product/42" \
  com.example.deeplink

# HTTPS App Link
adb shell am start \
  -W -a android.intent.action.VIEW \
  -d "https://app.example.com/profile/johndoe" \
  com.example.deeplink
```

For **App Links** (HTTPS, `autoVerify="true"`), host a valid
[`assetlinks.json`](https://developer.android.com/training/app-links/verify-android-applinks)
file at:

```
https://app.example.com/.well-known/assetlinks.json
```

---

## iOS Setup

The `Info.plist` registers the `deeplink://` custom URL scheme.

To test deep links on iOS Simulator:

```bash
# Custom scheme
xcrun simctl openurl booted "deeplink://app.example.com/product/42"

# Universal Link (requires entitlement + AASA file on the server)
xcrun simctl openurl booted "https://app.example.com/profile/johndoe"
```

For **Universal Links**, add the `Associated Domains` entitlement in Xcode
(`applinks:app.example.com`) and host an
[Apple App Site Association (AASA)](https://developer.apple.com/documentation/xcode/supporting-associated-domains)
file at:

```
https://app.example.com/.well-known/apple-app-site-association
```

---

## Running Tests

```bash
flutter test
```

---

## Project Structure

```
lib/
├── main.dart                  # App entry point
├── router.dart                # GoRouter configuration with deep link routes
└── screens/
    ├── home_screen.dart       # Home / landing screen
    ├── product_screen.dart    # Product detail screen
    ├── profile_screen.dart    # User profile screen
    └── not_found_screen.dart  # 404 fallback screen
android/
└── app/src/main/
    └── AndroidManifest.xml   # Deep link intent filters
ios/
└── Runner/
    └── Info.plist            # Custom URL scheme & Universal Link domains
test/
└── router_test.dart          # Router unit tests
```

---

## Dependencies

| Package | Purpose |
|---|---|
| [`go_router`](https://pub.dev/packages/go_router) | Declarative routing with deep link support |
| [`flutter_lints`](https://pub.dev/packages/flutter_lints) | Recommended lint rules |