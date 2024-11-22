import 'package:aksara_sunda/components/list_materi.dart';
import 'package:aksara_sunda/repository/materi_repository.dart';
import 'package:aksara_sunda/utils/materi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowallMateri extends StatelessWidget {
  const ShowallMateri({super.key});

  @override
  Widget build(BuildContext context) {
    final MateriRepository materiRepository = MateriRepository();
    final List<Materi> daftarMateri = materiRepository.getMateriList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Materi",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: ListView.builder(
        itemCount: daftarMateri.length,
        itemBuilder: (context, index) {
          return ListMateri(materi: daftarMateri[index]);
        },
      ),
    );
  }
}
