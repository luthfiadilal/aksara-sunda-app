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
      notifyListeners();
    } catch (error) {
      print('Error fetching aksara: $error');
    }
  }
}
