import 'package:flutter/material.dart';
import 'package:profile_app/models.dart';
import 'package:profile_app/models_data.dart';
import 'package:profile_app/profile_show_screen.dart';

class ProfileScreen extends StatefulWidget {
  final DataModel? user;
  const new({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSaved = false;
  // List  dataModels = [];

  @override
  Widget build(BuildContext context) {
    late final nameEditor = TextEditingController(
      text: widget.user?.name ?? "",
    );
    late final mailEditor = TextEditingController(
      text: widget.user?.mail ?? "",
    );
    late final phoneEditor = TextEditingController(
      text: widget.user?.phone ?? "",
    );
    late final roleEditor = TextEditingController(
      text: widget.user?.role ?? "",
    );

    void saveData() {
      final newUser = DataModel(
        name: nameEditor.text.trim(),
        mail: mailEditor.text.trim(),
        phone: phoneEditor.text.trim(),
        role: roleEditor.text.trim(),
      );

      Navigator.pop(context, newUser);
    }

    void phoneNumberChecker() {
      if (phoneEditor.text.length != 10) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Enter valid Phone numer')));
        return;
      }
      saveData();
    }

    void mailChecker() {
      if (!mailEditor.text.contains('@') || !mailEditor.text.contains('.')) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Enter a Valid Email')));
        return;
      }
      phoneNumberChecker();
    }

    void checkEmpty() {
      if (nameEditor.text.isEmpty ||
          mailEditor.text.isEmpty ||
          phoneEditor.text.isEmpty ||
          roleEditor.text.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Fields should not be empty")));
        return;
      }
      mailChecker();
    }

    void discardAlert() {
      if (dataModels.isNotEmpty) {
        if (nameEditor.text.trim() != dataModels[0].name ||
            mailEditor.text.trim() != dataModels[0].mail ||
            phoneEditor.text.trim() != dataModels[0].phone ||
            roleEditor.text.trim() != dataModels[0].role) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Details are not Saved'),
              content: Text('Do You Want to Save changes'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Discard'),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    checkEmpty();
                  },
                  child: Text('save'),
                ),
              ],
            ),
          );
          return;
        }
      }else null;
    }

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
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              'Enter Your Details',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            TextField(
              controller: nameEditor,
              decoration: InputDecoration(
                label: Text('Name'),

                border: OutlineInputBorder(),
                hint: Text('Enter Name'),
              ),
            ),

            SizedBox(height: 16),
            TextField(
              controller: mailEditor,
              decoration: InputDecoration(
                label: Text('Email'),

                border: OutlineInputBorder(),
                hint: Text('Enter Email'),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: phoneEditor,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                label: Text('Phone'),

                border: OutlineInputBorder(),
                hint: Text('Enter phone'),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: roleEditor,
              decoration: InputDecoration(
                label: Text('Role'),
                border: OutlineInputBorder(),
                hint: Text('Enter Role'),
              ),
            ),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    discardAlert();
                    Navigator.pop(context);
                  },
                  child: Text('Discard'),
                ),

                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    checkEmpty();
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
