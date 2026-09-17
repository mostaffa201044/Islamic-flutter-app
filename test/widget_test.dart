import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:living_islamic_world/app/app.dart';
import 'package:living_islamic_world/world/world_state.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('App launches and renders living world UI', (WidgetTester tester) async {
    final worldState = WorldState();
    await worldState.initialize();

    await tester.pumpWidget(LivingWorldApp(worldState: worldState));
    await tester.pump();

    // Verify presence of core navigation items
    expect(find.text('القرآن الكريم'), findsOneWidget);
    expect(find.text('الأذكار'), findsOneWidget);
  });
}
