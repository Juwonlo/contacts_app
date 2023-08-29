import 'package:flutter/material.dart';


class ContactListPage extends StatelessWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 30,
            itemBuilder: (context, index){
              return Center(
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text('Contact test',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              );
            }

        ),
      ),
    );
  }
}
