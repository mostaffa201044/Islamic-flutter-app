# Living Islamic World — Prototype 0 (Vertical Slice)

> **"The user has a beautiful living world that gradually changes as they use the Islamic features of the application."**

[![Build Release APK](https://github.com/example/living_islamic_world/actions/workflows/build-apk.yml/badge.svg)](https://github.com/example/living_islamic_world/actions/workflows/build-apk.yml)

A complete, playable Flutter and Flame project demonstrating the core concept:
**Islamic Activity → World Reaction → Discovery → Islamic Knowledge → World Progression → Hint of a Larger World**.

---

## 1. Concept & Vision

This application is **not** a standard utility app with artificial gamification (no XP, levels, leaderboards, or coins).
Instead, it provides a tranquil, stylized 2D living environment—a personal oasis that blossoms, lights up, flows with spring water, and expands toward distant horizons as the user engages in reading the Quran, reciting authentic Adhkar, and contemplating verified wisdom.

### Visual Atmosphere
- **Mood**: Peaceful, Cheerful, Beautiful, Curious, Alive.
- **Layers**:
  - *Foreground*: Swaying grasses, flowering jasmine, floating serene motes of light, soaring doves.
  - *Midground*: Traditional Islamic courtyard home, illuminated lanterns, winding stone path, date palms, olive trees, living water stream, ancient marble discovery pavilion, and arched valley bridge.
  - *Background*: Parallax atmospheric sky gradient, morning mist, mountain ridges, and panoramic skyline of domes and minarets.

---

## 2. Playable Journey (5–10 Minute Experience)

1. **First Launch**:
   - The user enters directly into the living world at the home courtyard.
   - Text appears gently:
     > **"هذه رحلتك."**
     > **"لنكتشفها معًا."**
     > **"ابدأ الرحلة"**
2. **Islamic Feature #1 — Quran**:
   - The user opens the Quran screen to read authentic Quranic passages (e.g. *Ayat Al-Kursi* [Surah Al-Baqarah 2:255] or *Surah Ash-Sharh* [94:1-8]).
   - Upon completing the reading with contemplation, the user returns to the oasis.
   - **World Reaction**: Golden lanterns illuminate around the home, the winding stone path becomes clear and radiant, and the garden awakens.
3. **Islamic Feature #2 — Adhkar**:
   - The user opens the Adhkar screen and engages with authentic morning/evening remembrances (e.g. *Tasbih & Tahmid* from Sahih Muslim 2726).
   - Upon completing the dhikr, the user returns to the oasis.
   - **World Reaction**: The dry wadi awakens into a sparkling, flowing stream with ripples and blooming water lilies.
4. **First Discovery**:
   - The ancient marble pavilion by the stream begins pulsing with a warm golden aura.
   - Tapping the discovery reveals:
     - **Title**: *بستان النخيل وينبوع الماء* (The Palm Oasis & Living Waters).
     - **Knowledge Topic**: Cultivating the earth and perpetual charity (*Sadaqah Jariyah*).
     - **Verified Source**: Hadith of the Prophet ﷺ in *Sahih al-Bukhari* (2320) & *Sahih Muslim* (1553):
       > «مَا مِنْ مُسْلِمٍ يَغْرِسُ غَرْسًا، أَوْ يَزْرَعُ زَرْعًا، فَيَأْكُلُ مِنْهُ طَيْرٌ أَوْ إِنْسَانٌ أَوْ بَهِيمَةٌ، إِلَّا كَانَ لَهُ بِهِ صَدَقَةٌ»
5. **Knowledge Chain & Second World Reaction**:
   - Following the reflection leads to the next clue across the valley.
   - The arched stone bridge illuminates, spanning the gorge.
   - The user explores the bridge discovery:
     - **Verified Source**: *Sahih Muslim* (2699):
       > «مَنْ سَلَكَ طَرِيقًا يَلْتَمِسُ فِيهِ عِلْمًا، سَهَّلَ اللَّهُ لَهُ بِهِ طَرِيقًا إِلَى الْجَنَّةِ»
6. **City Reveal**:
   - The camera glides up the valley to reveal the distant panoramic city of domes, minarets, and mountain peaks bathed in golden dawn light.
   - Text:
     > **"هذه ليست سوى البداية."**
     > *(This is only the beginning... vast horizons await those who journey.)*

---

## 3. Technology Stack & Architecture

- **Flutter**: Application navigation, RTL Arabic interface, Quran reader, Adhkar counter, discovery modal sheets, state management, and persistence.
- **Flame (1.18.0)**: Living 2D world engine, multi-layer rendering, camera smooth interpolation and pan handling, procedural sine wave water animation, leaf and tree sway, glowing light motes, and interactive tap detection.
- **SharedPreferences**: Local persistence storing world progression across application restarts.
- **Google Fonts (Amiri)**: Elegant Arabic typography.

### Project Structure
```
living_islamic_world/
├── .github/
│   └── workflows/
│       └── build-apk.yml           # Automated release APK compilation
├── android/                        # Full Android Gradle 8.x configuration
│   ├── app/
│   │   ├── build.gradle            # App-level build config (compileSdk 34)
│   │   └── src/main/AndroidManifest.xml
│   ├── build.gradle                # Root gradle config
│   ├── gradle.properties
│   └── settings.gradle             # Modern Flutter plugin loader
├── assets/
│   ├── data/                       # Verified Quran, Adhkar, and Discoveries JSON
│   ├── icons/                      # Stylized UI icon assets
│   └── images/                     # Environment and texture graphics
├── lib/
│   ├── main.dart                   # App entrypoint & state initialization
│   ├── app/
│   │   ├── app.dart                # MaterialApp with RTL Arabic localization
│   │   └── routes.dart             # Application route definitions
│   ├── core/
│   │   ├── constants/              # Arabic text constants and strings
│   │   ├── models/                 # Quran, Dhikr, and Discovery data models
│   │   ├── services/               # Asset data loader service
│   │   └── theme/                  # Islamic color palette and typography
│   ├── features/
│   │   ├── adhkar/                 # Contemplative Adhkar screen
│   │   ├── discovery/              # Discovery modal & City reveal dialog
│   │   ├── home/                   # World viewport & floating navigation dock
│   │   └── quran/                  # Verified Quran passage contemplation screen
│   └── world/
│       ├── living_world_game.dart  # Main Flame Game instance
│       ├── world_controller.dart   # Camera & event orchestration
│       ├── world_state.dart        # Persistent state model (ChangeNotifier)
│       ├── components/             # Flame visual components (Sky, City, Bridge, Water, Home, Palms, etc.)
│       └── systems/                # Persistence & reaction systems
├── test/
│   ├── widget_test.dart            # Flutter widget test
│   └── world_state_test.dart       # Comprehensive unit tests for state progression
├── analysis_options.yaml           # Flutter linter configuration
└── pubspec.yaml                    # Flutter project specification
```

---

## 4. Build Instructions

### Prerequisites
- **Flutter SDK**: 3.16.0 or newer (Stable channel)
- **Java Development Kit**: JDK 17
- **Android SDK**: API level 34

### Local Build (Command-Line)
No Android Studio installation is required.

```bash
# 1. Fetch dependencies
flutter pub get

# 2. Verify static analysis
flutter analyze

# 3. Run test suite
flutter test

# 4. Build release Android APK
flutter build apk --release
```

The compiled APK will be generated at:
`build/app/outputs/flutter-apk/app-release.apk`

---

## 5. GitHub Actions APK Build

The included workflow `.github/workflows/build-apk.yml` builds the APK on any push or pull request to `main`, or via manual `workflow_dispatch`:

1. Checks out the repository.
2. Sets up JDK 17 (Temurin).
3. Sets up Flutter (Stable channel).
4. Runs `flutter pub get`, `flutter analyze`, and `flutter test`.
5. Builds the release APK (`flutter build apk --release`).
6. Uploads the generated APK as a downloadable artifact named `living-islamic-world-release-apk`.

---

## 6. Verified Religious Sources

All religious texts included in Prototype 0 are authentic and sourced:
- **Quran**: Surah Al-Baqarah (Ayat Al-Kursi 2:255), Surah Ash-Sharh (94:1-8), Surah Al-Fatiha (1:1-7).
- **Adhkar**: Authentic supplications from *Sahih al-Bukhari* (Hadith 6403, 4205) and *Sahih Muslim* (Hadith 2726, 2691, 2704).
- **Discoveries**: Planting and watering (*Sahih al-Bukhari* 2320, *Sahih Muslim* 1553); Seeking knowledge (*Sahih Muslim* 2699).

---

## 7. Known Limitations & Roadmap

### Prototype 0 Scope Boundaries:
- Focused exclusively on proving the core loop: Islamic Feature → World Reaction → Discovery → Progression.
- Does not implement user accounts, prayer times, GPS, audio streaming, or monetization.
- World is a single vertical slice region (Courtyard → Oasis → Valley Bridge → City Horizon).

### Future Milestones (Phase 1+):
- Interactive Prayer Times with dynamic sun position and call to prayer (Adhan).
- Complete Surah and Juz index with recitation audio.
- Expanding the City into explorable knowledge libraries, madrasas, and historical pavilions.
- Day/Night cycle aligned with local Islamic prayer times (Fajr, Dhuhr, Asr, Maghrib, Isha).
