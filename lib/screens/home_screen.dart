import 'package:bitirmeprojesi/screens/fourth_screen.dart';
import 'package:bitirmeprojesi/screens/home_screen.dart';
import 'package:bitirmeprojesi/screens/ikinci_screen.dart';
import 'package:bitirmeprojesi/screens/oyun_screen.dart';
import 'package:bitirmeprojesi/screens/second_screen.dart';
import 'package:bitirmeprojesi/screens/sorucevap_screen.dart';
import 'package:bitirmeprojesi/screens/timer_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffebf6df),
      appBar: AppBar(
        foregroundColor: const Color(0xFFf2f6f0),
        toolbarHeight: 80,
        backgroundColor: const Color(0xff519d73),
        title: const Text("EKOKAPSÜL"),
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
                Navigator.pop(context); // Ana sayfaya geri dön
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SecondScreen())); // Kompost Nedir sayfasına yönlendirme
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MatchingGame())); // Oyun sayfasına yönlendirme
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                  child: Image.asset(
                    'assets/images/ilk.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Uygulamanın amacı, kullanıcılara kompost yapımı konusunda bilgi sunmak ve onları bu konuda bilgilendirmektir. Uygulama, kullanıcıların organik atıkları nasıl doğru bir şekilde kompost haline getirebileceğini, hangi malzemelerin kullanılacağını ve kompostun nasıl kullanılacağını adım adım gösterebilir. Ayrıca, kullanıcıların kompost yapma sürecini takip etmelerine yardımcı olmak için rehberlik ve hatırlatıcılar sağlayabilir.',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.share),
                    color: Colors.blue,
                    onPressed: () {
                      // Facebook linkine yönlendirme
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.link),
                    color: Colors.blueAccent,
                    onPressed: () {
                      // LinkedIn linkine yönlendirme
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt),
                    color: Colors.purple,
                    onPressed: () {
                      // Instagram linkine yönlendirme
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.message),
                    color: Colors.lightBlue,
                    onPressed: () {
                      // Twitter linkine yönlendirme
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
