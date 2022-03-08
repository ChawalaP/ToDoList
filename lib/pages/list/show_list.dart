import 'package:flutter/material.dart';

class Show_List extends StatefulWidget {
  const Show_List({Key? key}) : super(key: key);

  @override
  State<Show_List> createState() => _Show_ListState();
}

class _Show_ListState extends State<Show_List> {
  List<String> doList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TO DO LIST'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: doList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(186, 230, 170, 1.0),
                      borderRadius: BorderRadius.circular(12.0)
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(doList[index]),
                      ),
                      const Spacer(),
                      IconButton(
                        tooltip: 'แก้ไข',
                        onPressed: () {
                          newEditTodoScreen(index);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        tooltip: 'ลบ',
                        onPressed: () {
                          setState(() {
                            doList.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.clear),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    doList.clear();
                  });
                },
                tooltip: 'ลบทั้งหมด',
                child: const Icon(Icons.delete_forever),
              ),
              FloatingActionButton(
                onPressed: newAddTodoScreen,
                tooltip: 'เพิ่มรายการ',
                child: const Icon(Icons.add),
              ),
            ],
          )
        ]);
  }

  void newAddTodoScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('เพิ่มรายการใหม่')),
            body: TextField(
              autofocus: true,
              onSubmitted: (values) {
                setState(() {
                  doList.add(values);
                });
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
          );
        },
      ),
    );
  }

  void newEditTodoScreen(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text('แก้ไขรายการ ' '${doList[index]}')),
            body: TextField(
              autofocus: true,
              onSubmitted: (values) {
                setState(() {
                  doList[index] = values;
                });
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
