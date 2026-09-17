import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:living_islamic_world/world/world_state.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('WorldState Progression Tests', () {
    test('Initial state is unstarted and pristine', () async {
      final state = WorldState();
      await state.initialize();

      expect(state.hasStartedJourney, isFalse);
      expect(state.quranCompleted, isFalse);
      expect(state.adhkarCompleted, isFalse);
      expect(state.pathRevealed, isFalse);
      expect(state.waterFlowing, isFalse);
      expect(state.bridgeRevealed, isFalse);
      expect(state.cityHintRevealed, isFalse);
      expect(state.currentCameraZone, equals(CameraFocusZone.home));
    });

    test('Starting journey marks journeyStarted', () async {
      final state = WorldState();
      await state.initialize();
      await state.startJourney();

      expect(state.hasStartedJourney, isTrue);
    });

    test('Quran completion illuminates path and lights lanterns', () async {
      final state = WorldState();
      await state.initialize();
      await state.onQuranCompleted();

      expect(state.quranCompleted, isTrue);
      expect(state.pathRevealed, isTrue);
      expect(state.lanternsLit, isTrue);
      expect(state.activeReactionMessage, isNotNull);
      expect(state.currentCameraZone, equals(CameraFocusZone.garden));
    });

    test('Adhkar completion starts water flow in stream', () async {
      final state = WorldState();
      await state.initialize();
      await state.onAdhkarCompleted();

      expect(state.adhkarCompleted, isTrue);
      expect(state.waterFlowing, isTrue);
      expect(state.currentCameraZone, equals(CameraFocusZone.stream));
    });

    test('First discovery reveals valley bridge', () async {
      final state = WorldState();
      await state.initialize();
      await state.onFirstDiscoveryExplored();

      expect(state.firstDiscoveryFound, isTrue);
      expect(state.bridgeRevealed, isTrue);
      expect(state.currentCameraZone, equals(CameraFocusZone.bridge));
    });

    test('Second discovery reveals distant city horizon', () async {
      final state = WorldState();
      await state.initialize();
      await state.onSecondDiscoveryExplored();

      expect(state.secondDiscoveryFound, isTrue);
      expect(state.cityHintRevealed, isTrue);
      expect(state.currentCameraZone, equals(CameraFocusZone.cityPanorama));
    });

    test('Reset demo restores pristine state', () async {
      final state = WorldState();
      await state.initialize();
      await state.onQuranCompleted();
      await state.onAdhkarCompleted();
      await state.onFirstDiscoveryExplored();
      await state.onSecondDiscoveryExplored();

      expect(state.cityHintRevealed, isTrue);

      await state.resetDemo();

      expect(state.hasStartedJourney, isFalse);
      expect(state.quranCompleted, isFalse);
      expect(state.adhkarCompleted, isFalse);
      expect(state.pathRevealed, isFalse);
      expect(state.waterFlowing, isFalse);
      expect(state.bridgeRevealed, isFalse);
      expect(state.cityHintRevealed, isFalse);
      expect(state.currentCameraZone, equals(CameraFocusZone.home));
    });
  });
}
