
import 'package:flutter/material.dart';

void main() => runApp(EcoYolApp());

class EcoYolApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoYol',
      theme: ThemeData(primarySwatch: Colors.green),
      home: AnaPanel(),
    );
  }
}

class AnaPanel extends StatefulWidget {
  @override
  _AnaPanelState createState() => _AnaPanelState();
}

class _AnaPanelState extends State<AnaPanel> {
  int puan = 450;
  bool isTr = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EcoYol"),
        backgroundColor: Colors.green[700],
        actions: [
          TextButton(
            onPressed: () => setState(() => isTr = !isTr),
            child: Text(isTr ? "EN" : "TR", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Column(
        children: [
          // 💰 REKLAM BANNERI (Gelir Kapısı)
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.black12,
            child: Center(child: Text(isTr ? "REKLAM ALANI" : "AD AREA", style: TextStyle(fontSize: 10))),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text("🌿🛣️", style: TextStyle(fontSize: 80)),
                  Text(isTr ? "Hoş Geldin Ahmet!" : "Welcome Ahmet!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  
                  // PUAN KARTI
                  Card(
                    margin: EdgeInsets.all(20),
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(children: [Text(isTr ? "Puanın" : "Points"), Text("$puan", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green))]),
                          Icon(Icons.emoji_events, size: 40, color: Colors.orange),
                        ],
                      ),
                    ),
                  ),

                  // ROTA LİSTESİ
                  ListTile(
                    leading: Icon(Icons.directions_walk, color: Colors.green),
                    title: Text(isTr ? "Yürüyüş Rotası" : "Walking Route"),
                    subtitle: Text("15 dk - 0 Karbon"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15),
                    onTap: () => setState(() => puan += 10),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.directions_bike, color: Colors.green),
                    title: Text(isTr ? "Bisiklet Rotası" : "Cycling Route"),
                    subtitle: Text("5 dk - 0 Karbon"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15),
                    onTap: () => setState(() => puan += 5),
                  ),
                ],
              ),
            ),
          ),
          
          // ALT BUTON
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50), backgroundColor: Colors.green),
              onPressed: () {},
              child: Text(isTr ? "YOLCULUĞA BAŞLA" : "START JOURNEY", style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
