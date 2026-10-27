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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'my app',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.blueGrey[600],
                fontFamily: 'IndieFlower',
              ),
            ),
            Image.asset(
              'assets/Nitro_Wallpaper_02.jpg',
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
            Icon(
              Icons.airport_shuttle,
              color: const Color.fromARGB(255, 69, 61, 38),
              size: 50,
            ),
            ElevatedButton.icon(
              onPressed: () {
                print('button clicked');
              },
              icon: Icon(Icons.mail),
              label: Text('send mail'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {
                print("icon button pressed");
              },
              icon: Icon(Icons.alternate_email),
              color: Colors.green,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Text('press', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
