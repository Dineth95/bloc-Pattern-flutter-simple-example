import 'package:flutter/material.dart';
import 'counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      home: MyHomePage(title: 'Simple bloc Pattern example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc _counterBloc=new CounterBloc(initialCount: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: _counterBloc.counterObservable,
              builder: (context,AsyncSnapshot<int> snapshot){
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.display1 ,
                );
              },
            ),
          ],
        ),
      ),
        floatingActionButton: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(bottom: 10), child:
                new FloatingActionButton(
                  onPressed: _counterBloc.increment,
                  tooltip: 'Increment',
                  child: new Icon(Icons.add),
                )
              ),
              new FloatingActionButton(
                  onPressed: _counterBloc.decrement,
                  tooltip: 'Decrement',
                  child: new Icon(Icons.remove),
          ),
        ]),
    );

  }

  @override
  void dispose(){
    _counterBloc.dispose();
    super.dispose();
  }
}
