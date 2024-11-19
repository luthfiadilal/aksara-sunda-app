class Aksara {
  final int id;
  final String aksara;
  final String arti;
  final String tipe;
  final String imageUrl;
  final String audioUrl;

  Aksara({
    required this.id,
    required this.aksara,
    required this.arti,
    required this.tipe,
    required this.imageUrl,
    required this.audioUrl,
  });

  factory Aksara.fromJson(Map<String, dynamic> json) {
    return Aksara(
      id: json['id'],
      aksara: json['aksara'],
      arti: json['arti'],
      tipe: json['tipe'],
      imageUrl: json['image_url'],
      audioUrl: json['suara_url'],
    );
  }
}
