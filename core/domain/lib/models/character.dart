class Character {
  String created;
  List<String> episode;
  String gender;
  int id;
  String image;
  Location location;
  String name;
  Origin origin;
  String species;
  String status;
  String type;
  String url;

  Character({
    required this.created,
    required this.episode,
    required this.gender,
    required this.id,
    required this.image,
    required this.location,
    required this.name,
    required this.origin,
    required this.species,
    required this.status,
    required this.type,
    required this.url,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      created: json['created'],
      episode: json['episode'] != null
          ? List<String>.from(json['episode'])
          : List.empty(),
      gender: json['gender'],
      id: json['id'],
      image: json['image'],
      location: json['location'] != null
          ? Location.fromJson(json['location'])
          : Location(),
      name: json['name'],
      origin:
      json['origin'] != null ? Origin.fromJson(json['origin']) : Origin(),
      species: json['species'],
      status: json['status'],
      type: json['type'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created'] = this.created;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['species'] = this.species;
    data['status'] = this.status;
    data['type'] = this.type;
    data['url'] = this.url;
    if (this.episode != null) {
      data['episode'] = this.episode;
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.origin != null) {
      data['origin'] = this.origin.toJson();
    }
    return data;
  }
}

class Location {
  String? name;
  String? url;

  Location({this.name, this.url});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
