import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());

  //const
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plantas',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PlantListScreen(),
    );
  }
}

class PlantListScreen extends StatelessWidget {
  final List<Plant> plants = [
    Plant(
      name: 'Suculenta',
      description: 'Las suculentas son plantas que almacenan agua en sus hojas, tallos o raíces, lo que les permite sobrevivir en climas áridos.',
      imageUrl: 'https://cdn.pixabay.com/photo/2023/08/31/21/52/houseleek-8225994_1280.jpg',
    ),
    Plant(
      name: 'Helecho',
      description: 'Los helechos son plantas sin flores que se reproducen por esporas. Son populares como plantas de interior debido a su follaje exuberante.',
      imageUrl: 'https://cdn.pixabay.com/photo/2024/05/06/15/37/tulip-8743584_1280.jpg',
    ),
    Plant(
      name: 'Cactus',
      description: 'Los cactus son plantas suculentas adaptadas a climas áridos. Tienen espinas en lugar de hojas y pueden almacenar grandes cantidades de agua.',
      imageUrl: 'https://cdn.pixabay.com/photo/2023/11/13/00/47/cactus-8384331_1280.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plantas'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 3 / 4,
        ),
        itemCount: plants.length,
        itemBuilder: (context, index) {
          return PlantCard(plant: plants[index]);
        },
      ),
    );
  }
}

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
              child: Image.network(
                plant.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plant.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  plant.description,
                  style: TextStyle(fontSize: 16),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Plant {
  final String name;
  final String description;
  final String imageUrl;

  Plant({required this.name, required this.description, required this.imageUrl});
}