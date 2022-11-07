///To create list of artists create entity [Group]
class Group {
  final String name;
  final String link;
  final String about;

  const Group({required this.name, required this.link, required this.about});

  factory Group.fromJSON(Map<String, dynamic> json) {
    return Group(
      name: json["name"] as String,
      link: json["link"] as String,
      about: json["about"] as String,
    );
  }
}
