import 'package:dio/dio.dart';
import 'package:example_app/screens/Country.dart';
import 'package:flutter/material.dart';

class AllCountries extends StatefulWidget {
  @override
  State<AllCountries> createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  late List countries = [];
   late List filteredCountries = [];
  bool isSearching = false;

  getCountries() async {
    var response = await Dio().get('https://restcountries.com/v3.1/all');
    return response.data;
  }

  @override
  void initState() {
    super.initState();
    getCountries().then((data) {
      setState(() {
        countries=filteredCountries  = data;
      });
    });
  }

  void _filterCountries(value) {
    setState(() {
      filteredCountries  = countries.where((country) => country['name']['common']
            .toString().toLowerCase().contains(value.toLowerCase())).toList();
    });
  
  }

  @override
  Widget build(BuildContext context) {
    print(countries);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: !isSearching
            ? Text('All Countries')
            : TextField(
                onChanged: (value) {
                  _filterCountries(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.white),
                    hintText: "Search Country here",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                      filteredCountries = countries;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: filteredCountries .length>0 ? ListView.builder(
          itemCount: filteredCountries .length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Country(filteredCountries [index]),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Card(
                    elevation: 10,
                    child: Text(
                     filteredCountries [index]['name']['common'],
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            );
          },
        ):Center
        (
          child:CircularProgressIndicator(),
      ),
    )
    );
  }
}

// class AllCountries extends StatefulWidget{
//   @override
//   State<AllCountries> createState() => _AllCountriesState();
// }

// class _AllCountriesState extends State<AllCountries> {
//   late List countries=[];
//     bool isSearching = false;
//    getCountries() async{
  
//     var response = await Dio().get('https://restcountries.com/v3.1/all');
//   return response.data;
 

//   } 

//   @override
//   void initState() {
//     // TODO: implement initState
//      getCountries().then((data){
//       countries=data;
//       });
//      }
    
//     super.initState();
//   }
//   void  _filterCountries(value){
//      print(value);
//   }

//   @override
//   Widget build(BuildContext context){
//         print(countries);
 
//       return Scaffold(
//         appBar: AppBar( 
//           backgroundColor: Colors.pink,
//           title: !isSearching ? Text('All Countries'): TextField(
//             onChanged: (value){
//               _filterCountries(value); 
//             },
//             style: TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               icon:Icon(Icons.search,color: Colors.white,),
//               hintText: "Search Country here",
//               hintStyle: TextStyle(color: Colors.white)
//               ),
//               ),
              
//            actions: <Widget>[
//             isSearching ?
//             IconButton( 
//               icon: Icon(Icons.cancel),
//             onPressed: (){
//               setState(() {
//                 this.isSearching = false;
//               });
//             },
//             ):
//             IconButton( 
//               icon: Icon(Icons.search),
//             onPressed: (){
//               setState(() {
//                 this.isSearching = true;
//               });
//             },
//             )
//           ],
//         ),
          
        

//         body: Container(
//           padding: const EdgeInsets.all(15),

//            child: ListView.builder(itemBuilder: (BuildContext context, int index){
//           return Padding( padding: const EdgeInsets.only(bottom: 10), 
//                    child:ElevatedButton(
//                          onPressed: () {
//                              Navigator.of(context).push(MaterialPageRoute(

//                          builder: (context) => Country(countries[index]),
//         ));
//       },
//          style: ElevatedButton.styleFrom(
//                   primary: Colors.white,
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),

//                   child: Card(
//                     elevation: 10,
//                     // color: Colors.red,
//                     child: Text(countries[index]['name']['common'], style: TextStyle(fontSize: 18)),
//                   ),
                  
//                 ),
//               ),
//                     );
//         }),
           

//       )
//       );
//   } 
