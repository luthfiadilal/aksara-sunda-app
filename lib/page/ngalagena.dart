import 'package:aksara_sunda/components/card_kamus.dart';
import 'package:aksara_sunda/models/aksara_view_model.dart';
import 'package:aksara_sunda/utils/app_color.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Ngalagena extends StatefulWidget {
  @override
  State<Ngalagena> createState() => _NgalagenaState();
}

class _NgalagenaState extends State<Ngalagena> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AksaraViewModel>(context, listen: false).loadAksara();
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AksaraViewModel>(context);

    print('Jumlah aksara: ${viewModel.aksaras.length}');

    // Filter aksara untuk hanya menampilkan yang bertipe "Swara"
    final swaraAksara = viewModel.aksaras
        .where((aksara) => aksara.tipe == 'Ngalagena')
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('Aksara Ngalagena')),
      body: Consumer<AksaraViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.aksaras.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: swaraAksara.length,
            itemBuilder: (context, index) {
              final aksara = swaraAksara[index];
              return Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.shadow,
                          spreadRadius: -1,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              aksara.imageUrl,
                              width: 80.w,
                              height: 80.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                aksara.aksara,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.sp,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                              Text(
                                aksara.arti,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ],
                      ),

                      //  tombol mic
                      GestureDetector(
                        onTap: () async {
                          await _audioPlayer.play(UrlSource(aksara.audioUrl));
                          await _audioPlayer.resume();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Theme.of(context).colorScheme.primary),
                          child: SvgPicture.asset(
                            "images/sound.svg",
                            fit: BoxFit.cover,
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                      )
                    ],
                  ));
            },
          );
        },
      ),
    );
  }
}
