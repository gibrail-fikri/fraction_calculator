import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Declaring controller for each textfield
  final TextEditingController _sc1 = TextEditingController();
  final TextEditingController _sc2 = TextEditingController();
  final TextEditingController _sc3 = TextEditingController();
  final TextEditingController _sc4 = TextEditingController();
  
  //Declaring variables
  double _nume1=0,_nume2=0,_numeans=0,_den1=0,_den2=0,_denans=0,_decans=0;
  String _selection = "+";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.fallback(),
      title: 'Material App',
      home: Scaffold(
        
        appBar: AppBar(
          title: Text('Fraction Calculator'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            //Numerator
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
              child: Padding(
                padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                child: TextField(
                  controller: _sc1,
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.all(5),
                    border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(15))
                    )
                  ),
                  keyboardType: TextInputType.number,
                ),
                
              ),
              ),
              Flexible(
              child: Padding(
                padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                child: TextField(
                  controller: _sc2,
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.all(5),
                    border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(15))
                    )
                  ),
                  keyboardType: TextInputType.number,
                ),
                
              ),
              ),

              
            ],
            ),
             
             //Line Decorations and Selection
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Flexible(
                 child: Padding(
                   padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
                   child: Text("______________")
                 ),),

                 //select start
                 Flexible(
                   
                   child:Padding(
                     padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                     
                   child:DropdownButton<String>(
                     
                     value: _selection,
                     onChanged: (String value) {
                      setState(() {
                        _selection=value;
                      });
                     },
                     items: <String>["+","-","/","*"].map<DropdownMenuItem<String>>((String sel){
                       return DropdownMenuItem<String>(
                         value: sel,
                         child: Text(sel),
                       );
                     }).toList(), 
                     
                   ),
                 ),),
                 //select end

                 Flexible(
                 child: Padding(
                   padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                   child: Text("______________")
                 ),),
               ],
             ),
             
             
             //Denominator 
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
              child: Padding(
                padding: EdgeInsets.fromLTRB(70, 12, 70, 0),
                child: TextField(
                  controller: _sc3,
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.all(5),
                    border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(15))
                    )
                  ),
                  keyboardType: TextInputType.number,
                ),
                
              ),
              ),
              Flexible(
              child: Padding(
                padding: EdgeInsets.fromLTRB(70, 12, 70, 0),
                child: TextField(
                  controller: _sc4,
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.all(5),
                    border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(15))
                    )
                  ),
                  keyboardType: TextInputType.number,
                ),
                
              ),
              ),

              
            ],
            ),
            
            //Buttons section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
                  child: RaisedButton(
                  color: Color.fromRGBO(107, 198, 4, 100),
                  child: Text("Calculate"),                      //Calculate button
                  onPressed: _calculate,
                                    
                  )),
                  Padding(
                  padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
                  child: RaisedButton(
                  color: Colors.red,
                  child: Text("Reset"),                         //Reset button
                  onPressed: _reset,
                                                      
                                    ))
                                  
                                                  ],
                                                ),
             Padding(
            
            //Answers section
             child: Text("Answer:", style: new TextStyle(
               fontSize: 20,
             ),), padding: EdgeInsets.fromLTRB(0, 20, 0, 0),),
             Padding(
               padding: EdgeInsets.fromLTRB(5, 30, 5, 5),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                   Text(num.parse("$_numeans").toStringAsFixed(2),style: new TextStyle(fontSize: 20)), //formatted with .2 decimal points
                   Text("________"),
                   Text(num.parse("$_denans").toStringAsFixed(2),style: new TextStyle(fontSize: 20)),
                   ],
                 ),
                 Padding(
                   padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                 child:Text("OR",style: new TextStyle(fontSize: 25)),), //Or to separate 2 types of answer
                 Text(num.parse("$_decans").toStringAsFixed(2),style: new TextStyle(fontSize: 20))
               ],
             )),
                  ],
                     ),
                       ),
                        );
                          }         
                                                  
                                    
                 void _calculate() {              //Calculate method
                      _nume1 = double.parse(_sc1.text);
                      _nume2= double.parse(_sc2.text);
                      _den1  = double.parse(_sc3.text);
                      _den2 = double.parse(_sc4.text);
                      
                      //Calculate according to selection
                      setState(() {
                        if (_selection == "+"){
                        _numeans= _nume1*_den2 + _nume2*_den1;
                        _denans=_den1*_den2;
                        _decans= (_nume1/_den1) + (_nume2/_den2);
                        }
                        else if(_selection == "-"){
                        _numeans= (_nume1*_den2) - (_nume2*_den1);
                        _denans=_den1*_den2;
                        _decans= (_nume1/_den1) - (_nume2/_den2);
                        }
                        else if(_selection == "/"){
                        _numeans= _nume1*_den2;
                        _denans=_nume2*_den1;
                        _decans= (_nume1/_den1) / (_nume2/_den2);
                        }
                        else if(_selection == "*"){
                        _numeans= _nume1*_nume2;
                        _denans=_den1*_den2;
                        _decans= (_nume1/_den1) * (_nume2/_den2);
                        }
                        _conv();   //call convert method
                        });
                        }
                      

                        void _conv() { //Simplify and finalise answer for the fraction answer
                          setState(() {
                            double cf = gcd(_numeans,_denans);
                            _denans=_denans/cf;
                            _numeans=_numeans/cf;
                          });
                        }
              
                        double gcd(double x, double y) { //greatest common divisor method to help calculation
                              if(x==0){
                                return y;
                              }
                              else{
                               return gcd(y%x,x);
                            }

                            }

                        void _reset() { //Reset all the values
                            setState(() {
                            _sc1.clear();
                            _sc2.clear();
                            _sc3.clear();
                            _sc4.clear();
                            _decans=0;
                            _denans=0;
                            _numeans=0;
                            });
                            }
                        }

                        