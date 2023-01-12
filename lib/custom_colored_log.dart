import 'dart:developer' as developer;

class CustomColoredLogs {
  static logInfo(var msg) {
    developer.log('\x1B[34m$msg\x1B[0m');
  }

  static logSuccess(var msg) {
    developer.log('\x1B[32m$msg\x1B[0m');
  }

  static logWarning(var msg) {
    developer.log('\x1B[33m$msg\x1B[0m');
  }

  static logError(var msg) {
    developer.log('\x1B[31m$msg\x1B[0m');
  }
}
