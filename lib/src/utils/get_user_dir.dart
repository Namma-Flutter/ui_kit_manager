import 'dart:io';

String getUserHomeDirectory() {
  if (Platform.isWindows) {
    return Platform.environment['USERPROFILE'] ?? '';
  } else {
    return Platform.environment['HOME'] ?? '';
  }
}