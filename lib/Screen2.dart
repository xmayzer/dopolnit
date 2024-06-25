import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Screen2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider2);
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text('Кошечки',style:TextStyle( color: Colors.blue[900]),),
        backgroundColor: Colors.pink[200],
      ),
      body: Center(
        child: Column(
            children: [
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/screen3');
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
                  Navigator.pushNamed(context, '/');
                },
                child: Text('На главную',style:TextStyle( color: Colors.blue[900]),),
              ),
              Container(
                height: 400,
                width: 300,
                child:FittedBox(
                  fit: BoxFit.cover,
                  child: CachedNetworkImage(
                    imageUrl: "https://wp-s.ru/wallpapers/5/16/439736955693214/kot-na-vetke-dereva.jpg",
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
                  ref.read(countProvider2.notifier).state++;
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