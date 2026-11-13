import 'package:flutter/material.dart';
import 'package:profile_app/models.dart';
import 'package:profile_app/models_data.dart';
import 'package:profile_app/profile_fill_screen.dart';

class ProfileShowScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileShowScreen> createState() => _ProfileShowScreenState();
}

class _ProfileShowScreenState extends State<ProfileShowScreen> {
  bool isFilled = false;

  Future<void> addDetails() async {
    final newUser = await Navigator.push<DataModel>(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ProfileScreen(user: dataModels.isNotEmpty ? dataModels[0] : null),
      ),
    );

    if (newUser != null) {
      setState(() {
        dataModels.add(newUser);
        isFilled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Screen",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (isFilled) ...[
              Card(
                color: Colors.grey,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: CircleAvatar(radius: 55),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: 300,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              dataModels.isNotEmpty
                                  ? Column(
                                      children: [
                                        Text(
                                          'Name: ${dataModels[0].name}',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          'Email: ${dataModels[0].mail}',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          'Phone: ${dataModels[0].phone}',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          'Role: ${dataModels[0].role}',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    )
                                  : Text('data'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  addDetails();
                },
                child: Text('Edit'),
              ),
            ] else ...[
              ElevatedButton(
                onPressed: () {
                  addDetails();
                },
                child: Text('Fill'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
