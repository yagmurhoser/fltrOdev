import 'package:bitirmeprojesi/screens/fourth_screen.dart';
import 'package:bitirmeprojesi/screens/home_screen.dart';
import 'package:bitirmeprojesi/screens/oyun_screen.dart';
import 'package:bitirmeprojesi/screens/second_screen.dart';
import 'package:bitirmeprojesi/screens/sorucevap_screen.dart';
import 'package:bitirmeprojesi/screens/timer_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SoruCevap());
}

class SoruCevap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Geri gitme işlemi
            },
          ),
          foregroundColor: Colors.white,
          title: Text(
            'Soru-Cevap',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff105a98), // AppBar arka plan rengi
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildQuestionAnswerTile(
                question:
                    'Kompost bitkiler için düzenli kullanılması gereken bir ek besin midir?',
                answer:
                    'Düzenli kompost kullanımıyla her çeşit toprağı daha verimli hâle getirebilirsiniz. Daha sağlam ve mineraller yönünden zengin bir toprak elde etmek.',
                color: Color(0xffaed9ed), // Soru kutucuğunun arka plan rengi
                textColor: Colors.black, // Başlık metni rengi
              ),
              _buildQuestionAnswerTile(
                question:
                    'Kompost hazırlarken malzemeleri karışık halde atabilir miyiz?',
                answer:
                    'Kompost hazırlığı esnasında sıralı şekilde kompostu kaba yerleştirmeniz önerilir ancak sadece iki katman yapacaksanız önce yaş sonra kuru malzemeyi ilave etmeniz önerilir.',
                color: Color(0xff97c7ef),
                textColor: Colors.black,
              ),
              _buildQuestionAnswerTile(
                question: 'Kompost oluşumunu nasıl hızlandırabiliriz?',
                answer:
                    'Hazırlayacağınız kompostun daha kısa zamanda oluşmasını sağlayabilmek için, kullanacağınız malzemeleri kovaya doldurmadan önce küçük parçalar haline getirebilirsiniz.',
                color: Color(0xff84beed),
                textColor: Colors.black,
              ),
              _buildQuestionAnswerTile(
                question:
                    'Kompost içerisine kesinlikle konmaması gereken malzemeler nelerdir?',
                answer:
                    'Kompost içerisine kesinlikle et, balık, tavuk, süt ve süt ürünleri konmamalıdır. Mutfak artıklarından yağlı yiyecek atıkları, kedi ve köpek dışkıları, tıbbi atıklar, naylon ve alüminyum malzemeler kompostunuz içerisinde yer almamalıdır.',
                color: Color(0xff6aade3),
                textColor: Colors.black,
              ),
              _buildQuestionAnswerTile(
                question: 'Kompost yapım aşamasında ipuçları nelerdir?',
                answer: "• Yeşil ve kahverengi atıkları dengede tut.\n"
                    "• Nemli, ama çok ıslak olmayan bir yığın yap.\n"
                    "• Küçük parçalar daha hızlı kompost olur.\n"
                    "• Yığınını düzenli havalandır.\n"
                    "• Et ve süt ürünlerini komposta ekleme.",
                color: Color(0xff5ea7e1),
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionAnswerTile(
      {required String question,
      required String answer,
      required Color color,
      required Color textColor}) {
    return Container(
      color: color, // Soru kutucuğunun arka plan rengi
      child: ExpansionTile(
        tilePadding: EdgeInsets.all(16.0),
        title: Text(
          question,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor), // Başlık stilini ayarlayın
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              answer,
              style: TextStyle(color: textColor), // Cevap metni rengi
            ),
          ),
        ],
      ),
    );
  }
}
