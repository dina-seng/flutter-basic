import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body:
            // YOUR CODE
            Row(
              children: [
                SizedBox(
                  width: 60,
                  child: Column(
                    children: [
                      Container(height: 40, color: Colors.indigo),
                      Container(height: 40, color: Colors.pink),
                      Expanded(child: Container(color: Colors.indigo)),
                      Container(height: 40, color: Colors.pink),
                      Container(height: 40, color: Colors.indigo),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    children: [
                      Expanded(flex: 2, child: Container(color: Colors.cyan)),

                      const SizedBox(height: 15),

                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.deepPurple,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.white,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.white,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.white,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      ),
    ),
  );
}
