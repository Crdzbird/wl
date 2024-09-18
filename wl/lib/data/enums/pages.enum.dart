enum PagesEnum {
  splash('/'),
  dashboard('/dashboard'),
  detail('/detail/:id');

  const PagesEnum(this.path);
  final String path;
}
