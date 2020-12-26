import 'dart:io';

class Enviroments {

  static String apiUrl = Platform.isAndroid ? 'http://192.168.1.71:3000/api' : 'http://localhost:3000/api';
  
  static String socketURL = Platform.isAndroid ? 'http://192.168.1.71:3000' : 'http://localhost:3000';

  
}