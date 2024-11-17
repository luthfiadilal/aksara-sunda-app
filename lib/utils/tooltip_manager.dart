import 'package:flutter/material.dart';
import 'package:coachmaker/coachmaker.dart';

class TooltipManager {
  static void showTooltip(BuildContext context) {
    CoachMaker(
      context,
      initialList: [
        CoachModel(
            initial: '1',
            title: 'Indonesia',
            maxWidth: 400,
            subtitle: [
              '1. Aceh',
              '2. Jakarta',
              '3. Bali',
              '4. Papua',
            ],
            header: Image.asset(
              'images/logo.png',
              height: 50,
              width: 50,
            )),
        CoachModel(
            initial: '2',
            title: 'Burung perkutut, burung kuthilang',
            maxWidth: 400,
            alignment: Alignment.centerRight,
            subtitle: [
              'kamu kentut enggak bilang bilang ',
            ],
            header: Image.asset(
              'images/logo.png',
              height: 50,
              width: 50,
            )),
        CoachModel(
            initial: '3',
            title: 'Burung perkutut, burung kuthilang',
            maxWidth: 400,
            alignment: Alignment.centerRight,
            subtitle: [
              'kamu kentut enggak bilang bilang ',
            ],
            header: Image.asset(
              'images/logo.png',
              height: 50,
              width: 50,
            )),
        CoachModel(
            initial: '4',
            title: 'Burung perkutut, burung kuthilang',
            maxWidth: 400,
            alignment: Alignment.centerRight,
            subtitle: [
              'kamu kentut enggak bilang bilang ',
            ],
            header: Image.asset(
              'images/logo.png',
              height: 50,
              width: 50,
            )),
      ],
      nextStep: CoachMakerControl.next,
      buttonOptions: CoachButtonOptions(
        buttonTitle: 'Lanjut',
        buttonStyle: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
          elevation: MaterialStateProperty.all(0),
        ),
      ),
    ).show();
  }
}
