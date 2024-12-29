import 'package:flutter/material.dart';
import 'package:rlh_flutter/core/config/theme/theme_notifier.dart';
/* 
class ThemeSettingsWidget extends ConsumerWidget {
  const ThemeSettingsWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeMode? mode = ref.watch(themeNotifierProvider);
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Dark'),
          leading: Radio<ThemeMode>(
            value: ThemeMode.dark,
            groupValue: mode,
            onChanged: (ThemeMode? value) {
              {
                (ref.read(themeNotifierProvider.notifier)).setMode(value!);
              }
            },
          ),
        ),
        ListTile(
          title: const Text('Light'),
          leading: Radio<ThemeMode>(
            value: ThemeMode.light,
            groupValue: mode,
            onChanged: (ThemeMode? value) {
              (ref.read(themeNotifierProvider.notifier)).setMode(value!);
            },
          ),
        ),
        ListTile(
          title: const Text('System'),
          leading: Radio<ThemeMode>(
            value: ThemeMode.system,
            groupValue: mode,
            onChanged: (ThemeMode? value) {
              (ref.read(themeNotifierProvider.notifier)).setMode(value!);
            },
          ),
        ),
      ],
    );
  }
}
 */