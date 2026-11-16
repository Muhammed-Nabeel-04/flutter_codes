import 'package:flutter/material.dart';
import 'package:profile_app/models.dart';

class SettingsScreen extends StatefulWidget {
//  final VoidCallback reload;
  const new({super.key,
  // required this.reload
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}
  SettingDetailsModel settings = SettingDetailsModel();


class _SettingsScreenState extends State<SettingsScreen> {
  

  @override
  Widget build(BuildContext context) {
    bool isDark = settings.isDark;
  double textSize = settings.textSize;
  int selectedLang = settings.lang;
  bool isNotifications = settings.notifications;

    void notificationSnackbar() {
      !isNotifications
          ? ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Notification Enabled")))
          : ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Notification Disabled")));
    }

    

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings Screen",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            SwitchListTile(
              title: Text(
                'Dark Mode',
                style: TextStyle(fontSize: 10 * textSize),
              ),
              subtitle: Text('Enable Darkmode'),
              value: isDark,
              onChanged: (value) {
                setState(() {
                  isDark = value;
                  settings.isDark = isDark;
                });
              },
            ),
      
            SizedBox(height: 30),
      
            Column(
              children: [
                Text('Text Size', style: TextStyle(fontSize: 10 * textSize)),
                Slider(
                  value: textSize,
                  min: 1,
                  max: 4,
                  divisions: 3,
                  label: textSize.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      textSize = value;
                      settings.textSize = textSize;
                    });
                  },
                ),
              ],
            ),
            RadioGroup(
              groupValue: selectedLang,
      
              onChanged: (value) {
                setState(() {
                  selectedLang = value!;
                  settings.lang = selectedLang;
                });
              },
              child: Column(
                children: [
                  RadioListTile(
                    value: 1,
                    title: Text(
                      'English',
                      style: TextStyle(fontSize: 10 * textSize),
                    ),
                  ),
                  RadioListTile(
                    value: 2,
                    title: Text(
                      'Hindi',
                      style: TextStyle(fontSize: 10 * textSize),
                    ),
                  ),
                  RadioListTile(
                    value: 3,
                    title: Text(
                      'Malayalam',
                      style: TextStyle(fontSize: 10 * textSize),
                    ),
                  ),
                ],
              ),
            ),
      
            SizedBox(height: 30),
      
            SwitchListTile(
              value: isNotifications,
              onChanged: (value) {
                setState(() {
                  notificationSnackbar();
                  isNotifications = value;
                  settings.notifications = isNotifications;
                });
              },
              title: Text(
                'Notification',
                style: TextStyle(fontSize: 10 * textSize),
              ),
            ),
      
            
          ],
        ),
      ),
    );
  }
}
