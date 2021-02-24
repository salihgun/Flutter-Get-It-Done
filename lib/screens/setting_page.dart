import 'package:flutter/material.dart';
import 'package:fluttergetitdone/models/theme_color_data.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tema Seçimi Yapınız"),
      ),
      body: SwitchCard(),
    );
  }
}

class SwitchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _value = Provider.of<ThemeColorData>(context).isIndigo;

    Text indigoText = Text(
      "Indigo",
      style: TextStyle(color: Colors.indigo[400]),
    );
    Text amberText = Text(
      "Amber",
      style: TextStyle(color: Colors.amber[300]),
    );
    return Card(
      child: SwitchListTile(
        title: Text(
          "Change Theme Color",
          style: TextStyle(color: Colors.black),
        ),
        subtitle: _value ? indigoText : amberText,
        onChanged: (value) {
          Provider.of<ThemeColorData>(context, listen: false)
              .switchTheme(value);
        },
        value: _value,
      ),
    );
  }
}
