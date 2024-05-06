import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:myflutter/database/CardModel.dart';



void main() => runApp(const CardExampleApp());

class CardExampleApp extends StatelessWidget {
  const CardExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 245, 207),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 209, 219, 151),
          title: const Text('English Card'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Open settings',
              onPressed: () {
                // handle the press
              },
            ),
          ],
        ),
        body: const CardExample(),
        //bottomSheet: bottomArrow(),
      ),
    );
  }
}

class CardExample extends StatefulWidget {
  const CardExample({super.key});

  @override
  State<CardExample> createState() => _CardExampleState();
}

class _CardExampleState extends State<CardExample> {
  bool cardSideEnglish = false;
  int count = 0;
  String image =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/House_Sparrow_m_2892.jpg/1920px-House_Sparrow_m_2892.jpg';
  String title = 'Sparrow';
  Map<String, String> card = {
    'Sparrow':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/House_Sparrow_m_2892.jpg/1920px-House_Sparrow_m_2892.jpg',
    'Fly':
        'https://upload.wikimedia.org/wikipedia/commons/a/a9/Musca.domestica.female.jpg',
    'Ant':
        'https://upload.wikimedia.org/wikipedia/commons/a/a6/Meat_eater_ant_feeding_on_honey02.jpg',
  };

  late Future<List<EnglishCard>> _cardList;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FlipCard(
          fill: Fill
              .fillBack, // Fill the back side of the card to make in the same size as the front.
          direction: FlipDirection.HORIZONTAL, // default
          side: CardSide.FRONT, // The side to initially display.
          front: Container(
            height: 500,
            child: Card(
              color: Colors.yellow[100],

              elevation: 2.0,
              //margin: EdgeInsets.all(50.0),
              //margin: EdgeInsets.symmetric(horizontal: 100),

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              semanticContainer: true,

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                      image,
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          back: Container(
            height: 500,
            child: Card(
              color: Colors.green[100],

              elevation: 2.0,
              //margin: EdgeInsets.all(50.0),
              //margin: EdgeInsets.symmetric(horizontal: 100),

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              semanticContainer: true,

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                      image,
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Text(
                    "Соловей",
                    style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        bottomArrow(),
      ],
    );
  }

  Widget bottomArrow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FloatingActionButton(
          onPressed: () {
            setState(() {
              image = 'https://upload.wikimedia.org/wikipedia/commons/a/a9/Musca.domestica.female.jpg';
            title = "fly";
            });
            
          },
          backgroundColor: Colors.amber,
          child: const Icon(Icons.skip_previous),
        ),
        const SizedBox(
          width: 40,
          //height: 40,
        ),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.amber,
          child: const Icon(Icons.skip_next),
        ),
      ],
    );
  }
}
