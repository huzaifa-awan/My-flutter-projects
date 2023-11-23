import 'dart:async'; // Import Timer class
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(), // Display splash screen initially
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Your Tic Tac Toe game code
  // ...

  var grid = [
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
  ];
  var currentPlayer = 'X';
  var winner = '';

  void drawxo(i) {
    if (grid[i] == '-') {
      setState(() {
        grid[i] = currentPlayer;
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      });
      findwinner(grid[i]);
    }
  }

  bool checkmove(i1, i2, i3, sign) {
    if (grid[i1] == sign && grid[i2] == sign && grid[i3] == sign) {
      return true;
    } else {
      return false;
    }
  }

  void findwinner(currentsign) {
    if (checkmove(0, 1, 2, currentsign) ||
        checkmove(3, 4, 5, currentsign) ||
        checkmove(6, 7, 8, currentsign) || //rows
        checkmove(0, 3, 6, currentsign) ||
        checkmove(1, 4, 7, currentsign) ||
        checkmove(2, 5, 8, currentsign) || //coloumns
        checkmove(0, 4, 8, currentsign) ||
        checkmove(2, 4, 6, currentsign)) {
      winner = currentsign;
      setState(() {});
    }
  }

  void reset() {
    setState(() {
      winner = '';
      grid = [
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tic tac toe'),

        ),

        body: Column(
          children: [
            if (winner != '')
              Text(
                '$winner won the game',
                style: TextStyle(fontSize: 20),
              ),
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.black,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: grid.length,
                itemBuilder: (context, index) => Material(
                  color: Colors.amberAccent,
                  child: InkWell(
                      splashColor: Colors.black,
                      onTap: () {
                        drawxo(index);
                      },
                      child: Center(
                          child: Text(
                            grid[index],
                            style: TextStyle(fontSize: 40),
                          ))),
                ),
              ),
            ),
            ElevatedButton.icon(
                onPressed: reset,
                icon: Icon(Icons.refresh),
                label: Text("Play Again"))
          ],
        ),
      ),
    );
  }
}




class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

  void initState() {
    super.initState();

    // Introduce a delay and then navigate to the main game screen
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amberAccent,
        child: const Center(
          child: Image(image: NetworkImage('https://www.nicepng.com/png/detail/376-3761724_tic-tac-tic-tac-logo-png.png'),)
        ),

        // You can customize your splash screen UI here
        // ...
      ),
    );
  }
}
