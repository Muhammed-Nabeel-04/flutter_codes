import 'package:flutter/material.dart';
import 'package:profile_app/models.dart';
import 'package:profile_app/models_data.dart';
import 'package:profile_app/profile_fill_screen.dart';
import 'package:profile_app/settings_screen.dart';

class ProfileShowScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileShowScreen> createState() => _ProfileShowScreenState();
}

class _ProfileShowScreenState extends State<ProfileShowScreen> {
  bool isFilled = dataModels.isNotEmpty;

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
        if (dataModels.isNotEmpty) {
          dataModels[0] = newUser;
        } else {
          dataModels.add(newUser);
        }
        isFilled = true;
      });
    }
  }

  // Future<void> settingsData() async{
  //   if (selectedIndex == 1){
  //   final result = await
  //            Navigator.push(context, MaterialPageRoute(builder: (_)=> const SettingsScreen()));
  //           selectedIndex = 0;
  //            if (result != null){
  //             setState(() {

  //             });
  //            }
  //   }

  // }

  int selectedIndex = 0;
  int lang = settings.lang;
  double textSize = settings.textSize;
  bool isDark = settings.isDark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Screen",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 10 * textSize,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (isFilled) ...[
              Card(
                color: Theme.of(context).colorScheme.tertiary,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),

                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Theme.of(context).colorScheme.secondary,

                        child: Text(
                          dataModels[0].name
                              .trim()
                              .split(' ')
                              .where((word) => word.isNotEmpty)
                              .map((word) => word[0].toUpperCase())
                              .take(2)
                              .join(),
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        // width: 300,
                        // height: 250,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(16),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              
                                   Column(
                                      children: [
                                        Text(
                                          'Name: ${dataModels[0].name}',
                                          style: TextStyle(fontSize: 10 * textSize, color: Theme.of(context).colorScheme.primary),
                                        ),
                                        Text(
                                          'Email: ${dataModels[0].mail}',
                                          style: TextStyle(fontSize: 10 * textSize , color: Theme.of(context).colorScheme.primary),
                                        ),
                                        Text(
                                          'Phone: ${dataModels[0].phone}',
                                          style: TextStyle(fontSize:10 * textSize , color: Theme.of(context).colorScheme.primary),
                                        ),
                                        Text(
                                          'Role: ${dataModels[0].role}',
                                          style: TextStyle(fontSize:10 * textSize , color: Theme.of(context).colorScheme.primary),
                                        ),
                                      ],
                                    )
                                  
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
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    addDetails();
                  },
                  child: Text('Fill'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
