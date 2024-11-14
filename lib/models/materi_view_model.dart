import 'package:aksara_sunda/utils/materi.dart';

import '../repository/materi_repository.dart';

class MateriViewModel {
  final MateriRepository _materiRepository = MateriRepository();

  List<Materi> get materiList => _materiRepository.getMateriList();
}
