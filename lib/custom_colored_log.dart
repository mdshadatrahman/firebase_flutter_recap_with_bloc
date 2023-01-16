import 'dart:developer' as devtools;

class CustomColoredLogs {
  static logInfo(var msg) {
    devtools.log('\x1B[34m$msg\x1B[0m');
  }

  static logSuccess(var msg) {
    devtools.log('\x1B[32m$msg\x1B[0m');
  }

  static logWarning(var msg) {
    devtools.log('\x1B[33m$msg\x1B[0m');
  }

  static logError(var msg) {
    devtools.log('\x1B[31m$msg\x1B[0m');
  }
}
