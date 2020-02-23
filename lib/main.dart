// de facut 2 coloane cu 8 fraze / de folosit gridview
// posibil 'outline button'
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  final assetsAudioPlayer = AssetsAudioPlayer();
  final List<String> list = <String>[
    'Vorbesti engleza?',
    'Imi este foame',
    'Buna Seara',
    'Numele meu este',
    'Te rog',
    'Unde este barul?',
    'Bine venit',
    'Cum esti?',
  ];

  final List<String> audio = <String>[
    'res/doyouspeaken.mp3',
    'res/ehesvagyok.mp3',
    'res/goodevening.mp3',
    'res/meinnameist.mp3',
    'res/please.mp3',
    'res/undeestebarul_japoneza.mp3',
    'res/welcome.mp3',
    'res/wiegehtesdir.mp3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic phrases'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 1.4,
        padding: EdgeInsets.all(12.0),
        children: <Widget>[
          for (int i = 0; i < list.length; i++)
            Container(
              child: FlatButton(
                color: Colors.blueGrey,
                textColor: Colors.black87,
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  assetsAudioPlayer.open(
                    audio[i],
                  );
                  assetsAudioPlayer.play();
                },
                child: Text(
                  list[i],
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
