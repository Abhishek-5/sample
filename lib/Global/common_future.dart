import 'package:flutter/material.dart';

class CommonFuture<T> extends StatelessWidget {
  final Widget Function(T data)? data;
  final Future<T>? future;
  final T? initialData;
  const CommonFuture(
      {@required this.future, this.initialData, @required this.data});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      initialData: initialData,
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          if (snapshot.data == null) {
            return Text('No data');
          }

          return data!(snapshot.data!);
        } else {
          return Center(
              child: Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: CircularProgressIndicator()));
        }
      },
    );
  }
}