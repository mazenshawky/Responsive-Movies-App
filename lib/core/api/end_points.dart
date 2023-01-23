class EndPoints {
  static const String baseUrl = "https://api.themoviedb.org/3";

  static const String apiKey = "984d5fd7a76be1f8d12c1c6c8bb1c372";

  static const String moviesPath = "$baseUrl/movie/popular?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => '$baseImageUrl$path';
}
