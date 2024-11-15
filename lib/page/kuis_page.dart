import 'package:aksara_sunda/page/start_kuis_page.dart';
import 'package:flutter/material.dart';

class KuisPage extends StatelessWidget {
  const KuisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StartKuisPage()));
          },
          child: Text("Mulai Kuis")),
    ));
  }
}
