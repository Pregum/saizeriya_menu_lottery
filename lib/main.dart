import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saizeriya_menu_lottery/repository/supabase.dart';
import 'package:saizeriya_menu_lottery/route.dart';
import 'package:saizeriya_menu_lottery/theme/my_theme.dart';
import 'package:saizeriya_menu_lottery/ui/home_page.dart';
import 'package:saizeriya_menu_lottery/ui/splash_page.dart';
import 'package:saizeriya_menu_lottery/ui/my_page.dart';

Future<void> main() async {
  // runZonedGuardedを使う場合は、その中でensureInitializedとその後続の処理を呼び出すようにする
  // ref: https://stackoverflow.com/questions/76472459/how-do-i-fix-this-sentry-zone-mismatch-error
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await dotenv.load(fileName: '.env');
      final url = dotenv.get('SUPABASE_URL');
      final anonKey = dotenv.get('SUPABASE_ANONKEY');
      debugPrint('url: $url');
      debugPrint('anonkey: $anonKey');
      final supabaseAsync = supabaseAsyncProvider(url, anonKey);
      final rootContainer = ProviderContainer();
      final supabase = await rootContainer.read(supabaseAsync.future);
      final childContainer = ProviderContainer(
        parent: rootContainer,
        overrides: [
          supabaseProvider.overrideWithValue(supabase),
        ],
      );

      runApp(
        UncontrolledProviderScope(
          container: childContainer,
          child: const MyApp(),
        ),
      );
    },
    (error, stackTrace) {
      debugPrint('zoned guarded error!!!!11!');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.deepPurple,
      //     primary: Colors.green[300],
      //   ),
      //   useMaterial3: true,
      // ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        MyRoute.root: (_) => const SplashPage(),
        MyRoute.home: (context) => HomePage(parentBuildContext: context),
        MyRoute.myPage: (_) => const MyPage(),
      },
    );
  }
}
