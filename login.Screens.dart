import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreens extends StatefulWidget{
  _LoginScreens createState() => _LoginScreens();
}
class _LoginScreens extends State<LoginScreens> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _hideKeyboard(),
      child:  Scaffold(
      backgroundColor: Colors.blue[50],
        body: LayoutBuilder(builder: (context, constraints){
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
             minWidth: constraints.maxWidth,
             minHeight: constraints.maxHeight,
            ),
          child: IntrinsicHeight(
          child: SafeArea(
            top: false,
            child: Form(
              key: _formKey,
            child: Column(
             mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _bulidUpperContainer(),
                Expanded(
                  child: _bulidMiddleContainer(),
                ),
                SizedBox(height: 20.0),
                _buildLoginButton()
              ],
            ),
            ),
          ),
          ),
          ),
        );
    }
    ),
    ),
    );
  }
  _bulidUpperContainer(){
    return Stack(
      children: <Widget>[
     Container(
       width: MediaQuery.of(context).size.width,
       height: 300,
       color: Colors.blue[100],
     ),
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Center(
             child: Image(
                width: 220,
                height: 220,
                image: AssetImage('images/gogreen.png'),
              ),
          ),
        )
      ],
    );
  }
_bulidMiddleContainer(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
     children: <Widget>[
     Padding(
       padding: const EdgeInsets.only(left: 28.0),
      child: Text(
          'Login',
          style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold
          )
      )
     ),
     SizedBox(height: 20.0),
     Padding(
     padding: const EdgeInsets.only(left: 28.0, right: 28.0),
      child: TextFormField(
        validator: (value) {
          return value.isEmpty ? 'Please Provide Email Address!' : null;
        },
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Image(image: AssetImage('images/email.png')),
        filled: true,
        fillColor: Colors.grey[200],
        labelText: 'Email',
        labelStyle: TextStyle(fontSize: 18.0)
        )
      ),
      ),
       SizedBox(height: 20.0),
       Padding(
         padding: const EdgeInsets.only(left: 28.0, right: 28.0),
           child: TextFormField(
               validator: (value) {
                 return value.isEmpty ? 'Please Provide Passwords!' : null;
               },
             keyboardType: TextInputType.emailAddress,
             textInputAction: TextInputAction.next,
             obscureText: true,
             decoration: InputDecoration(
               prefixIcon: Image(image: AssetImage('images/email.png')),
               filled: true,
               fillColor: Colors.grey[200],
               labelText: 'Passwords',
               labelStyle: TextStyle(fontSize: 18.0),
             )
  ),
       )
     ],
    );
}
_buildLoginButton(){
 return Padding(
   padding: const EdgeInsets.only(left: 28.0, right: 28.0, bottom: 28.0),
   child: SizedBox(
 width:MediaQuery.of(context).size.width ,
   height: 44,
   child: RaisedButton(
   child: Text('Log In'),
   color: Colors.blue[400],
   onPressed: () {
     _formKey.currentState.validate();
   },
 ),
 ),
 );
}
  _hideKeyboard() {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if(!currentFocus.hasPrimaryFocus){
    currentFocus.unfocus();
  }
  }
}