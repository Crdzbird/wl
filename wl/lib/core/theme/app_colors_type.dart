import 'package:flutter/material.dart';

enum AppColorsType {
  // Night Mode Colors
  deepPurple(Color(0xFF6A1B9A)), // Seed color
  transparentPurpleA200(Color(0x33AB47BC)), // Transparent color
  purpleA200(Color(0xFFAB47BC)), // Primary color
  purpleA400(Color(0xFF8E24AA)), // Secondary color
  darkGrey(Color(0xFF121212)), // Background color
  darkerGrey(Color(0xFF1E1E1E)), // Surface color
  shadedGrey(Color(0xFFBDBDBD)),
  greyA700(Color(0xFFB0BEC5)), // Text color on background and surfaces
  greyA400(Color(0xFF90A4AE)), // Hint text color
  greyShade800(Color(0xFF424242)),
  slateGray(Color(0xFF708090)),
  white(Color(0xFFFFFFFF)), // Text/icon color on primary, secondary, and error
  redAccent(Color(0xFFFF5722)), // Error color

  // Day Mode Colors
  mutedPurple(Color(0xFF9370DB)), // Seed color
  transparentMediumPurple(Color(0x339370DB)), // Transparent color
  orchid(Color(0xFFBA55D3)), // Secondary color
  whiteSmoke(Color(0xFFF5F5F5)), // Background color
  lavender(Color(0xFFE6E6FA)), // Surface color
  indigo(Color(0xFF4B0082)), // Text color on background and surfaces

  // Common Colors
  grey(Color(0xFF9E9E9E)); // Default track color for switches

  const AppColorsType(this.color);

  final Color color;
}
