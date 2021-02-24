import 'package:flutter/material.dart';
import 'package:fluttergetitdone/models/theme_color_data.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function toggleStatus;
  final Function deleteItem;
  ItemCard({this.isDone, this.title, this.toggleStatus, this.deleteItem});
  @override
  Widget build(BuildContext context) {
    Color lightIndigo = Colors.indigo.shade50;
    Color lightAmber = Colors.amber.shade50;
    return Dismissible(
      onDismissed: deleteItem,
      key: UniqueKey(),
      child: Card(
        elevation: isDone ? 1 : 5,
        color: isDone
            ? Provider.of<ThemeColorData>(context).isIndigo
                ? lightIndigo
                : lightAmber
            : Colors.white,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                decoration: isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            activeColor: Theme.of(context).primaryColor,
            onChanged: toggleStatus,
            value: isDone,
          ),
        ),
      ),
    );
  }
}
