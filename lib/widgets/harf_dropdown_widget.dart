import 'package:dinamik_ortalma_hesapla/constants/constants.dart';
import 'package:dinamik_ortalma_hesapla/data/helper_data.dart';
import 'package:flutter/material.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onharfSecildi;
  const HarfDropdownWidget({required this.onharfSecildi ,Key? key }) : super(key: key);

  @override
  _HarfDropdownWidgetState createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
   double secilenharfdeger = 4;
  @override
  Widget build(BuildContext context) {
   
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Sabitler.anarenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadiuskullan,
      ),
      child: DropdownButton<double>(
        value: secilenharfdeger,
        onChanged: (secilen) {
          setState(() {
            secilenharfdeger = secilen!;
           widget.onharfSecildi(secilenharfdeger);
          });
        },
        underline: Container(),
        items: DataHelper.harfleriMenuItemCevir(),
      ),
    );
  }
}