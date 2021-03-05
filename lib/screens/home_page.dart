import 'package:flutter/material.dart';
import 'package:fluttergetitdone/models/items_data.dart';
import 'package:fluttergetitdone/screens/setting_page.dart';
import 'package:fluttergetitdone/widgets/item_adder.dart';
import 'package:fluttergetitdone/widgets/item_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ));
              },
              icon: Icon(Icons.settings))
        ],
        title: Text("Get it Done"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "${Provider.of<ItemData>(context).items.length} Items",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Consumer<ItemData>(
                    builder: (context, itemData, _) => Align(
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        itemCount: itemData.items.length,
                        itemBuilder: (context, index) {
                          return ItemCard(
                            title: itemData.items[index].title,
                            isDone: itemData.items[index].isDone,
                            toggleStatus: (_) {
                              itemData.toggleStatus(index);
                            },
                            deleteItem: (_) {
                              itemData.deleteItem(index);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            context: context,
            builder: (context) => ItemAdder(),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
