enum FontsType {
  kansas('Kansas'),
  polar('Polar'),
  segoeUI('SegoeUI');

  const FontsType(this.font);
  final String font;

  static List<String> get fonts => <String>[
        kansas.font,
        polar.font,
        segoeUI.font,
      ];
}
