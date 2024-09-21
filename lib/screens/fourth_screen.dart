import 'package:bitirmeprojesi/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CompostApp());
}

class CompostApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialSelectionPage(),
    );
  }
}

class MaterialSelectionPage extends StatelessWidget {
  final List<CompostMaterial> materials = [
    CompostMaterial(
      name: 'Üzüm',
      imagePath: 'assets/images/uzum.jpeg',
      compostInfo: "Üzüm gübresini yapmak için:\n\n"
          "1. Üzüm atıklarını toplayın: Üzüm kabukları ve çekirdekleri gibi organik atıkları toplayın.\n"
          "2. Kompost yapın: Üzüm atıklarını diğer organik maddelerle karıştırarak kompost kutusunda bekletin.\n"
          "3. Toprağa ekleyin: Ayrışan kompostu doğrudan toprağa karıştırın.\n\n"
          "Bu gübre, toprağı besleyerek bitki büyümesini destekler.",
    ),
    CompostMaterial(
      name: 'Elma',
      imagePath: 'assets/images/elma.jpeg',
      compostInfo: "Elma kabuğu gübresini yapmak için:\n\n"
          "1. Elma kabuklarını toplayın: Kabukları küçük parçalara ayırın.\n"
          "2. Kompost yapın: Elma kabuklarını diğer organik atıklarla kompost kutusuna ekleyin.\n"
          "3. Toprağa ekleyin: Kompost olunca bitkilerinizin toprağına karıştırın.\n\n"
          "Bu gübre, toprağı besleyip bitkilerin gelişimini destekler.",
    ),
    CompostMaterial(
      name: 'Muz Kabuğu',
      imagePath: 'assets/images/muz.jpeg',
      compostInfo: "Muz kabuğu gübresi yapmak için:\n\n"
          "1. Kabuğu toplayın: Muz kabuklarını küçük parçalara kesin.\n"
          "2. Toprağa ekleyin: Parçaları doğrudan toprağa karıştırın veya kompost kutusuna ekleyin.\n\n"
          "Muz kabuğu, potasyum ve fosfor sağlar, bu da bitkilerin sağlıklı büyümesini destekler.\n",
    ),
    CompostMaterial(
      name: 'Patates',
      imagePath: 'assets/images/patates.jpeg',
      compostInfo: "Patates kabuğu gübresi yapmak için:\n\n"
          "1. Patates kabuklarını toplayın: Kabukları küçük parçalara ayırın.\n"
          "2. Kompost yapın: Kabukları diğer organik atıklarla karıştırarak kompost kutusunda bekletin.\n"
          "3. Toprağa ekleyin: Kompost olduktan sonra toprağa karıştırın.\n\n"
          "Bu gübre, bitkilerinize besin sağlar ve toprağı zenginleştirir.\n",
    ),
    CompostMaterial(
      name: 'Soğan Kabuğu',
      imagePath: 'assets/images/sogan.jpeg',
      compostInfo: "Soğan kabuğu gübresi yapmak için:\n\n"
          "1. Soğan kabuklarını toplayın: Kurutulmuş soğan kabuklarını ayırın.\n"
          "2. Sıvı gübre yapın: Kabukları suya koyup 1-2 gün bekletin.\n"
          "3. Sulama suyu olarak kullanın: Hazırladığınız suyu bitkilerinizi sulamak için kullanın.\n\n"
          "Bu yöntem, bitkilere vitamin ve mineral takviyesi yapar.\n",
    ),
    CompostMaterial(
      name: 'Yumurta Kabuğu',
      imagePath: 'assets/images/yumurta.jpeg',
      compostInfo: "Yumurta kabuğu gübresi yapmak için:\n\n"
          "1. Kabukları toplayın: Yumurta kabuklarını iyice kurutun.\n"
          "2. Öğütün: Kabukları ince toz haline gelene kadar ezin.\n"
          "3. Toprağa karıştırın: Öğütülmüş yumurta kabuğunu doğrudan bitki toprağına ekleyin.\n\n"
          "Bu gübre, kalsiyum sağlayarak bitkilerin güçlenmesine yardımcı olur.\n",
    ),
    CompostMaterial(
      name: 'Kahve',
      imagePath: 'assets/images/kahve.jpeg',
      compostInfo: "Kahve telvesi gübresi yapmak için:\n\n"
          "1. Kahve telvesini toplayın: Telveyi kurutun.\n"
          "2. Toprağa ekleyin: Kurutulmuş kahve telvesini doğrudan toprağa serpiştirin veya kompost kutusuna ekleyin.\n\n"
          "Kahve telvesi, azot bakımından zengin olup bitkilerin büyümesini destekler.",
    ),
    CompostMaterial(
      name: 'Çay',
      imagePath: 'assets/images/cay.jpeg',
      compostInfo: "Çay posası gübresini yapmanın basit yolu:\n\n"
          "1. Kurutarak kullanma: Çay posasını kurutun ve doğrudan toprağa karıştırın.\n"
          "2. Kompost yapma: Çay posasını diğer organik atıklarla karıştırarak kompost yapın.\n"
          "3. Sıvı gübre: Çay posasını suya ekleyip 1-2 gün bekletin, bu suyu bitkileri sulamak için kullanın.\n\n"
          "Asit seven bitkiler için idealdir.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffb7d4e1),
        title: Text('Kompost Malzemeleri'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: materials.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CompostDetailPage(material: materials[i]),
              ),
            );
          },
          child: GridTile(
            child: Image.asset(materials[i].imagePath, fit: BoxFit.cover),
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              title: Text(materials[i].name),
            ),
          ),
        ),
      ),
    );
  }
}

class CompostMaterial {
  final String name;
  final String imagePath;
  final String compostInfo;

  CompostMaterial({
    required this.name,
    required this.imagePath,
    required this.compostInfo,
  });
}

class CompostDetailPage extends StatelessWidget {
  final CompostMaterial material;

  CompostDetailPage({required this.material});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kompost Bilgisi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset(material.imagePath, height: 200),
            SizedBox(height: 20),
            Text(
              material.compostInfo,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
