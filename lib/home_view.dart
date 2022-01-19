
import 'package:awesome_contact_app/contact_details_view.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'contact_model.dart';

class Homeview extends StatelessWidget {
  Homeview({ Key? key }) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String,String>>data =
  [
	{
		"name": "Antoinette",
		"phone": "+233 20 89 36 857",
		"email": "annie@hotmail.com",
		"region": "Ashanti",
		"country": "Ghana"
	},
	{
		"name": "Asia",
		"phone": "+233 24 70 10 228",
		"email": "asiated@gmail.com",
		"region": "Greater Accra",
		"country": "Ghana"
	},
	{
		"name": "Betty",
		"phone": "+233 54 87 44 921",
		"email": "bettybutter@yahoo.com",
		"region": "Greater Accra",
		"country": "Ghana"
	},
	{
		"name": "Brown",
		"phone": "+233 20 70 96 189",
		"email": "brown87@icloud.ca",
		"region": "Central",
		"country": "Ghana"
	},
	{
		"name": "Carlie",
		"phone": "+233 24 96 75 556",
		"email": "carlie.x@icloud.net",
		"region": "Northern",
		"country": "Ghana"
	},
	{
		"name": "Tatiana",
		"phone": "+233 20 87 32 857",
		"email": "tatiem@outlook.org",
		"region": "Volta",
		"country": "Ghana"
	},
	{
		"name": "Ama",
		"phone": "+233 54 79 36 117",
		"email": "ammak@gmail.com",
		"region": "Greater Accra",
		"country": "Ghana"
	},
	{
		"name": "Ankomah",
		"phone": "+233 23 99 34 057",
		"email": "ankomah7@yahoo.com",
		"region": "Volta",
		"country": "Ghana"
	},
	{
		"name": "Ron",
		"phone": "+233 54 50 35 857",
		"email": "ac@google.net",
		"region": "Central",
		"country": "Ghana"
	},
	{
		"name": "Gladie",
		"phone": "+233 24 24 67 354",
		"email": "gglady@hotmail.edu",
		"region": "Western",
		"country": "Ghana"
	}
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('My Contacts' ,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,
        color: Colors.black),),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(radius: 25,
              backgroundImage: AssetImage('assets/avatar.jpg'),),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)),
                hintText: 'Search by name or number',
                prefixIcon: const Icon(Icons.search)
          ),
        
        ),
        ),
      ),
     ), 
     body: SafeArea(
       child: ListView(
       controller: _scrollController,
       children: [
       const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Recent', 
           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
           ),
        ),
       ListView.separated(
         controller: _scrollController,
         shrinkWrap: true,
         itemBuilder: (context,index){
            return  ListTile(
              onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
  return ContactDetailsView(contact: Contact(country: 'Ghana', email: 'ankomahadwoa7@gmail.com',
  name: 'Adwoa Agyeiwaa',
  phone: '+233 24 77 61 966',
  region: 'Greater Accra'));
}));
              },
           leading: const CircleAvatar(
             radius: 25,
             backgroundImage: AssetImage('assets/avatar.jpg'),
           ),
           title: const Text(
             'Adwoa Agyeiwaa',
             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
           ),
           subtitle: const Text('+233 24 77 61 966'),
           trailing: const IconButton(onPressed: null, icon: Icon(Icons.more_horiz)),
         );
           },
           separatorBuilder: (context,index){
             return  const Divider(
           indent: 25,
           thickness: 2,
             );
           },
           itemCount: 3),     
           const Padding(
             padding: EdgeInsets.symmetric(horizontal: 16),
             child: Text('Contacts',
             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
           ),
           GroupedListView<Map<String,String>,String>(
             shrinkWrap: true,
             elements:data,
    groupBy: (element) => element['name'].toString().substring(0,1),
    groupSeparatorBuilder: (String groupByValue) => 
    SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          groupByValue.substring(0,1),
          textAlign: TextAlign.right,
          style: 
          const TextStyle(fontWeight: FontWeight.w600, fontSize: 18 ),
          ),
      ),
      ),
    itemBuilder: (context, Map<String,String> element) {
      Contact contact = Contact.fromJson(element);
      return Column(
      children: [
        ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
           return ContactDetailsView(contact: contact,);
           },));
          },
               leading: const CircleAvatar(
                 radius: 25,
                 backgroundImage: AssetImage('assets/person1.jpg'),
               ),
               title: Text(
                 '${element['name']}',
                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
               ),
              subtitle: Text('${element['phone']}'),
              trailing:
               const IconButton(onPressed: null, icon: Icon(Icons.more_horiz),),),
              const Divider(
           indent: 25,
           thickness: 2,
              )
      ],
    );
    },
    
    itemComparator: (item1, item2) => 
    item1['name']!.compareTo(item2['name']!), // optional
    useStickyGroupSeparators: true, // optional
    floatingHeader: true, // optional
    order: GroupedListOrder.ASC, // optional
  ),
       ],
     ),
     ),
     floatingActionButton: const FloatingActionButton(
       backgroundColor: Color(0xff1A4ADA),
       onPressed: null,    
       child: Icon(Icons.add),),
        );
  }
}