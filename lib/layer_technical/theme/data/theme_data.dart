import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,

  // ─── Color Scheme ───────────────────────────────────────────────
  colorScheme: const ColorScheme(
    brightness: Brightness.light,

    primary: Color(0xFFB30000),
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFFFCDD2),
    onPrimaryContainer: Color(0xFF4A0000),

    secondary: Color(0xFF2C2C2C),
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFE0E0E0),
    onSecondaryContainer: Color(0xFF1A1A1A),

    tertiary: Color(0xFFE53935),
    onTertiary: Colors.white,
    tertiaryContainer: Color(0xFFFFCDD2),
    onTertiaryContainer: Color(0xFF4A0000),

    error: Color(0xFFDC2626),
    onError: Colors.white,
    errorContainer: Color(0xFFFFE4E4),
    onErrorContainer: Color(0xFF7F1D1D),

    surface: Color(0xFFF5F5F5),
    onSurface: Color(0xFF1A1A1A),
    surfaceContainerHighest: Color(0xFFE0E0E0),
    onSurfaceVariant: Color(0xFF4A4A4A),

    outline: Color(0xFFBDBDBD),
    outlineVariant: Color(0xFFE0E0E0),

    shadow: Color(0xFF1A1A1A),
    scrim: Color(0xFF1A1A1A),

    inverseSurface: Color(0xFF1A1A1A),
    onInverseSurface: Color(0xFFF5F5F5),
    inversePrimary: Color(0xFFFF8A80),
  ),

  // ─── Typography ─────────────────────────────────────────────────
  textTheme: TextTheme(
    // Headline → Manrope
    displayLarge: GoogleFonts.manrope(
      fontSize: 57,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A1A),
    ),
    displayMedium: GoogleFonts.manrope(
      fontSize: 45,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A1A),
    ),
    displaySmall: GoogleFonts.manrope(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A1A),
    ),
    headlineLarge: GoogleFonts.manrope(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A1A),
    ),
    headlineMedium: GoogleFonts.manrope(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1A1A1A),
    ),
    headlineSmall: GoogleFonts.manrope(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1A1A1A),
    ),

    // Body → Inter
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFF1A1A1A),
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color(0xFF1A1A1A),
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Color(0xFF4A4A4A),
    ),

    // Label → Inter
    labelLarge: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1A1A1A),
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color(0xFF1A1A1A),
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: Color(0xFF4A4A4A),
    ),

    // Title → Manrope
    titleLarge: GoogleFonts.manrope(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1A1A1A),
    ),
    titleMedium: GoogleFonts.manrope(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1A1A1A),
    ),
    titleSmall: GoogleFonts.manrope(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Color(0xFF1A1A1A),
    ),
  ),

  // ─── ElevatedButton ─────────────────────────────────────────────
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFB30000),
      foregroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    ),
  ),

  // ─── OutlinedButton ─────────────────────────────────────────────
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Color(0xFFB30000),
      side: const BorderSide(color: Color(0xFFB30000), width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    ),
  ),

  // ─── TextButton ─────────────────────────────────────────────────
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Color(0xFFB30000),
      textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ),

  // ─── InputDecoration (Search field) ─────────────────────────────
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    hintStyle: GoogleFonts.inter(fontSize: 14, color: Color(0xFF9E9E9E)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFB30000), width: 1.5),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  ),

  // ─── IconTheme ──────────────────────────────────────────────────
  iconTheme: const IconThemeData(color: Color(0xFFB30000), size: 24),

  // ─── CardTheme ──────────────────────────────────────────────────
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 0.5,
    margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: Color(0xFFE0E0E0)),
    ),
  ),

  // ─── AppBarTheme ────────────────────────────────────────────────
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1A1A1A),
    foregroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: GoogleFonts.manrope(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  ),

  // ─── DividerTheme ───────────────────────────────────────────────
  dividerTheme: const DividerThemeData(color: Color(0xFFE0E0E0), thickness: 1),

  // ─── Scaffold ───────────────────────────────────────────────────
  scaffoldBackgroundColor: const Color(0xFFF5F5F5),

  // ─── FloatingActionButton ───────────────────────────────────────
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFB30000),
    foregroundColor: Colors.white,
    elevation: 2,
  ),

  // ─── ChipTheme ──────────────────────────────────────────────────
  chipTheme: ChipThemeData(
    backgroundColor: Color(0xFFE0E0E0),
    selectedColor: Color(0xFFB30000),
    labelStyle: GoogleFonts.inter(fontSize: 13, color: Color(0xFF1A1A1A)),
    side: const BorderSide(color: Color(0xFFBDBDBD)),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
);
