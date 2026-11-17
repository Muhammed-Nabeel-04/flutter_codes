import 'package:flutter/material.dart';
import 'package:profile_app/models_data.dart';

class SettingsScreen extends StatefulWidget {
  final VoidCallback toggle;
  const new({super.key, required this.toggle});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}
// SettingDetailsModel settings = SettingDetailsModel();

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
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 13 * textSize,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),

              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SwitchListTile(
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
                    widget.toggle();
                  });
                },
              ),
            ),

            SizedBox(height: 30),

            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
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
            ),

            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: RadioGroup(
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
            ),

            SizedBox(height: 30),

            Container(
              padding: EdgeInsets.all(8),

              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SwitchListTile(
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
            ),

            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                setState(() {
                  settings.isDark = false;
                  settings.lang = 1;
                  settings.notifications = true;
                  settings.textSize = 2;
                  widget.toggle();
                });
              },
              child: Text('Reset Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
