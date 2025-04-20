import 'package:flutter_test/flutter_test.dart';
import 'package:stackwealth_news/app/app.dart';
import 'package:stackwealth_news/features/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
