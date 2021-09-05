import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_road_cast/models/moor_databse.dart';
import 'package:http/http.dart' as http;
import 'models/UserData.dart';




Future<List<UserData>> fetchAlbum() async{
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');


  final response = await http.get(url);

  print(response.body);
  print("hello dinesh");
  if(response.statusCode == 200){
   List jsonResponse = json.decode(response.body);

   return jsonResponse.map((data) => new UserData.fromJson(data)).toList();

  }
  else{
    throw Exception('Failed to load Data');
  }
}




String selectResult;
 List<String> listExample = [];

List<String> recentList = ["Dinesh", "Kumar","Rahul"];


AppDatabase database;

void main() {
  database = AppDatabase();
  runApp(new MaterialApp(
      home: new HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}


class Search extends SearchDelegate{





  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions

    return  [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: (){
          query = "";
        },
      )
    ];

  }

  @override
  Widget buildLeading(BuildContext context) {
   return IconButton(
       onPressed: (){
         Navigator.pop(context);
       },
       icon: Icon(Icons.arrow_back),
   );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectResult),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
    ? suggestionList = recentList
    : suggestionList.addAll(listExample.where(
            (element) => element.toLowerCase().contains(query.toLowerCase()),));
    return ListView.builder(
      itemCount: suggestionList.length,
        itemBuilder: (context, index){
        return Card(
          child:  ListTile(
            title: Text(suggestionList[index],),
            onTap: (){
              selectResult = suggestionList[index];
              showResults(context);
            },
          ),
        );
        });
  }

}


class HomePageState extends State<HomePage> {





  List dataa;









  Future<String> getData() async {
    var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/users"),

    );

    this.setState(() {
      dataa = json.decode(response.body);




      for(var i = 0; i < dataa.length; i++){

          database.insertNewOrder(Order(
              name: dataa[i]["name"],
              username: dataa[i]["username"]));


      }
    });



    return "Success!";
  }

  @override
  void initState(){

    this.getData();
  }



  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(
       actions: [IconButton(
           onPressed: (){
             showSearch(
                 context: context,
                 delegate: Search());
           },
           icon: Icon(Icons.search))],
       centerTitle: true,
       title: Text("RoadCast"),
     ),
     body: Container(
           height: MediaQuery.of(context).size.height,
           width: double.infinity,
           child: StreamBuilder(
             stream: database.watchAllOrder(),
             builder: (context,  AsyncSnapshot<List<Order>> snapshot){

               if(snapshot.hasData){
                 for(int i = 0; i < snapshot.data.length; i++){
                   listExample.add(snapshot.data[i].name);
                 }
                 return ListView.builder(
                   itemBuilder: (_, index){
                     return Card(

                       child: ListTile(

                         title: Text(snapshot.data[index].name),
                         subtitle: Text(" ${snapshot.data[index].username}"),

                       ),

                     );
                   },
                   itemCount: snapshot.data.length,);
               }
               else if (snapshot.hasError){
                 return Text('${snapshot.error}');
               }
               return  CircularProgressIndicator();
             },
           ),
         ),





   );
  }



}
