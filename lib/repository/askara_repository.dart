import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aksara_sunda/utils/aksara.dart';

class AksaraRepository {
  final String apiUrl = "http://api-backend.aksa-sunda.my.id/api/aksara";

  Future<List<Aksara>> fetchAksara() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('Data dari API: $data'); // Tambahkan log ini

      List<Aksara> aksaraList =
          (data['data'] as List).map((item) => Aksara.fromJson(item)).toList();

      // // Decode URL gambar sebelum membuat list Aksara
      // List<Aksara> aksaraList = (data['data'] as List).map((item) {
      //   item['image_url'] = Uri.decodeFull(item['image_url']); // Decode URL
      //   print(
      //       'Decoded image URL: ${item['image_url']}'); // Log URL yang sudah didecode
      //   return Aksara.fromJson(item);
      // }).toList();

      return aksaraList;
    } else {
      throw Exception('Failed to load aksara');
    }
  }
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:aksara_sunda/utils/aksara.dart';

// class AksaraRepository {
//   final String apiUrl = "http://api-backend.aksa-sunda.my.id/api/aksara";

//   Future<List<Aksara>> fetchAksara() async {
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       print('Data dari API: $data'); // Log response

//       List<Aksara> aksaraList = (data['data'] as List).map((item) {
//         String imageUrl = item['image_url'];

//         // Menggunakan Uri.decodeComponent untuk mendecode hanya komponen tertentu dari URL
//         // Cek apakah URL mengandung karakter ter-encode
//         String decodedImageUrl = Uri.decodeComponent(imageUrl);

//         print('Decoded image URL: $decodedImageUrl');

//         // Update image_url dengan URL yang ter-decode
//         item['image_url'] = decodedImageUrl;

//         return Aksara.fromJson(item);
//       }).toList();

//       return aksaraList;
//     } else {
//       throw Exception('Failed to load aksara');
//     }
//   }
// }
