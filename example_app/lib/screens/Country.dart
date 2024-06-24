import 'package:example_app/screens/counrtyMap.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
class Country extends StatelessWidget{
  final Map country;
  String _extractCurrencyNames(Map<dynamic, dynamic>? currencies) {
  if (currencies != null && currencies.isNotEmpty) {
    List<String> names = currencies.values.map((currency) {
      return currency is Map ? currency['name'].toString() : '';
    }).toList();
    return names.join(", "); // Join the names with a comma and space
  }
  return 'N/A';
}

  Country(this.country);
  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar( 
          backgroundColor: Colors.pink,
          title: Text(country['name']['common']),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: GridView(
             gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>
            [ 
              FlipCard(
                direction: FlipDirection.VERTICAL,
                front:  CountryCard(title: 'Capital',), 
                back:CountryDetailCard(title: country['capital']?.toString() ?? '',color: Colors.pink,),
                ),
                FlipCard(
                direction: FlipDirection.VERTICAL,
                front:  CountryCard(title: 'Population',), 
                back:CountryDetailCard(title: country['population']?.toString() ?? '',color: Colors.green,),
                ),
                FlipCard(
                direction: FlipDirection.VERTICAL,
                front:  CountryCard(title: 'Flag',), 
                back:CountryDetailCard(title: country['flag']?.toString() ?? '',color: Colors.grey,),
                ),
                FlipCard(
                direction: FlipDirection.VERTICAL,
                front:  CountryCard(title: 'Currency',), 
                back:CountryDetailCard(title: _extractCurrencyNames(country['currencies']),color: Colors.indigo,),
                ),
                


           
              
                   GestureDetector(onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => countryMap(),),);  
                   },child:CountryCard(title: 'Show on Map',)),
                
                
            ],
            
            ),
          ),
      );
  }
}

class CountryDetailCard extends StatelessWidget {
  final String title;
   final MaterialColor color;
  CountryDetailCard({required this.title,required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
                   color: color,
                  elevation: 10,
                 
                  child:  Center(child: Text(title,style: TextStyle(color: Colors.white,fontSize: 18),)
                  ),
                  );;
  }
}
class CountryCard extends StatelessWidget {
  final String title;
  const CountryCard({
   required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
     elevation: 10,
     child: Center(child:Text(title,style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)),
     );
  }
}