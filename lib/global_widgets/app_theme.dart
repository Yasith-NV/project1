import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    
    return ThemeData.dark().copyWith(
      primaryColor: const Color.fromARGB(255, 255, 255, 255),  
      scaffoldBackgroundColor: Colors.black,  
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 253, 253, 253),  
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 10, 40, 211),  
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
      ),
      textTheme: ThemeData.dark().textTheme.copyWith(
        displayLarge: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
        bodyLarge: const TextStyle(fontSize: 14.0, color: Color.fromARGB(255, 255, 255, 255)),
      ),
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 10, 40, 211), 
        elevation: 4,
      ),
      colorScheme: const ColorScheme.dark().copyWith(
        secondary: const Color.fromARGB(255, 10, 40, 211), 
      ),
    );
  }
}
