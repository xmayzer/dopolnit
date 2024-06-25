import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class httpscreen extends StatefulWidget {
  @override
  _httpscreen createState() => _httpscreen();
}

class _httpscreen extends State<httpscreen> {
  String _data = 'Нажмите кнопку, чтобы загрузить данные';

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> data = jsonDecode(response.body);
        _data = 'Полученные данные: ${data['title']}';
      });
    } else {
      throw Exception('Ошибка загрузки');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Сетевой запрос данных'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: fetchData,
                child: Text('Загрузить данные'),
              ),
              SizedBox(height: 20),
              Text(_data),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('На главную',style:TextStyle( color: Colors.blue[900]),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}