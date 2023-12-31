
class NBATeam {
  final int id;
  final String abbreviation;
  final String city;
  final String conference;
  final String division;
  final String fullName;
  final String name;

  NBATeam({
    required this.id,
    required this.abbreviation,
    required this.city,
    required this.conference,
    required this.division,
    required this.fullName,
    required this.name,
  });

  factory NBATeam.fromJson(Map<String, dynamic> json) {
    return NBATeam(
      id: json['id'],
      abbreviation: json['abbreviation'],
      city: json['city'],
      conference: json['conference'],
      division: json['division'],
      fullName: json['full_name'],
      name: json['name'],
    );
  }

  
}

