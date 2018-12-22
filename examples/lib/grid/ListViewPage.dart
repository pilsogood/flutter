import "package:flutter/material.dart";

class Lists {
  final String title;
  final String description;

  Lists(this.title, this.description);
}

// void main() {
//   runApp(MaterialApp(
//     title: 'Passing Data',
//     home: ListViewPage(
//       todos: List.generate(
//         20,
//         (i) => Todo(
//               'Todo $i',
//               'A description of what needs to be done for Todo $i',
//             ),
//       ),
//     ),
//   ));
// }

class ListViewPage extends StatelessWidget {
  final List<Lists> lists = new List.generate(
        20, (i) => Lists(
              'List $i',
              'This is List $i',
            ),
      );

  // ListViewPage({Key key, this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("ListView Example"),
      ),
      body: ListView.builder(
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: new Text(lists[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(list: lists[index]),
                )
               );
             },
           );
         }
       )
     );
   }
 }
                  
class DetailScreen extends StatelessWidget{
  final Lists list;
  DetailScreen({Key key, @required this.list}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${list.title}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Text('${list.description}')
      ),
    );
  }


}