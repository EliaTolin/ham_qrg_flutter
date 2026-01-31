import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF0074C1);
const Color secondaryColor = Colors.white;
const Color tertiaryColor = Color.fromARGB(255, 0, 186, 22);
const Color accentColor =
    Color(0xFFB71C1C); // Aggiunta per avere un accento più chiaro se necessario
const Color textColor = Color(0xFF333333); // Colore per il testo generale

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    secondary: secondaryColor,
    primary: primaryColor,
    onPrimary: Colors.white, // Colore del testo sugli elementi primari
    onSecondary: primaryColor, // Colore del testo sugli elementi secondari
    surface: secondaryColor, // Colore delle superfici, come card e liste
    tertiary: tertiaryColor,
    error: accentColor,
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: primaryColor,
    iconTheme: const IconThemeData(
      color: Colors.white, // Icone nell'AppBar
    ),
    titleTextStyle: GoogleFonts.openSans(
      color: secondaryColor,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    elevation: 0, // Rimuovi ombra per un look più flat
  ),
  textTheme: GoogleFonts.openSansTextTheme().copyWith(
    headlineMedium: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: primaryColor,
    ),
    bodyMedium: const TextStyle(
      fontSize: 16,
      color: textColor,
    ),
    bodySmall: const TextStyle(
      fontSize: 14,
      color: Colors.grey,
    ),
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    shadowColor: primaryColor.withValues(alpha: 0.2),
  ),
  listTileTheme: ListTileThemeData(
    tileColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    iconColor: primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  iconTheme: const IconThemeData(
    color: primaryColor,
    size: 24, // Dimensione standardizzata per le icone
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(primaryColor),
      foregroundColor: WidgetStateProperty.all(secondaryColor),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      ),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.grey[100],
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: primaryColor, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    hintStyle: const TextStyle(color: Colors.grey),
    labelStyle: const TextStyle(color: textColor),
  ),
);
