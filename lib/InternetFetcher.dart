import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';

class Fetcher {
  static Future fetchTasks() async {
    http.Response response = await http.get(Uri.parse(
        'https://todoapp-api.apps.k8s.gu.se/todos?key=2ff216a5-d5d1-411b-b758-1f2d18ad5645'));

    if (response.statusCode == 200) {
      var _jsonData = response.body;
      final List parsedList = json.decode(_jsonData);
      List<Task> list = parsedList.map((val) => Task.fromJson(val)).toList();
      return list;
    } else {
      print("API request failed.");
      final List<Task> emptyResp = [];
      return emptyResp;
    }
  }

  static Future addTask(String title, bool done) async {
    http.Response response = await http.post(
      Uri.parse(
          'https://todoapp-api.apps.k8s.gu.se/todos?key=2ff216a5-d5d1-411b-b758-1f2d18ad5645'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'title': title,
        'done': done,
      }),
    );
    var statusCode = response.statusCode;
    return statusCode;
  }

  static Future updateTask(String id, String title, bool done) async {
    http.Response response = await http.put(
      Uri.parse(
          'https://todoapp-api.apps.k8s.gu.se/todos/$id?key=2ff216a5-d5d1-411b-b758-1f2d18ad5645'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'title': title,
        'done': done,
      }),
    );
    var statusCode = response.statusCode;
    return statusCode;
  }

  static Future deleteTask(String id) async {
    http.Response response = await http.delete(Uri.parse(
        'https://todoapp-api.apps.k8s.gu.se/todos/$id?key=2ff216a5-d5d1-411b-b758-1f2d18ad5645'));
    var statusCode = response.statusCode;
    return statusCode;
  }
}
