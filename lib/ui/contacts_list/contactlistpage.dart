import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';



class ContactListPage extends StatefulWidget {
  ContactListPage({Key? key}) : super(key: key);



  @override
  State<ContactListPage> createState() => _ContactListPageState();

}

class _ContactListPageState extends State<ContactListPage> {

  List<Contact> contacts = [];

  @override
  void initState (){
    super.initState();
    getAllContacts();
  }

  getAllContacts() async {

  }


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
                    border: Border.all(width: 2, color: Colors.blue),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    title: Text('0902345678',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    subtitle: Text('Mutii',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
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
}
