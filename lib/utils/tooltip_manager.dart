import 'package:aksara_sunda/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:coachmaker/coachmaker.dart';

class TooltipManager {
  static void showTooltip(BuildContext context) {
    CoachMaker(
      context,
      initialList: [
        CoachModel(
          initial: '1',
          title: 'Belajar menulis aksara sunda',
          maxWidth: 400,
          subtitle: [
            'Ini untuk belajar menulis aksara sunda, dengan koreksi oleh AI',
          ],
        ),
        CoachModel(
          initial: '2',
          title: 'Kamus aksara sunda',
          maxWidth: 400,
          alignment: Alignment.centerRight,
          subtitle: [
            'Ini kamus aksara sunda dengan arti huruf yang lengkap',
          ],
        ),
        CoachModel(
          initial: '3',
          title: 'Materi Sunda dan Aksara Sunda',
          maxWidth: 400,
          alignment: Alignment.centerRight,
          subtitle: [
            'Kamu bisa mempelajari dari sejarah aksara sunda hingga materi tentan aksara sunda seperti menulis, membaca, dan sebagainya dengan berbasis vidio',
          ],
        ),
        CoachModel(
          initial: '4',
          title: 'Kumpulan semua materi',
          maxWidth: 400,
          alignment: Alignment.centerRight,
          subtitle: [
            'kamu bisa melihat semua materi yang lengkap',
          ],
        ),
      ],
      nextStep: CoachMakerControl.next,
      buttonOptions: CoachButtonOptions(
        buttonTitle: 'Lanjut',
        buttonStyle: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColor.backgroundColor),
          elevation: MaterialStateProperty.all(0),
        ),
      ),
    ).show();
  }
}
