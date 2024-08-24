import 'dart:io';

bool isFlutterProject(String path) => (Directory('$path/lib').existsSync() &&
    File('$path/pubspec.yaml').existsSync());
