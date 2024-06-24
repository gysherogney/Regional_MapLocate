
// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// import 'package:flutter/material.dart';

// void main()
// {
//   runApp(Portifolio());
// }
// class Portifolio extends StatelessWidget{
//   @override
//  Widget build(BuildContext context)
//   {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
// }
// }

// class MyHomePage extends StatefulWidget{
//   @override
//   State<MyHomePage> createState()=>_MyHomePageState(); 
//   }



// class _MyHomePageState extends State<MyHomePage>{
//    int _currentIndex=0;
//    final  List<Widget> _pages = [
//          WelcomePage(),
//          ContactPage(),
//          MessagePage(),
//          SettingsPage(),
//    ];
//    @override
//    Widget build(BuildContext context){
//       return Scaffold(
//         appBar: AppBar(title: Text('MyNavigation bar')),
//         backgroundColor: Color.fromARGB(255, 212, 203, 206),
//         body: _pages[_currentIndex],
//         bottomNavigationBar: BottomNavigationBar(

//            currentIndex : _currentIndex,
//            onTap: (index){
//             setState(() {
//               _currentIndex = index;
//             });
//            },
//            backgroundColor: Colors.blue,
//             selectedItemColor: Colors.pink,
//             unselectedItemColor: Colors.grey,
//            items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),

//             BottomNavigationBarItem(
//               icon: Icon(Icons.contact_phone),
//               label: 'contact',
//               ),

//                BottomNavigationBarItem(
//               icon: Icon(Icons.message),
//               label: 'Message',
//               ),

//                BottomNavigationBarItem(
//               icon: Icon(Icons.settings),
//               label: 'Settings',
//               ),
//            ],
//         ),
//       );

//    }

// }

// class WelcomePage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Center(
//         child: Text('welcome'),
//     );
//   }
// }

// class ContactPage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Center(
//       child:Text('0719932771')
//       );
//   }
// }

// class MessagePage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Center(
//       child:Text('Hellow there')
//       );
//   }
// }
// class SettingsPage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Center(
//       child:Text('Mysetting')
//       );
//   }
// }


import 'package:flutter/material.dart';
void main(){
  runApp(Mimi());
}
class Mimi extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Homepage(),
    );
  }

}
class Homepage extends StatefulWidget{
  @override
  State<Homepage> createState()=>_MyHomePageState();
}
class _MyHomePageState extends State<Homepage>{
  @override
  int _currentIndex=0;
  final List<Widget> _lists = [
    WelcomePage(),
    ContactPage(),
    MessagePage(),
    SettingsPage(),
  ];

   Widget build(BuildContext context){
        return Scaffold(
          appBar: AppBar( 
            title: Text('MY FIRST DART'),
          ),
          body: _lists[_currentIndex],
          bottomNavigationBar: BottomNavigationBar( 
                 currentIndex:_currentIndex,
                 onTap: (index){
                  setState(() {
                    _currentIndex = index;
                  });
                 },
                 backgroundColor: Colors.blue,
                 selectedItemColor: Colors.pink,
                 unselectedItemColor: Colors.grey,
              
                   items: const [
                  BottomNavigationBarItem(
                    icon:Icon(Icons.home),
                    label:'Home',
                  ),

                  BottomNavigationBarItem(
                    icon:Icon(Icons.contact_phone),
                    label:'ContactMe',
                  ),

                  BottomNavigationBarItem(
                    icon:Icon(Icons.message),
                    label:'Message',
                  ),
                  
                  BottomNavigationBarItem(
                    icon:Icon(Icons.settings),
                    label:'settings',
                  ),
                ]
          
         
        )
        );
   }
}

class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
 return Center(
  child: Text('welcome ')
 );
  }
}
class ContactPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
 return Center(
  child: Text('0719932771 ')
 );
  }
}
class MessagePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
 return Center(
  child: Text('hellow there!!')
 );
  }
}
class SettingsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
 return Center(
  child:Text ('Mysetting')
 );
  }
}