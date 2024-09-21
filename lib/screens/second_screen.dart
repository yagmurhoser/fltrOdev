import 'package:bitirmeprojesi/screens/fourth_screen.dart';
import 'package:bitirmeprojesi/screens/home_screen.dart';
import 'package:bitirmeprojesi/screens/ikinci_screen.dart';
import 'package:bitirmeprojesi/screens/oyun_screen.dart';
import 'package:bitirmeprojesi/screens/sorucevap_screen.dart';
import 'package:bitirmeprojesi/screens/timer_screen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffbb9bc1),
        title: const Text('Kompost Rehberi'),
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeScreen())); // HomeScreen yerine kendi sayfanızı ekleyin
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
                Navigator.pushReplacement(context,
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
                Navigator.pushReplacement(context,
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SoruCevap()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.timer,
                color: Colors.black,
              ),
              title: const Text('Zamanlayıcı'),
              onTap: () {
                Navigator.pushReplacement(
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MatchingGame()));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          Row(
            children: const [
              Icon(Icons.check),
              SizedBox(width: 10),
              Text(
                'Yeşiller (Azot bakımından zengin)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          _buildSection(
            context,
            'Yeşiller (Azot bakımından zengin)',
            [
              'Kahve telvesi',
              'Yumurta kabukları',
              'Meyve ve sebze artıkları',
              'Çay yaprakları',
              'Sadece bitki yiyen hayvanlardan elde edilen gübre ve yataklıklar',
              'Çim kırpıntıları',
              'Sağlıklı çiçekler ve bitkiler',
              'Deniz yosunu',
              'Yabani otlar (tohumsuz)',
            ],
            Colors.lightGreen.shade100,
          ),
          Row(
            children: const [
              Icon(Icons.close),
              SizedBox(width: 10),
              Text(
                'Hayır (Komposta eklememeniz gerekenler)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          _buildSection(
            context,
            'Hayır (Komposta eklememeniz gerekenler)',
            [
              'Süt ürünleri',
              'Gres, katı ve sıvı yağlar',
              'Cam',
              'Kedi kumu',
              'Et ve balık',
              'Et yiyen hayvanların gübresi (köpekler ve kediler)',
              'Metaller',
              'Plastikler',
              'Mumlu veya parlak kağıt',
              'Hastalıklı veya istilaya uğramış bitkiler',
              'İstilacı bitkiler',
              'Pestisit uygulanmış bitkiler veya çim kırpıntıları',
              'Kum ve kayalar',
              'Kömür ve mangal kömürü',
              'İşlenmiş ahşap ürünler',
            ],
            Colors.red.shade100,
          ),
          Row(
            children: const [
              Icon(Icons.check),
              SizedBox(width: 10),
              Text(
                'Browns (Karbon bakımından zengin)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          _buildSection(
            context,
            'Kahverengiler (Karbon bakımından zengin)',
            [
              'Ekmek ve tahıl ürünleri (pirinç, makarna, tortilla, vb.)',
              'Kahve filtreleri',
              'Parçalanmış karton ve kağıt ürünleri (mumlu değil)',
              'Mısır koçanları (doğrayın!)',
              'Sonbahar yaprakları',
              'Çam iğneleri',
              'Talaş',
              'Saman',
              'Odun yongaları ve külleri',
            ],
            Colors.brown.shade100,
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
      BuildContext context, String title, List<String> items, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 8.0),
          ...items
              .map((item) =>
                  Text('• $item', style: TextStyle(color: Colors.black54)))
              .toList(),
        ],
      ),
    );
  }
}
