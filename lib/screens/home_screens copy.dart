import 'package:flutter/material.dart';

class HomeScrens extends StatefulWidget {
  const HomeScrens({super.key});

  @override
  State<HomeScrens> createState() => _HomeScrensState();
}

class _HomeScrensState extends State<HomeScrens> {
  int counter = 0;
  void increase() {
    setState(() {
      counter++;
    });
  }

  void decrease() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    const fontSize = 32.0;
    const myTextStyle = TextStyle(color: Colors.blue, fontSize: fontSize);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          elevation: 2.0,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Hola Mundo',
                  style: TextStyle(color: Colors.red, fontSize: 24)),
              Text('$counter', style: myTextStyle)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: _CustomFloatingActions(
          increaseFn: increase,
          decreaseFn: decrease,
        ));
  }
}

class _CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  const _CustomFloatingActions({
    Key? key,
    required this.increaseFn,
    required this.decreaseFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          heroTag: null,
          onPressed: () => increaseFn(),
          /* (() {
            setState(() {
              counter++;
            });
            print(counter);
          }), */
          mini: true,
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          heroTag: null,
          onPressed: () => decreaseFn(),
          /*  ((() => setState(() {
                counter--;
              }))), */
          mini: true,
          child: const Icon(Icons.exposure_minus_1),
        )
      ],
    );
  }
}
