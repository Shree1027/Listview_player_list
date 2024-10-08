

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  TextEditingController nameController=TextEditingController();

  String? myName;

  List<String> playerList=[];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          title: const Text(
            "Player List",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500
            ),

          ),

          backgroundColor: Colors.blue,
          centerTitle: true,
        ),

        body:  Column(
          children: [

            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                  controller:nameController,
                style: const TextStyle(
                  fontSize: 24,
                ),
              
                decoration: const InputDecoration(
             
           
                  
                  hintText: "Enter Name",
                  hintStyle:  TextStyle(
                    fontSize: 20,
                    color: Colors.grey
                  ),
                  border:  OutlineInputBorder(),
              
                ),

                onChanged: (String val) {
                  print("Value:$val");
                  
                },

                onEditingComplete: () {
                  print("Editing Completed");
                },

                onSubmitted: (value) {
                  print("Value Submitted: $value");
                  
                },
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            GestureDetector(
              onTap: () {
                print("Add Data");

                myName=nameController.text.trim();
                print("My Name: $myName");
                if(myName!=""){
                  playerList.add(myName!);
                  print("Playerlist length: ${playerList.length}");
                  nameController.clear();

                  setState(() {
                    
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal:15,
                  vertical:5,
                ),
              
              
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
               ),
              
               child:  const Text(
                "Add Data",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
               ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            ListView.builder(
              itemCount: playerList.length,
              itemBuilder: (context, index) {
                return Text(
                  "Name: ${playerList[index]}",
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                );
              },
            )


          ],
        ),
       
      ),
    );
  }
}
