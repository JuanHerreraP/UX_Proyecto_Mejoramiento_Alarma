import 'package:despertador/config/router/app_router.dart';
import 'package:despertador/config/theme/app_theme.dart';
import 'package:despertador/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final isDarkMode = ref.watch( themeControllerProvider );

    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme.getTheme( isDarkMode: isDarkMode ),
      debugShowCheckedModeBanner: false,
    );
  }
}
