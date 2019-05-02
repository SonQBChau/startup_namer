import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Startup Namer')),
        body: Container(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = [];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  Widget _buildSuggestions(){
    return ListView.builder(
        itemBuilder: (context, i){
          if (i.isOdd){
            return Divider();
          }
         final index = i ~/2;
         if (index >= _suggestions.length){
           _suggestions.addAll(generateWordPairs().take(10));
         }

         return _buildRow(_suggestions[index]);
        },
    );
  }

  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }
}
