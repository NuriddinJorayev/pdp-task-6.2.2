import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String id = "home_page";
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 var lang_list =[
   Locale('en', "EN"),
   Locale('kr', "KR"),
   Locale('jp', "JP"),
 ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(child: Text("flutter",
              style: TextStyle(fontSize: 19.0,
              ),).tr()),
            ),
            Container(
              height: (MediaQuery.of(context).size.height / 20) + 5.0,
              child: Row(
                children: [
                  _TextButtonBuilder("English", Colors.green, lang_list[0], "en"),
                  SizedBox(width: 10.0),
                  _TextButtonBuilder("Korean", Colors.red, lang_list[1],  "kr"),
                  SizedBox(width: 10.0),
                  _TextButtonBuilder("Japanese", Colors.blue, lang_list[2], "jp"),
                  SizedBox(width: 10.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _TextButtonBuilder(text, color, change_lang, _leng) => Expanded(
    
    child: Center(
      child: MaterialButton(
        shape: Localizations.localeOf(context).languageCode.compareTo(_leng) == 0 
        ? RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ): null,
        height: double.infinity,
        minWidth: double.infinity,
        onPressed: (){       
          context.setLocale(change_lang);          
        },
       color: color,
        child: Text(text, style: TextStyle(color: Colors.white),),
      ),
    ),
  );
  

}
