import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';
import 'package:cached_network_image/cached_network_image.dart';
class CommentScreen extends ConsumerWidget {
  @override
  final TextEditingController _textEditingController = TextEditingController();

  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.orange[200],
        appBar: AppBar(title: Text('Добавить отзыв галерее', style: TextStyle( color: Colors.blue[900])),
          backgroundColor: Colors.pink[200],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer(builder: (context, watch, _) {
                final comments = ref.watch(commentsProvider);
                return Expanded(
                  child: ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(comments[index]),
                      );
                    },
                  ),
                );
              }),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.pink[100],
                        title: Text('Добавить отзыв'),
                        actions:[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                hintText: 'Введите отзыв',
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              final newComment = _textEditingController.text;
                              if (newComment.isNotEmpty) {
                                ref.read(commentsProvider.notifier).state = [
                                  ...ref.read(commentsProvider.notifier).state,
                                  newComment
                                ];
                                _textEditingController.clear();
                                Navigator.pop(context);
                              }
                            },
                            child: Text('Сохранить'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Оставить отзыв галерее',style:TextStyle( color: Colors.blue[900]),),
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('На главную',style:TextStyle( color: Colors.blue[900]),),
              ),
            ],
          ),
        )
    );
  }
}