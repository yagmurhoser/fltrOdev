import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// Diğer ekranlar için gerekli importlar
import 'package:bitirmeprojesi/screens/fourth_screen.dart';
import 'package:bitirmeprojesi/screens/home_screen.dart';
import 'package:bitirmeprojesi/screens/oyun_screen.dart';
import 'package:bitirmeprojesi/screens/second_screen.dart';
import 'package:bitirmeprojesi/screens/sorucevap_screen.dart';
import 'package:bitirmeprojesi/screens/timer_screen.dart';

void main() {
  runApp(Videoyy());
}

class Videoyy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoPlayerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/videos/Kompost.mp4') // video dosyan
          ..initialize().then((_) {
            setState(() {}); // Video başlatıldığında arayüzü güncelle
            _controller.play();
          });
  }

  @override
  void dispose() {
    _controller.dispose(); // Video kontrolcüsünü boşalt
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFFf2f6f0),
        toolbarHeight: 80,
        backgroundColor: const Color(0xff519d73),
        title: const Text("Video"),
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
                // Ana sayfa yönlendirmesi
                Navigator.pushReplacement(context,
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Videoyy())); // Bu sayfada olduğun için tekrar buraya yönlendirme
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.eco,
                color: Colors.green,
              ),
              title: const Text('Kompost Nedir'),
              onTap: () {
                // Kompost Nedir sayfasına yönlendirme
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
                // Gübre sayfasına yönlendirme
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
                // Sorular sayfasına yönlendirme
                Navigator.pushReplacement(context,
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
                // Hatırlatıcı sayfasına yönlendirme
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
                // Oyun sayfasına yönlendirme
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MatchingGame()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // Scroll ekliyoruz
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Başlık bilgisi (üst kısma eklemek istediğin bilgi)
              Text(
                "Kompost hakkında daha fazla bilgi için aşağıdaki videoyu izleyin.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // Video ile başlık arasında boşluk
              Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : CircularProgressIndicator(), // Video yüklenirken dönen daire
              ),
            ],
          ),
        ),
      ),
    );
  }
}
