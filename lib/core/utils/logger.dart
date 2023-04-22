import 'package:logger/logger.dart' as logger;

class Logger {
  static final logger.Logger _logger = logger.Logger(
    printer: logger.PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  static void log(String message) {
    _logger.d(message);
  }

  static void error(dynamic message, [Object? error, StackTrace? stackTrace]) {
    _logger.e(message, error, stackTrace);
  }
}
