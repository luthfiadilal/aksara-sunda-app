import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

class DrawingRepository {
  Future<String> uploadDrawing(Uint8List pngData) async {
    // PNG ke JPEG
    final image = img.decodeImage(pngData);
    final jpegData = img.encodeJpg(image!);

    // POST
    final request = http.MultipartRequest('POST',
        Uri.parse("https://optimal-composed-ape.ngrok-free.app/predict"));
    request.files.add(http.MultipartFile.fromBytes(
      'file', jpegData,
      filename: 'capture.jpg', // Sesuaikan ekstensi menjadi .jpg
    ));

    final response = await request.send();

    // Tambahkan log untuk debugging
    print("Response status: ${response.statusCode}");

    // Membaca body respons
    final responseData = await response.stream.bytesToString();
    print("Response body: $responseData");

    if (response.statusCode == 200) {
      return jsonDecode(responseData)["prediction"];
    } else {
      throw Exception("Failed to upload image");
    }
  }
}
