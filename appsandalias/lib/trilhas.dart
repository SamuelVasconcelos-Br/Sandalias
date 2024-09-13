import 'package:appsandalias/main.dart';
import 'package:flutter/material.dart';

class TrilhasPag extends StatelessWidget {
const TrilhasPag({super.key}); 

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),

      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 215, 71),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Trilha'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.pets),
              title: const Text('Espécies'),
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()), );
              },
            ),
          ],
        ),
      ),

       body: GridView.count(
        crossAxisCount: 1,
        children: const <Widget>[
          TrilhaCard(imagePath: 'assets/images/PraiaMaresias.jpg', trilhaName: 'Praia de Maresias',  descricao: '',),
          TrilhaCard(imagePath: 'assets/images/PraiaEnseada.jpeg', trilhaName: 'Praia da Enseada', descricao: '',),
          TrilhaCard(imagePath: 'assets/images/PraiaCouves.jpeg', trilhaName: 'Praia das Couves', descricao: '',),
          TrilhaCard(imagePath: 'assets/images/PraiaJuliao.jpeg', trilhaName: 'Praia do Julião', descricao: '',),
        ],
      ),
    );


}
}


class TrilhaCard extends StatelessWidget {
  final String imagePath;
  final String descricao;
  final String trilhaName;
  final VoidCallback? onTap;

  const TrilhaCard({
    super.key,
     required this.imagePath,
    required this.descricao,
    required this.trilhaName,
    this.onTap,
  });
  
 @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  trilhaName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
