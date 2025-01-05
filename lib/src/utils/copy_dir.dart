import 'dart:convert';
import 'dart:io';
import 'package:nui/global.dart';
import 'package:dio/dio.dart';
import 'package:nui/models/index.dart';
import 'package:path/path.dart' as path;

void copyDirectorySync(String src, String des) {
  Directory source = Directory(src);
  Directory destination = Directory(des);
  // create folder if not exist
  if (!destination.existsSync()) {
    destination.createSync(recursive: true);
  }
  // check source exist
  if (!source.existsSync()) {
    //  print("source dont exist");
    return;
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

Future<void> copyGitDirectorySync(String index, String des) async {
  Directory destination = Directory(des);
  // create folder if not exist

  if (!destination.existsSync()) {
    destination.createSync(recursive: true);
  }

  var resposne = await Dio().get(index,
      options: Options(
           validateStatus: (_) => true));
  if (resposne.statusCode == 404) {
    print('No template exist');
    return;
  } else if (resposne.statusCode != 200) {
    print('Something went wrong : ${resposne.data}');
    return;
  } else {
    final indexData = Index.fromJson(json.decode((resposne.data)));
    print('${indexData.totalSize} bytes of disk space will be used');
    writeFiles(indexData.contents!, destination);
  }
}

writeFiles(List<Content> contents, Directory destination) async {
  for (var content in contents) {
    if (content.type == 'file') {
      (await Dio().download('$contentUrl/${content.path}', content.path,
              options: Options(responseType: ResponseType.bytes)))
          .data;
    } else {
      if (content.children!.isNotEmpty) {
        writeFiles(content.children!, destination);
      }
    }
  }
}
