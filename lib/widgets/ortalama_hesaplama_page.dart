import 'package:dinamik_ortalma_hesapla/constants/constants.dart';
import 'package:dinamik_ortalma_hesapla/data/helper_data.dart';
import 'package:dinamik_ortalma_hesapla/model/ders.dart';
import 'package:dinamik_ortalma_hesapla/widgets/ders_listesi.dart';
import 'package:dinamik_ortalma_hesapla/widgets/harf_dropdown_widget.dart';
import 'package:dinamik_ortalma_hesapla/widgets/kredi_dropdown_widget.dart';
import 'package:dinamik_ortalma_hesapla/widgets/ortalam_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  double secilenharfdeger = 4;
  double secilenkredideger = 1;
  String girilecekDers = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          Sabitler.basliktext,
          style: Sabitler.baslikStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: buildform()),
              Expanded(
                child: OrtalamaGoster(dersayisi: DataHelper.tumeklenendersler.length, ortalama: DataHelper.ortalamahesapla()),
                flex: 1,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
              child: DersListesi(
                onElemanCikar: (index){
                setState(() {
                  DataHelper.tumeklenendersler.removeAt(index);
                }); 
                },
              )
                
              ),
        ],
      ),
    );
  }

  buildform() {
    return Form(
      key: formkey,
      child: Column(
        children: [
          buildTextFormField(),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: HarfDropdownWidget(onharfSecildi:(harf){
                  secilenharfdeger=harf;
                }),
              )),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: KrediDropdownWidget(onKrediSecildi:(kredi){
                  secilenkredideger=kredi;
                })
              )),
              IconButton(
                onPressed: dersekleveOrtalamaHesapla,
                iconSize: 30,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Sabitler.anarenk,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilecekDers = deger!;
        });
      },
      decoration: InputDecoration(
        hintText: "matematik",
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadiuskullan,
            borderSide: BorderSide.none),
        fillColor: Sabitler.anarenk.shade100.withOpacity(0.3),
        filled: true,
      ),
    );
  }

  


    
  

  void dersekleveOrtalamaHesapla() {
    if (formkey.currentState!.validate()) {
      var eklenecekDers = Ders(
          ad: girilecekDers,
          harfDegeri: secilenharfdeger,
          kredidegeri: secilenkredideger);
          DataHelper.girilendersiekle(eklenecekDers);
          setState(() { });
    }
  }
}
