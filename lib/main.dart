import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_it/get_it.dart';
import 'Screen1.dart';
import 'Screen2.dart';
import 'Screen3.dart';
import 'HScreen1.dart';
import 'HScreen2.dart';
import 'HScreen3.dart';
import 'commentScreen.dart';
import 'httpScreen.dart';

final countProvider1 = StateProvider((ref) => 0);
final countProvider2 = StateProvider((ref) => 0);
final countProvider3 = StateProvider((ref) => 0);
final hcountProvider1 = StateProvider((ref) => 0);
final hcountProvider2 = StateProvider((ref) => 0);
final hcountProvider3 = StateProvider((ref) => 0);
//счетчики лайков к фотографии
final commentsProvider = StateProvider<List<String>>((ref) => []);

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<Params>(Params(param1: "H", param2: "N"));
}

void main() async{
  setupGetIt();
  runApp(ProviderScope(child: MyApp()));
}

class Params {
  final String param1;
  final String param2;

  Params({required this.param1, required this.param2});
}
class ParamsProvider extends InheritedWidget {
  final Params params;

  ParamsProvider({ required this.params, required Widget child}) : super(child: child);

  static ParamsProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ParamsProvider>();
  }

  @override
  bool updateShouldNotify(ParamsProvider oldWidget) {
    return params != oldWidget.params;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetIt getIt = GetIt.instance;
    Params params = Params(param1: 'H', param2: "N");
    return ParamsProvider(
      params: params,
      child: MaterialApp(
        title: 'Приложение',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/screen1': (context) => Screen1(),
          '/screen2': (context) => Screen2(),
          '/screen3': (context) => Screen3(),
          '/hscreen1': (context) => HScreen1(),
          '/hscreen2': (context) => HScreen2(),
          '/hscreen3': (context) => HScreen3(),
          '/commentscreen': (context) => CommentScreen(),
          '/httpscreen': (context) => httpscreen(),
        },
      ),
    );
  }
}


final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.pink[100],
  foregroundColor: Colors.black,
  minimumSize: Size(400, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(title: Text('Галерея кошечек и собачек', style: TextStyle( color: Colors.blue[900])),
        backgroundColor: Colors.pink[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            ElevatedButton(
              style: raisedButtonStyle,
              child: Text('Посмотреть на кошечек',style:TextStyle( color: Colors.blue[900]),),
              onPressed: () {
                Navigator.pushNamed(context, '/screen1');
              },
            ),
            ElevatedButton(
              style: raisedButtonStyle,
              child: Text('Посмотреть на собачек',style:TextStyle( color: Colors.blue[900]),),
              onPressed: () {
                Navigator.pushNamed(context, '/hscreen1');
              },
            ),
            Container(
              height: 400,
              width: 300,
              child: FittedBox(
                fit: BoxFit.cover,
                child: CachedNetworkImage(
                  imageUrl: "https://spayneuternm.org/wp-content/uploads/2015/09/Fotolia_58158394_Subscription_Monthly_M.jpg",
                  progressIndicatorBuilder: (context, url, progress) =>
                  const CircularProgressIndicator(),
                  errorWidget:(context, url, progress) => const Center(
                    child: Icon(Icons.error, color: Colors.red,),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                Navigator.pushNamed(context, '/commentscreen');
              },
              child: Text('Оставить отзыв',style:TextStyle( color: Colors.blue[900]),),
            ),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                Navigator.pushNamed(context, '/httpscreen');
              },
              child: Text('Посмотреть на сгруженные данные',style:TextStyle( color: Colors.blue[900]),),
            ),
          ],
        ),
      ),
    );
  }
}







