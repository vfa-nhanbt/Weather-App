class AppValues {
  AppValues._internal();

  static AppValues instance = AppValues._internal();

  factory AppValues() {
    return instance;
  }

  /// Default API key to access open source weather API
  final String apiKey = "ca3ee9cafb369c683397c5bfc15edada";
}
