import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'project_test.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(home: AnimatedListSample());
  }
}

class FirstPage extends StatefulWidget {
   const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
String text = "";

@override
  void initState() {
    text = "Herzlich Willkommen";
    super.initState();
  }

  Widget myText() =>  InkWell(
onTap: (){
  text = "Text on Tap";
  setState(() {
    
  });
},

    child: Text (text,
    style: const TextStyle(
      fontSize: 26, 
      color: Colors.deepOrange
        )
      )
    );

  void klickMichfunktion() 
    { 
      // ignore: avoid_print
      print("Ich wurde geklickt");
    }


void makeNotification(String text)
{
   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text))
   );                                                                             
}








void makeAlert()
{
       showDialog(
                  barrierDismissible: true,
                  context: context, 
                  builder: (context) => 
     AlertDialog(
                title: const Text("Schließen"),
                content: const Text("Wollen Sie wirklich die App schließen"),
                  actions: [
                     ElevatedButton(
                      onPressed: (){
                        SystemNavigator.pop();
                      }, 
                      child: const Text("Ja")),
                    ElevatedButton(
                      onPressed: (){
                       Navigator.of(context).pop();
                       makeNotification("Du willst also weiter mit der App arbeiten. Gute Entschidung");
                      }, 
                      child: const Text("Nein"))
                  ]
                )
              );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:  const Text("Meine coole App",
      style: TextStyle(
          color: Colors.black
        ),
      ),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        leading: InkWell(
          onTap: () 
          {
             makeAlert();
          },
          child: const Icon(Icons.close)
          ),
        centerTitle: true, 

        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem<String>( 
                value: "Hallo",
                child: Text("Hallo"),
              )
            ]
          )
        ],
      
      ),
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [myText()]),
        Row(mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          ElevatedButton
          (
            onPressed: (){
              text = "Auf Wiedersehen!";
              setState(() {});
            }, 
            child: const Text("Hallo")
          )
        ])
      ],
    )));
  }
}
