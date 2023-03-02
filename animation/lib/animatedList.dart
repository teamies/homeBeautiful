import 'package:flutter/material.dart';

class animatedList extends StatefulWidget {
  const animatedList({super.key});

  @override
  State<animatedList> createState() => _animatedListState();
}

class _animatedListState extends State<animatedList> {
  final _item = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void additem() {
    _item.insert(0, "Item ${_item.length + 1}");
    _key.currentState!.insertItem(0, duration: Duration(seconds: 1));
  }

  void removeitem(int index) {
    _key.currentState!.removeItem(
      index,
      (context, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: Card(
            margin: EdgeInsets.all(10),
            color: Colors.red,
            child: ListTile(
              title: Text(
                'Delete',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        );
      },
      duration: Duration(seconds: 1),
    );
    _item.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        IconButton(
            onPressed: () {
              additem();
            },
            icon: Icon(Icons.add)),
        Expanded(
            child: AnimatedList(
                key: _key,
                initialItemCount: 0,
                padding: EdgeInsets.all(10),
                itemBuilder: ((context, index, animation) {
                  return SizeTransition(
                    key: UniqueKey(),
                    sizeFactor: animation,
                    child: Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.amber,
                      child: ListTile(
                        title: Text(
                          _item[index],
                          style: TextStyle(fontSize: 24),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: (() {
                            removeitem(index);
                          }),
                        ),
                      ),
                    ),
                  );
                })))
      ],
    );
  }
}
