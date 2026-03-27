import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:js_editor_app/main.dart';
import 'package:js_editor_app/js_runner.dart';

void main() {
  testWidgets('App renders Editor and Output panes', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => JSRunner(),
        child: const JsEditorApp(),
      ),
    );

    expect(find.text('Editor'), findsOneWidget);
    expect(find.text('Output'), findsOneWidget);
    expect(find.text('Run'), findsOneWidget);
    expect(find.text('Clear'), findsOneWidget);
  });
}
