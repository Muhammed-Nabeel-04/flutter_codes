
class DataModel{
  final String name;
  final String mail;
  final String phone;
  final String role;

  DataModel({
    required this.name,
    required this.mail,
    required this.phone,
    required this.role
  });
}



// enum ScreenDetails {
//   lang,
//   darkOrLight,
//   textSize
  
// }


class SettingDetailsModel{
   int lang;
   bool isDark;
   double textSize;
   bool notifications;

  SettingDetailsModel({
     this.lang = 1,
     this.isDark = false,
     this.textSize = 2,
     this.notifications = true
  });
}



