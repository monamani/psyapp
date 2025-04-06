import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mypsy_app/helpers/user_secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

//Save the user credentials
Future<dynamic> loginUser(String? usernameEncoded, String? pwdEncoded) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await UserSecureStorage.setUsername(usernameEncoded);
  await UserSecureStorage.setPwd(pwdEncoded);
  prefs.setBool('isLoggedIn', true);
  prefs.setBool('appOnPause', true);
}

//Check connection of device
Future<bool> checkAppConnection() async {
  ConnectivityResult connectivityResult =
      (await (Connectivity().checkConnectivity())) as ConnectivityResult;
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

String getUsername(String firstName, String lastName) {
  String userName = '';
  if (firstName.length > 1) {
    userName = firstName.substring(0, 1);
  }
  if (lastName.length > 1) {
    userName = '$userName.${lastName.substring(0, 1)}';
  }
  return userName;
}

String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input;
  }
  return input[0].toUpperCase() +
      (input.length > 1 ? input.substring(1).toLowerCase() : '');
}

int? getUserId(SharedPreferences prefs) {
  if (!prefs.containsKey('userId')) return 0;
  return prefs.getInt('userId');
}

Map<String, String> formatDateTimeSeparately(String input) {
  DateTime parsedUtcTime = DateTime.parse(input);

// Extract the date and hour
  String date =
      "${parsedUtcTime.year}-${parsedUtcTime.month.toString().padLeft(2, '0')}-${parsedUtcTime.day.toString().padLeft(2, '0')}";
  String hour =
      "${parsedUtcTime.hour.toString().padLeft(2, '0')}:${parsedUtcTime.minute.toString().padLeft(2, '0')}";
  String formattedDate =
      DateFormat('d MMMM yyyy', 'fr_FR').format(DateTime.parse(date));

  return {
    'date': formattedDate,
    'time': hour,
  };
}

Future<void> launchLink(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

String getFrenchFormat(String expirationDate) =>
    DateFormat('dd/MM/yyyy', 'fr_FR').format(DateTime.parse(expirationDate));

void printConsole(String msg) {
  if (kDebugMode) {
    print(msg);
  }
}
