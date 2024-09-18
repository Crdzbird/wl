extension StringExtension on String {
  String replaceParams(List<String> values) {
    var valueIndex = 0;
    return replaceAllMapped(RegExp(r':\w+'), (match) {
      if (valueIndex < values.length) return values[valueIndex++];
      return match[0]!;
    });
  }
}
