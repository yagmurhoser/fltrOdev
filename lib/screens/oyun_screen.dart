import 'package:bitirmeprojesi/screens/fourth_screen.dart';
import 'package:bitirmeprojesi/screens/home_screen.dart';
import 'package:bitirmeprojesi/screens/ikinci_screen.dart';
import 'package:bitirmeprojesi/screens/oyun_screen.dart';
import 'package:bitirmeprojesi/screens/second_screen.dart';
import 'package:bitirmeprojesi/screens/sorucevap_screen.dart';
import 'package:bitirmeprojesi/screens/timer_screen.dart';
import 'package:flutter/material.dart';

class MatchingGame extends StatefulWidget {
  const MatchingGame({Key? key}) : super(key: key);

  @override
  _MatchingGameState createState() => _MatchingGameState();
}

class _MatchingGameState extends State<MatchingGame> {
  final List<String> wasteItems = [
    'Plastik Şişe',
    'Sebze Kabukları',
    'Kağıt',
    'Cam Şişe',
    'Alüminyum Kutu'
  ];

  final Map<String, String> itemToBin = {
    'Plastik Şişe': 'Geri Dönüşüm Kutusu',
    'Sebze Kabukları': 'Kompost Kutusu',
    'Kağıt': 'Geri Dönüşüm Kutusu',
    'Cam Şişe': 'Cam Kutusu',
    'Alüminyum Kutu': 'Geri Dönüşüm Kutusu',
  };

  final List<String> bins = [
    'Kompost Kutusu',
    'Geri Dönüşüm Kutusu',
    'Cam Kutusu'
  ];

  String? selectedItem;
  String message = '';
  final Map<String, bool> itemPlacedCorrectly = {};
  bool isGameOver = false;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    setState(() {
      isGameOver = false;
      message = '';
      for (var item in wasteItems) {
        itemPlacedCorrectly[item] = false;
      }
    });
  }

  void _onBinSelected(String bin) {
    if (selectedItem == null || isGameOver) return;

    final correctBin = itemToBin[selectedItem!] ?? '';

    setState(() {
      if (bin == correctBin) {
        message = 'Doğru!';
        itemPlacedCorrectly[selectedItem!] = true;
      } else {
        message = 'Yanlış!';
        itemPlacedCorrectly[selectedItem!] = false;
      }
      selectedItem = null;

      // Check if all items are placed correctly
      if (itemPlacedCorrectly.values.every((placed) => placed)) {
        message = 'Tebrikler! Tüm atıkları doğru şekilde eşleştirdiniz.';
        isGameOver = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7EED3),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xffC63C51),
        title: const Text('Eşleştirme Oyunu'),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menü',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.video_library,
                color: Colors.grey,
              ),
              title: const Text('Video'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Videoyy())); // Oyun sayfasına yönlendirme
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.eco,
                color: Colors.green,
              ),
              title: const Text('Kompost Rehberi'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.nature,
                color: Colors.brown,
              ),
              title: const Text('Gübre'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompostApp()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.help_outline,
                color: Colors.orange,
              ),
              title: const Text('Sorular'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SoruCevap()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.timer,
                color: Colors.black,
              ),
              title: const Text('Hatırlatıcı'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.sports_esports,
                color: Colors.red,
              ),
              title: const Text('Oyun'),
              onTap: () {
                Navigator.pushNamed(context,
                    '/game'); // Zaten oyun sayfasındasınız, bu sebeple buraya kod eklemenize gerek yok
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30), // Butonları yukarı almak için boşluk
              Wrap(
                spacing: 10, // Butonlar arası yatay boşluk
                runSpacing: 10, // Butonlar arası dikey boşluk
                alignment: WrapAlignment.center, // Butonları ortaladık
                children: wasteItems.map((item) {
                  return ElevatedButton(
                    onPressed: isGameOver
                        ? null
                        : () {
                            setState(() {
                              selectedItem = item;
                            });
                          },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xffD95F59), // Text color
                    ),
                    child: Text(item),
                  );
                }).toList(),
              ),
              const SizedBox(
                  height: 40), // Kutuların yukarıda olmasını sağlıyoruz
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        bins.where((bin) => bin != 'Cam Kutusu').map((bin) {
                      return GestureDetector(
                        onTap: isGameOver
                            ? null
                            : () {
                                _onBinSelected(bin);
                              },
                        child: Container(
                          width: 100, // Kutuları biraz daralttık
                          height: 100,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10), // Kutular arası mesafe
                          decoration: BoxDecoration(
                            color: Color(0xffFEF3E2), // Container color
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              bin,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              textAlign:
                                  TextAlign.center, // Center text alignment
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20), // Kutular arası boşluk
                  Align(
                    alignment: Alignment.center, // Ortalanan Cam Kutusu
                    child: GestureDetector(
                      onTap: isGameOver
                          ? null
                          : () {
                              _onBinSelected('Cam Kutusu');
                            },
                      child: Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(
                            top: 10), // Üstten boşluk ekledik
                        decoration: BoxDecoration(
                          color: Color(0xffFEF3E2), // Container color
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Cam Kutusu',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign:
                                TextAlign.center, // Center text alignment
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                  height: 40), // Kutular ile geri bildirim arasına boşluk
              Text(
                message,
                style: TextStyle(
                  fontSize: 18,
                  color: message.contains('Tebrikler')
                      ? Colors.blue
                      : (message.contains('Doğru') ? Colors.green : Colors.red),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              if (isGameOver)
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.8, // Buton genişliği ekranın %80'i olacak
                  child: ElevatedButton(
                    onPressed: _resetGame,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green, // Text color
                    ),
                    child: const Text(
                      'Oyunu Yeniden Başlat',
                      textAlign: TextAlign.center, // Yazıyı ortaladık
                      style: TextStyle(fontSize: 16), // Yazı boyutunu ayarladık
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
