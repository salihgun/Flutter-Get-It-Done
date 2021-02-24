import 'package:flutter/material.dart';
import 'package:fluttergetitdone/models/items_data.dart';
import 'package:provider/provider.dart';

class ItemAdder extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              maxLines: 3,
              minLines: 1,
              controller: textController,
              onChanged: (value) {},
              style: TextStyle(color: Colors.black, fontSize: 20),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Add Item",
                  hintText: "..."),
              autofocus: true,
            ),
            FlatButton(
              onPressed: () {
                Provider.of<ItemData>(context, listen: false)
                    .addItem(textController.text);
                Navigator.pop(context);
              },
              color: Theme.of(context).primaryColor,
              child: Text("ADD"),
            )
          ],
        ),
      ),
    );
  }
}
