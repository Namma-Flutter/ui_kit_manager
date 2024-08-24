import 'dart:io';

import 'package:path/path.dart' as path;

void copyDirectorySync(String src, String des) {
  Directory source=Directory(src);
   Directory   destination=Directory(des);
  // create folder if not exist
  if (!destination.existsSync()) {
    destination.createSync(recursive: true);
  }
  // check source exist
  if (!destination.existsSync()) {
    destination.createSync(recursive: true);
  }
  source.listSync(recursive: false).forEach((entity) {
    final newPath =
        destination.path + Platform.pathSeparator + path.basename(entity.path);
    if (entity is File) {
      entity.copySync(newPath);
    } else if (entity is Directory) {
      copyDirectorySync(entity.path, newPath);
    }
  });
}
