import 'package:dinamik_ortalma_hesapla/constants/constants.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersayisi;
  const OrtalamaGoster(
      {required this.dersayisi, required this.ortalama, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersayisi > 0 ? "$dersayisi Ders Girildi" : "Ders Seciniz",
          style: Sabitler.textStyle,
        ),
        Text(
          ortalama >= 0 ? "${ortalama.toStringAsFixed(2)}" : "0.0",
          style: Sabitler.ortalamaStyle,
        ),
        Text("ortalama", style: Sabitler.textStyle),
      ],
    );
  }
}
