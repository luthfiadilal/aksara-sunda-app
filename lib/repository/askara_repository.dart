import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aksara_sunda/utils/aksara.dart';

class AksaraRepository {
  final String apiUrl =
      "https://optimal-composed-ape.ngrok-free.app/api/aksara"; // Ganti dengan URL baru

  Future<List<Aksara>> fetchAksara() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('Data dari API: $data'); // Tambahkan log ini

      List<Aksara> aksaraList =
          (data['data'] as List).map((item) => Aksara.fromJson(item)).toList();
      return aksaraList;
    } else {
      throw Exception('Failed to load aksara');
    }
  }
}
