import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random random= Random();

  int x=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lottery App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Lottery winning no is: 5'),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 250,
                width: 300,
                decoration: BoxDecoration(
                  color: x==5 ? Colors.green: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(13),

                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: x==5 ? Column (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.done_all,
                        color: Colors.green ,
                        size: 35,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Congragulation you have won the lottery, your number is $x \n  ',textAlign: TextAlign.center,)
                    ],
                  )  :
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 35,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Better luck next time, your number is $x \n try again ',textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            x=random.nextInt(6);
            print(x);
            setState(() {

            });
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
