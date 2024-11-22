import 'package:aksara_sunda/repository/askara_repository.dart';
import 'package:aksara_sunda/utils/aksara.dart';
import 'package:flutter/material.dart';

class AksaraViewModel extends ChangeNotifier {
  final AksaraRepository _repository = AksaraRepository();
  List<Aksara> _aksaras = [];

  List<Aksara> get aksaras => _aksaras;

  Future<void> loadAksara() async {
    try {
      _aksaras = await _repository.fetchAksara();

      // _aksaras = _aksaras.map((aksara) {
      //   return Aksara(
      //     id: aksara.id,
      //     aksara: aksara.aksara,
      //     tipe: aksara.tipe,
      //     arti: aksara.arti,
      //     imageUrl: Uri.decodeFull(aksara.imageUrl),
      //     audioUrl: Uri.decodeFull(aksara.audioUrl),
      //   );
      // }).toList();
      notifyListeners();
    } catch (error) {
      print('Error fetching aksara: $error');
    }
  }
}
