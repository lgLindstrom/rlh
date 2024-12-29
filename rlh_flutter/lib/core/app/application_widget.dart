import 'package:flutter/material.dart';
import 'package:rlh_flutter/core/app/authentication_gate.dart';
import 'package:rlh_flutter/core/config/theme/dark_theme.dart';
import 'package:rlh_flutter/core/config/theme/light_theme.dart';

class ApplicationWidget extends StatelessWidget {
  const ApplicationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //return const ProviderScope(child: ProviderWidget());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      //themeMode: theme,
      home: const ResponsivenessWidget(),
    );
  }
}

/* class ProviderWidget extends StatelessWidget {
  const ProviderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: ThemedWidget());
  }
} */

/* class ThemedWidget extends ConsumerWidget {
  const ThemedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotifierProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: theme,
      home: const ResponsivenessWidget(),
    );
  }
} */

class ResponsivenessWidget extends StatelessWidget {
  const ResponsivenessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   AuthenticationGate();
  }
}
