import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'HScreen1.dart';
import 'HScreen3.dart';
class HScreen2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(hcountProvider2);
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(title: Text('Собачки',style:TextStyle( color: Colors.blue[900])),
        backgroundColor: Colors.pink[200],
      ),
      body: Center(
        child: Column(
            children: <Widget>[
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/hscreen3');
                },
                child: Text('Дальше',style:TextStyle( color: Colors.blue[900]),),
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Назад',style:TextStyle( color: Colors.blue[900]),),
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('На главную',style:TextStyle( color: Colors.blue[900]),),
              ),
              Container(
                height: 400,
                width: 300,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CachedNetworkImage(
                    imageUrl: "https://wp-s.ru/wallpapers/6/6/520500764779333/6-sobak-raznyx-porod.jpg",
                    progressIndicatorBuilder: (context, url, progress) =>
                    const CircularProgressIndicator(),
                    errorWidget:(context, url, progress) => const Center(
                      child: Icon(Icons.error, color: Colors.red,),
                    ),
                  ),
                ),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  ref.read(hcountProvider2.notifier).state++;
                },
                backgroundColor: Colors.pink[100],
                splashColor: Colors.pink,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(),
                label: Row(
                  children: [Icon(Icons.favorite), Text('Нравится: $count')],
                ),
              ),
            ]
        ),
      ),
    );
  }
}