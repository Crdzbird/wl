import 'package:flutter/material.dart';
import 'package:wl/core/theme/app_colors_type.dart';
import 'package:wl/core/theme/fonts_type.dart';
import 'package:wl/core/theme/typography.dart';

extension ThemeContext on BuildContext {
  ThemeData get darkMode => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColorsType.deepPurple.color,
          primary: AppColorsType.purpleA200.color,
          secondary: AppColorsType.purpleA400.color,
          surface: AppColorsType.darkerGrey.color,
          onPrimary: AppColorsType.white.color,
          onSecondary: AppColorsType.white.color,
          onSurface: AppColorsType.white.color,
          error: AppColorsType.redAccent.color,
          onError: AppColorsType.white.color,
        ),
        fontFamily: FontsType.kansas.font,
        scaffoldBackgroundColor: AppColorsType.darkGrey.color,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColorsType.purpleA200.color,
          foregroundColor: AppColorsType.white.color,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColorsType.white.color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamilyFallback: FontsType.fonts,
        bottomAppBarTheme: BottomAppBarTheme(
          color: AppColorsType.purpleA200.color,
          elevation: 2,
        ),
        cardTheme: CardTheme(
          color: AppColorsType.darkerGrey.color,
          shadowColor: AppColorsType.purpleA400.color,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textTheme: typographyDarkTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColorsType.purpleA400.color,
            foregroundColor: AppColorsType.white.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColorsType.purpleA200.color,
            side: BorderSide(
              color: AppColorsType.purpleA200.color,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColorsType.purpleA200.color,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColorsType.darkerGrey.color,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColorsType.purpleA400.color,
            ),
          ),
          labelStyle: TextStyle(
            color: AppColorsType.purpleA200.color,
          ),
          hintStyle: TextStyle(
            color: AppColorsType.greyA700.color,
          ),
        ),
        iconTheme: IconThemeData(
          color: AppColorsType.purpleA200.color,
          size: 24,
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.all(
            AppColorsType.purpleA200.color,
          ),
          checkColor: WidgetStateProperty.all(
            AppColorsType.white.color,
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(
            AppColorsType.purpleA200.color,
          ),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.focused)) {
                return AppColorsType.purpleA200.color;
              }
              return AppColorsType.grey.color;
            },
          ),
          trackColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return AppColorsType.darkerGrey.color;
              }
              return AppColorsType.greyShade800.color;
            },
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: AppColorsType.darkerGrey.color,
          titleTextStyle: TextStyle(
            color: AppColorsType.white.color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: TextStyle(
            color: AppColorsType.white.color,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColorsType.purpleA400.color,
          contentTextStyle: TextStyle(
            color: AppColorsType.white.color,
          ),
          actionTextColor: AppColorsType.purpleA200.color,
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: AppColorsType.purpleA200.color,
          inactiveTrackColor: AppColorsType.purpleA400.color.withOpacity(0.5),
          thumbColor: AppColorsType.purpleA200.color,
          overlayColor: AppColorsType.transparentPurpleA200.color,
        ),
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: AppColorsType.purpleA200.color,
            borderRadius: BorderRadius.circular(4),
          ),
          textStyle: TextStyle(
            color: AppColorsType.white.color,
          ),
        ),
        dividerTheme: DividerThemeData(
          color: AppColorsType.purpleA200.color,
          thickness: 1,
        ),
      );

  ThemeData get dayMode => ThemeData(
        useMaterial3: true,
        fontFamily: FontsType.segoeUI.font,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColorsType.mutedPurple.color,
          primary: AppColorsType.mutedPurple.color,
          secondary: AppColorsType.orchid.color,
          surface: AppColorsType.lavender.color,
          onPrimary: AppColorsType.white.color,
          onSecondary: AppColorsType.white.color,
          onSurface: AppColorsType.indigo.color,
          error: AppColorsType.redAccent.color,
          onError: AppColorsType.white.color,
        ),
        scaffoldBackgroundColor: AppColorsType.whiteSmoke.color,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColorsType.mutedPurple.color,
          foregroundColor: AppColorsType.white.color,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColorsType.white.color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: AppColorsType.mutedPurple.color,
          elevation: 2,
        ),
        cardTheme: CardTheme(
          color: AppColorsType.lavender.color,
          shadowColor: AppColorsType.indigo.color,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textTheme: typographyLightTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColorsType.orchid.color,
            foregroundColor: AppColorsType.white.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColorsType.mutedPurple.color,
            side: BorderSide(
              color: AppColorsType.mutedPurple.color,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColorsType.mutedPurple.color,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColorsType.lavender.color,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColorsType.indigo.color,
            ),
          ),
          labelStyle: TextStyle(
            color: AppColorsType.mutedPurple.color,
          ),
          hintStyle: TextStyle(
            color: AppColorsType.slateGray.color,
          ),
        ),
        iconTheme: IconThemeData(
          color: AppColorsType.mutedPurple.color,
          size: 24,
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.all(
            AppColorsType.mutedPurple.color,
          ),
          checkColor: WidgetStateProperty.all(
            AppColorsType.white.color,
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(
            AppColorsType.mutedPurple.color,
          ),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return AppColorsType.mutedPurple.color;
              }
              return AppColorsType.grey.color;
            },
          ),
          trackColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return AppColorsType.lavender.color;
              }
              return AppColorsType.shadedGrey.color;
            },
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: AppColorsType.lavender.color,
          titleTextStyle: TextStyle(
            color: AppColorsType.indigo.color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: TextStyle(
            color: AppColorsType.indigo.color,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColorsType.indigo.color,
          contentTextStyle: TextStyle(
            color: AppColorsType.white.color,
          ),
          actionTextColor: AppColorsType.orchid.color,
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: AppColorsType.mutedPurple.color,
          inactiveTrackColor: AppColorsType.orchid.color.withOpacity(0.5),
          thumbColor: AppColorsType.mutedPurple.color,
          overlayColor: AppColorsType.transparentMediumPurple.color,
        ),
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: AppColorsType.mutedPurple.color,
            borderRadius: BorderRadius.circular(4),
          ),
          textStyle: TextStyle(
            color: AppColorsType.white.color,
          ),
        ),
        dividerTheme: DividerThemeData(
          color: AppColorsType.mutedPurple.color,
          thickness: 1,
        ),
        fontFamilyFallback: FontsType.fonts,
      );
}
