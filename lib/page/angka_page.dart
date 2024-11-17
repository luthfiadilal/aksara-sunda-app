import 'package:aksara_sunda/components/card_kamus.dart';
import 'package:aksara_sunda/models/aksara_view_model.dart';
import 'package:aksara_sunda/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AngkaPage extends StatefulWidget {
  @override
  State<AngkaPage> createState() => _AngkaPageState();
}

class _AngkaPageState extends State<AngkaPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AksaraViewModel>(context, listen: false).loadAksara();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AksaraViewModel>(context);

    print('Jumlah aksara: ${viewModel.aksaras.length}');

    // Filter aksara untuk hanya menampilkan yang bertipe "Swara"
    final swaraAksara =
        viewModel.aksaras.where((aksara) => aksara.tipe == 'Angka').toList();

    return Scaffold(
      appBar: AppBar(title: Text('Aksara Angka')),
      body: Consumer<AksaraViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.aksaras.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
            padding: EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Jumlah kolom
              crossAxisSpacing: 2, // Jarak horizontal antar kolom
              mainAxisSpacing: 2, // Jarak vertikal antar baris
              childAspectRatio: 3 / 2, // Rasio lebar dan tinggi item
            ),
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
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: -1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ]),
                child: ListTile(
                  contentPadding: EdgeInsets.all(12),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      aksara.imageUrl,
                      width: 80.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    aksara.aksara,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  subtitle: Text(
                    aksara.arti,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
