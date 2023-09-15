import 'package:contacts_app/ui/contacts_list/contactlistpage.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () async{
              try{
                await ContactsService.openContactForm();
              }on FormOperationException catch (e) {

                switch(e.errorCode) {
                  case FormOperationErrorCode.FORM_OPERATION_CANCELED:
                  case FormOperationErrorCode.FORM_COULD_NOT_BE_OPEN:
                  case FormOperationErrorCode.FORM_OPERATION_UNKNOWN_ERROR:
                  case null:
                    print(e.toString());
                }
              }
            },
        child: Icon(Icons.add),
        ),
        body: ContactListPage(),
      )
    );
  }
}
