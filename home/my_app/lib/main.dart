import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my first app'),
        centerTitle: true,
        backgroundColor: Colors.red[400],
      ),
      // -------
      // body: Container(
      //   color: Colors.grey,
      //   child: Text('hellooow'),
      //   padding: EdgeInsets.all(20),
      //   margin: EdgeInsets.all(30),
      // ),
      // ------------
      // body: Padding(padding: EdgeInsets.all(20), child: Text('hellow')),
      // -------------
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Text('hwloow world'),
      //     TextButton(
      //       onPressed: () {},
      //       child: Text('click me'),
      //       style: TextButton.styleFrom(backgroundColor: Colors.green),
      //     ),
      //     Container(
      //       color: Colors.amber,
      //       padding: EdgeInsets.all(20),
      //       child: Text('in container'),
      //     ),
      //   ],
      // ),
      // -----------------
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: [Text('hwllow'), Text('world')]),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.amber,
            child: Text('one'),
          ),
          Container(
            padding: EdgeInsets.all(30),
            color: Colors.blue,
            child: Text('Two'),
          ),
          Container(
            padding: EdgeInsets.all(40),
            color: Colors.red,
            child: Text('Three'),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Text('press', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
