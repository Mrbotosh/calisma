import 'package:dinamik_ortalma_hesapla/constants/constants.dart';
import 'package:dinamik_ortalma_hesapla/data/helper_data.dart';
import 'package:flutter/material.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  const KrediDropdownWidget({required this.onKrediSecildi ,Key? key }) : super(key: key);

  @override
  _KrediDropdownWidgetState createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double secilenkredideger = 1;
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
          value: secilenkredideger,
          onChanged: (secilen) {
            setState(() {
              secilenkredideger = secilen!;
              widget.onKrediSecildi(secilenkredideger);
            });
          },
          underline: Container(),
          items: DataHelper.kredileriMenuItemCevir()),
    );
  }
}