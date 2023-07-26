import 'dart:developer';

class Logger {
  // ANSI escape codes for colors
  static const String _reset = '\x1B[0m';
  static const String _green = '\x1B[32m';
  static const String _red = '\x1B[31m';
  static const String _yellow = '\x1B[33m';
  static const String _blue = '\x1B[34m';

  // static method to log message in green color
  static void success(String message) {
    log('$_green$message$_reset');
  }

  // static method to log message in red color
  static void error(String message) {
    log('$_red$message$_reset');
  }

  // static method to log message in yellow color
  static void warning(String message) {
    log('$_yellow$message$_reset');
  }

  // static method to log message in blue color
  static void info(String message) {
    log('$_blue$message$_reset');
  }
}
