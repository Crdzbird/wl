/// Enum representing different types of endpoints.
enum EndpointsEnum {
  pois('/worldline-spain/technical_test_backend/main/pois.json');

  const EndpointsEnum(this.path);

  final String path;

  /// Returns a list of authorized paths.
  static List<String> get authorizedPaths => [
        pois.path,
      ];
}
