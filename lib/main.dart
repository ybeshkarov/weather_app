import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/di/core_di.dart';
import 'package:weather_app/features/weather/presentation/view/weather_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CoreDi.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.josefinSans(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          displayMedium: GoogleFonts.josefinSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          labelMedium: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          labelLarge: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: FutureBuilder(
        future: GetIt.instance.allReady(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const WeatherView();
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
