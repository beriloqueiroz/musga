import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'dart:developer' as developer;
import 'package:logging/logging.dart';

void main() {
  print('DEBUG: Iniciando aplicação');
  // Configurar logger globalmente
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    developer.log(
      record.message,
      time: record.time,
      name: record.loggerName,
      level: record.level.value,
      error: record.error,
      stackTrace: record.stackTrace,
    );
  });

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('DEBUG: Construindo MyApp');
    return MaterialApp(
      title: 'Musga',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        iconTheme: const IconThemeData(
          size: 24.0,  // tamanho padrão dos ícones
        ),
        // Garantir que os ícones sejam visíveis
        primaryIconTheme: const IconThemeData(
          color: Colors.black,  // cor padrão dos ícones
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
} 