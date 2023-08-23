import 'package:flutter/material.dart';


class ContactListPage extends StatelessWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: ListView.builder(
        itemCount: 30,
          itemBuilder: (context, index){
            return Center(
              child: Text('Contact test',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            );
          }

      ),
    );
  }
}
