import 'package:dinamik_ortalma_hesapla/constants/constants.dart';
import 'package:dinamik_ortalma_hesapla/data/helper_data.dart';
import 'package:dinamik_ortalma_hesapla/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikar;
  const DersListesi({required this.onElemanCikar ,Key? key}) : super(key: key);


  @override 
  Widget build(BuildContext context) {
    List<Ders> tumdersler = DataHelper.tumeklenendersler;
    return tumdersler.length > 0
        ? ListView.builder(
            itemCount: tumdersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a){
                onElemanCikar(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumdersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anarenk,
                        child: Text(
                          (tumdersler[index].harfDegeri *
                                  tumdersler[index].kredidegeri)
                              .toStringAsFixed(0),
                        ),
                      ),
                      subtitle: Text(
                          "${tumdersler[index].kredidegeri} kredi, Not degeri ${tumdersler[index].harfDegeri}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
          alignment: Alignment.center,
            child: Text(
              "Lütfen Ders Giriniz",
              style: Sabitler.baslikStyle,
            ),
          );
  }
}
