import 'package:domain/models/character.dart';

class CharactersResponse {
  Info? info;
  List<Character?>? results;

  CharactersResponse({this.info, this.results});

  factory CharactersResponse.fromJson(Map<String, dynamic> json) {
    return CharactersResponse(
      info: json['info'] != null ? Info.fromJson(json['info']) : null,
      results: json['results'] != null
          ? (json['results'])
              .map<Character>((i) => Character.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v?.toJson()).toList();
    }
    return data;
  }
}

class Info {
  int? count;
  String? next;
  int? pages;
  String? prev;

  Info({this.count, this.next, this.pages, this.prev});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      count: json['count'],
      next: json['next'],
      pages: json['pages'],
      prev: json['prev'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['pages'] = this.pages;
    data['prev'] = this.prev;
    return data;
  }
}
