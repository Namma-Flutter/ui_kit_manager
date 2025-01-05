class Index {
  String? folder;
  int? totalSize;
  List<Content>? contents;

  Index({this.folder, this.totalSize, this.contents});

  Index.fromJson(Map<String, dynamic> json) {
    folder = json['folder'];
    totalSize = json['totalSize'];
    if (json['contents'] != null) {
      contents = <Content>[];
      json['contents'].forEach((v) {
        contents!.add( Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['folder'] = folder;
    data['totalSize'] = totalSize;
    if (contents != null) {
      data['contents'] = contents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Content {
  late String type;
  late String name;
  late String path;
   int? size;
   List<Content>? children;

  Content(
      {required this.type,
      required this.name,
      required this.path,
       this.size,
       this.children
      });

  Content.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    path = json['path'];
    size = json['size'];
    if (json['children'] != null) {
      children = <Content>[];
      json['children'].forEach((v) {
        children!.add( Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = type;
    data['name'] = name;
    data['path'] = path;
    data['size'] = size;
     if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
