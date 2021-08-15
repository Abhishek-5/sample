
import 'package:flutter/material.dart';
import 'calDataRepo.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List array = [
    {"id":"0","author":"Alejandro Escamilla","width":5616,"height":3744,"url":"https://images.unsplash.com/flagged/1/apple-gear-looking-pretty.jpg?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80","download_url":"https://picsum.photos/id/0/5616/3744"},
    {"id":"1","author":"Alejandro Escamilla","width":5616,"height":3744,"url":"https://images.unsplash.com/1/type-away-numero-dos.jpg?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80","download_url":"https://picsum.photos/id/1/5616/3744"},
    {"id":"10","author":"Paul Jarvis","width":2500,"height":1667,"url":"https://images.unsplash.com/2/02.jpg?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80","download_url":"https://picsum.photos/id/10/2500/1667"},
    {"id":"100","author":"Tina Rataj","width":2500,"height":1656,"url":"https://images.unsplash.com/11/santa-monica-beach.jpg?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80","download_url":"https://picsum.photos/id/100/2500/1656"},
    {"id":"1001","author":"Danielle MacInnes","width":5616,"height":3744,"url":"https://images.unsplash.com/photo-1449177009399-be6867ef0505?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80","download_url":"https://picsum.photos/id/1001/5616/3744"},
    {"id":"1002","author":"NASA","width":4312,"height":2868,"url":"https://images.unsplash.com/photo-1451186859696-371d9477be93?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80","download_url":"https://picsum.photos/id/1002/4312/2868"},
    {"id":"1003","author":"E+N Photographies","width":1181,"height":1772,"url":"https://images.unsplash.com/photo-1451303688941-9e06d4b1277a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80","download_url":"https://picsum.photos/id/1003/1181/1772"},
    {"id":"1004","author":"Greg Rakozy","width":5616,"height":3744,"url":"https://images.unsplash.com/photo-1451444635319-e5e247fbb88d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80","download_url":"https://picsum.photos/id/1004/5616/3744"},
    {"id":"1005","author":"Matthew Wiebe","width":5760,"height":3840,"url":"https://images.unsplash.com/photo-1422568374078-27d3842ba676?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80","download_url":"https://picsum.photos/id/1005/5760/3840"},
    {"id":"1006","author":"Vladimir Kudinov","width":3000,"height":2000,"url":"https://images.unsplash.com/photo-1427435150519-42d9bcd0aa81?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80","download_url":"https://picsum.photos/id/1006/3000/2000"},
    {"id":"1008","author":"Benjamin Combs","width":5616,"height":3744,"url":"https://images.unsplash.com/photo-1438979315413-de5df30042a1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80","download_url":"https://picsum.photos/id/1008/5616/3744"},
    {"id":"1009","author":"Christopher Campbell","width":5000,"height":7502,"url":"https://images.unsplash.com/photo-1439777723962-200c3f5b294e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80","download_url":"https://picsum.photos/id/1009/5000/7502"},
    {"id":"101","author":"Christian Bardenhorst","width":2621,"height":1747,"url":"https://images.unsplash.com/11/hochbunker.jpg?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=751&q=80","download_url":"https://picsum.photos/id/101/2621/1747"},
    {"id":"1010","author":"Samantha Sophia","width":5184,"height":3456,"url":"https://images.unsplash.com/photo-1442115597578-2d0fb2413734?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80","download_url":"https://picsum.photos/id/1010/5184/3456"},
    {"id":"1011","author":"Roberto Nickson","width":5472,"height":3648,"url":"https://images.unsplash.com/photo-1448518184296-a22facb4446f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80","download_url":"https://picsum.photos/id/1011/5472/3648"},
    {"id":"1012","author":"Scott Webb","width":3973,"height":2639,"url":"https://images.unsplash.com/photo-1452475168325-672188dc4dc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=753&q=80","download_url":"https://picsum.photos/id/1012/3973/2639"},
    {"id":"1013","author":"Cayton Heath","width":4256,"height":2832,"url":"https://images.unsplash.com/photo-1453857122308-5e78881d7acc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80","download_url":"https://picsum.photos/id/1013/4256/2832"},
    {"id":"1014","author":"Oscar Keys","width":6016,"height":4000,"url":"https://images.unsplash.com/photo-1453974336165-b5c58464f1ed?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80","download_url":"https://picsum.photos/id/1014/6016/4000"},
    {"id":"1015","author":"Alexey Topolyanskiy","width":6000,"height":4000,"url":"https://images.unsplash.com/photo-1443890484047-5eaa67d1d630?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80","download_url":"https://picsum.photos/id/1015/6000/4000"},
    ];
  // CallDataRepo _callDataRepo = CallDataRepo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("SecondScreen",)),),
        body: GridView.builder(
              padding: EdgeInsets.all(5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2),
                itemCount: array.length,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      Image.network('${array[index]['url']}', height: MediaQuery.of(context).size.width*.4,
                      width: MediaQuery.of(context).size.width*.4, fit: BoxFit.cover,),
                      Container(padding: EdgeInsets.symmetric(vertical: 5), alignment: Alignment.center, child: Text("${array[index]['author']}"),)
                    ],
                  );
                })
        );
  }
}
