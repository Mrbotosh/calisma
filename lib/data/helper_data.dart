import 'package:dinamik_ortalma_hesapla/model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper{
  static List<Ders> tumeklenendersler=[];
  static girilendersiekle(Ders ders){
    tumeklenendersler.add(ders);
  }
  static double ortalamahesapla(){
    double toplamNot=0;
    double toplamkredi=0;
   tumeklenendersler.forEach((element) {
     toplamNot=toplamNot+(element.harfDegeri*element.kredidegeri);
     toplamkredi+=element.kredidegeri;
   });
   return toplamNot/toplamkredi;
  }

  static List<String> tumDerslerinHarfleri(){
    return ["AA","BA","BB","CB","CC","DC","DD","FF"];
  }
  static double? harfiNotacevir(String harf){
    switch(harf){
      case "AA":
      return 4;
      case "BA":
      return 3.5;
      case "BB":
      return 3;
      case "CB":
      return 2.5;
      case "CC":
      return 2;
      case "DC":
      return 1.5;
      case "DD":
      return 1;
      case "FF":
      return 0;
      default :-1;
    }
  }
  static List<DropdownMenuItem<double>>? harfleriMenuItemCevir(){
return tumDerslerinHarfleri().map((e) =>DropdownMenuItem(child: Text(e),value: harfiNotacevir(e),),).toList();
  }
  static List<int> tumDerslerinKredileri(){
    return List.generate(10, (index) => index+1).toList();
  }
  static List<DropdownMenuItem<double>> kredileriMenuItemCevir(){
    return tumDerslerinKredileri().map((e) => DropdownMenuItem(child:Text(e.toString(),),value: e.toDouble(),)).toList();
  }



}

