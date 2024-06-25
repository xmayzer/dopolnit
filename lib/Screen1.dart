import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';
import 'package:cached_network_image/cached_network_image.dart';


class Screen1 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider1);
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text('Кошечки',style:TextStyle( color: Colors.blue[900]),),
        backgroundColor: Colors.pink[200],
      ),
      body: Center(
        child: Column(
            children:<Widget> [
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/screen2');
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
                    imageUrl: "https://img.goodfon.ru/original/2560x1440/6/df/koshka-kot-doska-brevno.jpg",
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
                  ref.read(countProvider1.notifier).state++;
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
