
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expressions/expressions.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator'),
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
  final List<String> text=[''];
  final evaluator = const ExpressionEvaluator();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
    if (orientation == Orientation.portrait)
    return _buildPortraitLayout(); // if orientation is portrait, show your portrait layout
    else
    return _buildLandscapeLayout(); // else show the landscape one
    }),);

  }
   Widget _buildPortraitLayout(){
     return Column(children:[
       Expanded(child:
       Row(mainAxisAlignment: MainAxisAlignment.end,
         children:[
           Flexible(
           child: Text(checkIfEmpty(text)??"0",style: GoogleFonts.nunito(fontSize: 40),
           ),)
         ],
       ),),
       Row(mainAxisAlignment: MainAxisAlignment.end,children: [
         TextButton(onPressed: ()=>{setState((){
           try{
           if(text.isNotEmpty)
             text.last=text.last.substring(0,text.last.length-1);}
             catch(e){text.removeLast();}
         })},
             child: Icon(CupertinoIcons.delete_left,))
       ],),
       Row(
         children:[
           Expanded(
             child:Column(
               mainAxisSize:MainAxisSize.max,
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: <Widget>[
                 FlatButton(
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     clearField();
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("С",
                       style:  GoogleFonts.nunitoSans(fontSize: 30)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addNum(text, "7");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("7",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addNum(text, "4");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("4",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addNum(text, "1");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("1",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     changeMark(text);
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("+/-",
                       style:  GoogleFonts.nunitoSans(fontSize: 30)),
                 ),
               ],
             ),
           ),
           new Expanded(
             child: Column(
               mainAxisSize:MainAxisSize.max,
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: <Widget>[
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addBracket(text);
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("()",
                       style:  GoogleFonts.nunitoSans(fontSize: 30)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addNum(text, "8");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("8",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addNum(text, "5");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("5",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addNum(text, "2");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("2",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addNum(text, "0");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("0",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
               ],
             ),),
           new Expanded(
             child: Column(
               mainAxisSize:MainAxisSize.max,
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: <Widget>[
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addMark(text, "%");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("%",
                       style:  GoogleFonts.nunitoSans(fontSize: 30)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addNum(text, "9");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("9",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addNum(text, "6");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("6",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addNum(text, "3");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("3",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addDot(text, ".");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text(".",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
               ],
             ),),
           new Expanded(
             child: Column(
               mainAxisSize:MainAxisSize.max,
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: <Widget>[
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addMark(text, "+");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("+",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addMark(text, "-");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("−",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addMark(text, "*");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("×",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     addMark(text, "/");
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("÷",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
                 FlatButton(
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                   onPressed: () => {setState((){
                     try{ equals(text);}
                     catch(Exception){
                       debugPrint(Exception.toString());
                       _scaffoldKey.currentState.showSnackBar(
                           SnackBar(
                             content: Text(Exception.toString()),
                             duration: Duration(seconds: 3),
                           ));}
                   })},
                   color: Colors.grey,
                   height: 70,
                   child: Text("=",
                       style:  GoogleFonts.nunitoSans(fontSize: 40)),
                 ),
               ],
             ),),
         ],
       ),
     ],);
   }
  Widget _buildLandscapeLayout() {
    return Column(children:[
      Expanded(child:
      Row(mainAxisAlignment: MainAxisAlignment.end,
        children:[
          Flexible(
          child: Text(checkIfEmpty(text)??"0",style: GoogleFonts.nunito(fontSize: 30),)
          ),],),),
      Row(mainAxisAlignment: MainAxisAlignment.end,children: [
        TextButton(onPressed: ()=>{setState((){
          if(text!=null)
            if(text.isNotEmpty)
              text.last=text.last.substring(0,text.last.length-1);
        })},
            child: Icon(CupertinoIcons.delete_left,))
      ],),
      Row(
        children:[
          Expanded(
            child:Column(
              mainAxisSize:MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    clearField();
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("С",
                      style:  GoogleFonts.nunitoSans(fontSize: 23)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addNum(text, "7");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("7",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addNum(text, "4");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("4",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addNum(text, "1");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("1",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    changeMark(text);
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("+/-",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
              ],
            ),
          ),
          new Expanded(
            child: Column(
              mainAxisSize:MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addBracket(text);
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("()",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addNum(text, "8");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("8",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addNum(text, "5");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("5",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addNum(text, "2");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("2",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addNum(text, "0");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("0",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
              ],
            ),),
          new Expanded(
            child: Column(
              mainAxisSize:MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addMark(text, "%");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("%",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addNum(text, "9");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("9",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addNum(text, "6");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("6",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addNum(text, "3");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("3",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addDot(text, ".");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text(".",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
              ],
            ),),
          new Expanded(
            child: Column(
              mainAxisSize:MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addMark(text, "+");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("+",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addMark(text, "-");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("−",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addMark(text, "*");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("×",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    addMark(text, "/");
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("÷",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(0)),
                  onPressed: () => {setState((){
                    try{ equals(text);}
                    catch(Exception){
                      debugPrint(Exception.toString());
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text(Exception.toString()),
                            duration: Duration(seconds: 3),
                          ));}
                  })},
                  color: Colors.grey,
                  height: 30,
                  child: Text("=",
                      style:  GoogleFonts.nunitoSans(fontSize: 25)),
                ),
              ],
            ),),
        ],
      ),
    ],);
  }
   addBracket(List<String> txt){
    if(checkIfClosed(txt)==true) {
      if(isNumber(txt.last)) txt.add("*(");
      else txt.add("(");
    }
    else txt.add(")");
  }
  String checkIfEmpty(List<String> txt){
    if(txt!=null){
    String txts="";
    txt.forEach((item){
      txts=txts+item;
    });
    return txts;}
  }
  bool isNumber(var elem){
    try{
      var val =double.parse(elem);
      return true;
    }
    on FormatException{
      return false;
    }
  }
  addMark(List<String> txt,String mark){
    if (txt.isNotEmpty && isNumber(txt.last)==true||txt.last==")") {
      txt.add(mark);
    }
    else if (txt.last=="+"||txt.last=="-"||txt.last=="*"||txt.last=="/"||txt.last=="%"){
      txt.removeLast();
      txt.add(mark);
    }
    else{
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text("Can't add mark "),
            duration: Duration(seconds: 3),
          ));}
  }
  addNum(List<String> txt,String num){
    if(txt.isNotEmpty){
      if(txt.last.length<=14){
      if (txt.last!="+"&&txt.last!="-"&&txt.last!="*"&&txt.last!="/"&&txt.last!="%"&&txt.last!="("&&txt.last!=")"&&txt.last!="("&&txt.last!="(-"&&txt.last!="*(") {
        txt.last = txt.last + num;
      }else if(txt.last==")"){addMark(txt, "*");txt.add(num);}
      else txt.add(num);}
    else{ _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Can't add more than 15 symbols"),
          duration: Duration(seconds: 3),
        ));}}
    else {txt.add(num);}
  }
  changeMark(List<String> txt){
    try{if(txt.length>=2 && (txt[txt.length-2 ] =="+"||txt[txt.length-2] =="*"||txt[txt.length-2] =="/"||txt[txt.length-2] =="%")) {
      var temp= txt.last;
      txt.removeLast();
      txt.add("(-");
      txt.add(temp);
    }
    else if(txt.length>=2 && txt[txt.length-2]=="(-"||txt[txt.length-2]=="-")
      {
        var temp= txt.last;
        txt.removeLast();
        txt.removeLast();
        txt.add(temp);
      }
    else{
      var temp= txt.last;
      txt.removeLast();
      txt.add("(-");
      txt.add(temp);
    }}
    catch (RangeError){var temp= txt.last;
    txt.removeLast();
    txt.add("(-");
    txt.add(temp);}
  }
  addDot(List<String> txt,String dot){
  if(txt.isNotEmpty && isNumber(txt.last)==true&&checkIfHasDot(txt)==true) {
      txt.last = txt.last + dot;
    }else return;
  }
  clearField() {
    text.clear();
  }
  bool checkIfHasDot(List<String> txt) {
    int dot = 0;
    var lastElem= txt.last;
    for (int i = 0; i < lastElem.length; i++) {
      if (lastElem[i] == ".") {
        dot++;
      }
    }
    if (dot<1){return true;}
    else return false;
  }
  bool checkIfClosed(List<String> txt) {
    int open = 0;
    int closed = 0;
    for (int i = 0; i < txt.length; i++) {
      if (txt[i] == "(-") {
        open++;
      }
      if (txt[i] == "*(") {
        open++;
      }
      if (txt[i] == "(") {
        open++;
      }
      if (txt[i] == ")") {
        closed++;
      }
    }
    if (open == closed){return true;}
    else return false;
  }
   equals(List<String> txt) {
     var expression=Expression.parse(checkIfEmpty(txt));
     var context;
     var r= evaluator.eval(expression, context);
     txt.clear();
     if (r is double && r.toString().length>=13){
     txt.add(r.toStringAsPrecision(10));}
     else txt.add(r.toString());
  }
}

