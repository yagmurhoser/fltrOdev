import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Timer? _timer;
  bool _isReminded = false;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  DateTime? selectedDateTime;

  void startReminder(DateTime scheduleTime) {
    final now = DateTime.now();
    final difference = scheduleTime.difference(now);

    _timer = Timer(difference, () {
      setState(() {
        _isReminded = true; // Hatırlatıcı tetiklendiğinde bir mesaj göster
      });
    });
  }

  void _scheduleReminder() {
    if (_dateController.text.isNotEmpty && _timeController.text.isNotEmpty) {
      try {
        String inputDate = _dateController.text;
        String inputTime = _timeController.text;

        DateTime parsedDate = DateTime.parse(inputDate);

        List<String> timeParts = inputTime.split(':');
        int hour = int.parse(timeParts[0]);
        int minute = int.parse(timeParts[1]);

        selectedDateTime = DateTime(
          parsedDate.year,
          parsedDate.month,
          parsedDate.day,
          hour,
          minute,
        );

        if (selectedDateTime!.isAfter(DateTime.now())) {
          startReminder(selectedDateTime!);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Geçmiş bir tarih ve saat giremezsiniz!')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tarih veya saat formatı yanlış!')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen tarih ve saat girin!')),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Timer'ı iptal et
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffe3bac8),
          title: Text('Kompost Hatırlatıcı'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Geri gitmek için Navigator.pop
            },
          ),
        ),
        body: Stack(
          children: [
            // Arka plan resmi
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage("assets/images/resim.jpg"), // Arka plan resmi
                  fit: BoxFit.cover, // Resmi tam ekran kapla
                ),
              ),
            ),
            // TextBox ve diğer widget'lar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _dateController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Tarih (YYYY-MM-DD)',
                      hintText: 'Örn: 2024-09-14',
                      filled: true, // Arka planı doldur
                      fillColor:
                          Colors.white.withOpacity(0.8), // Şeffaf beyaz renk
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _timeController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Saat (HH:MM)',
                      hintText: 'Örn: 14:30',
                      filled: true,
                      fillColor:
                          Colors.white.withOpacity(0.8), // Şeffaf beyaz renk
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _scheduleReminder,
                    child: Text('Hatırlatıcıyı Başlat'),
                  ),
                  SizedBox(height: 20),
                  _isReminded
                      ? Text(
                          'Kompostu kontrol etme zamanı!',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      : Text('Henüz hatırlatma yapılmadı.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
