import 'package:aksara_sunda/components/list_materi.dart';
import 'package:aksara_sunda/repository/materi_repository.dart';
import 'package:aksara_sunda/utils/materi.dart';
import 'package:flutter/material.dart';

class ShowallMateri extends StatelessWidget {
  const ShowallMateri({super.key});

  @override
  Widget build(BuildContext context) {
    final MateriRepository materiRepository = MateriRepository();
    final List<Materi> daftarMateri = materiRepository.getMateriList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Materi"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: daftarMateri.length,
        itemBuilder: (context, index) {
          return ListMateri(materi: daftarMateri[index]);
        },
      ),
    );
  }
}
