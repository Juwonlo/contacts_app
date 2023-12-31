
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';



class ContactListPage extends StatefulWidget {
  ContactListPage({Key? key}) : super(key: key);



  @override
  State<ContactListPage> createState() => _ContactListPageState();

}

class _ContactListPageState extends State<ContactListPage> {

  List<Contact> contacts = [];
  List<Contact> contactsFiltered = [];
  TextEditingController searchController = new TextEditingController();

  @override
  void initState (){
    super.initState();
    getAllContacts();
    searchController.addListener(() {
          filterContacts();
    });
  }

  
  String flattenPhoneNumber(String phoneStr){
     return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m)  {

       return m[0] == "+" ? "+" : "";
     });
  }
  
  getAllContacts() async {
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    setState(() {
      contacts = _contacts;
    });
  }
// First filtercontact function
  filterContacts(){
      List<Contact> _contacts = [];
      _contacts.addAll(contacts);
      if (searchController.text.isNotEmpty) {
        _contacts.retainWhere((contact) {
          String searchTerm = searchController.text.toLowerCase();
          String searchTermFlatten = flattenPhoneNumber(searchTerm);
          String contactName = contact.displayName!.toLowerCase();
          bool nameMatches =  contactName.contains(searchTerm);
          if (nameMatches == true) {
            return true;
          }

          if (searchTermFlatten.isEmpty) {
            return false;
          }

          var phone = contact.phones?.firstWhere((phn) {

            String phnFlattened = flattenPhoneNumber(phn.value!);
            return phnFlattened.contains(searchTermFlatten);
          }, orElse: null );

          return phone != null;
        });

        setState(() {
          contactsFiltered = _contacts;
        });
      }
  }


  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: "Search",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                  color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: isSearching == true ? contactsFiltered.length : contacts.length,
                  itemBuilder: (context, index){
                  Contact contact = isSearching == true ? contactsFiltered[index] : contacts[index];
                    return Center(
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          title: Text(contact.displayName!,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                         ),
                          subtitle: Text(contact.phones!.elementAt(0).value!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          leading: (contact.avatar == null && contact.avatar!.isNotEmpty) ?
                          CircleAvatar(
                            backgroundImage: MemoryImage(contact.avatar!),
                          ) :
                              CircleAvatar(
                                child: Text(contact.initials()),
                              )
                        ),
                      ),
                    );
                  }

              ),
            ),
          ],
        ),
      ),
    );
  }
}
