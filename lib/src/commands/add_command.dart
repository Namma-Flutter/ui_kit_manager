import 'dart:io';

import 'package:nuk/global.dart';
import 'package:nuk/src/utils/copy_dir.dart';
import 'package:nuk/src/utils/repo_checker.dart';

Future<void> add(String folder) async {
  // check repo exist
  await checkUpdate();
  // check folder exist
  if (Directory("$clonePath/lib/pages/$folder").existsSync()) {
    print("path exist");
    copyDirectorySync(clonePath,"${Directory.current.path}/lib/pages");
    // do clone
  } else {
    print("no path exist");
    // show error msg
  }
}
