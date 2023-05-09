class APIResponse {
  final String characters;
  final String locations;
  final String episodes;

  APIResponse(this.characters, this.locations, this.episodes);

  APIResponse.fromJson(Map<String, dynamic> json)
      : characters = json['characters'],
        locations = json['locations'],
        episodes = json['episodes'];

  Map<String, dynamic> toJson() =>
      {'characters': characters, 'locations': locations, 'episodes': episodes};
}
