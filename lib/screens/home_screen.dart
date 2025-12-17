import 'package:flutter/material.dart';
import 'package:game_booking_system/components/reusable_widget.dart';
import 'package:game_booking_system/screens/indoor_screen.dart';
import 'package:game_booking_system/screens/outdoor_screen.dart';
import 'package:game_booking_system/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex=0;
  List<Widget> screenList= const[
    HomeScreenContent(),
    IndoorScreen(),
    OutdoorScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('SlotUp',
              style: AppTextStyles.bodyStyle(
                  // color: Color.fromRGBO(150, 27, 30, 1),
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
            ),
        ),
        backgroundColor: Color.fromRGBO(40, 218, 238, 0.8),      ),
      body:
      IndexedStack(
        children: screenList,
        index: selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: (index){
          setState(() {
            selectedIndex=index;
          });
        },
          currentIndex: selectedIndex,
          // selectedItemColor: Color.fromRGBO(237, 64, 211, 0.8),
          selectedItemColor: Color.fromRGBO(150, 27, 30, 1),
          items:const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color.fromRGBO(40, 218, 238, 0.8),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_esports_outlined),
              label: 'Indoor',
              backgroundColor: Color.fromRGBO(40, 218, 238, 0.8),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_cricket_outlined),
              label: 'Outdoor',
              backgroundColor: Color.fromRGBO(40, 218, 238, 0.8),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Color.fromRGBO(40, 218, 238, 0.8),
            ),
          ]
      ),
    );
  }
}


class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  List<IconData> gameIcons=[
    Icons.sports_esports_outlined,
   Icons.sports_cricket_outlined,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: gameIcons.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            crossAxisSpacing: 30,
            childAspectRatio: 1,
          ),
          itemBuilder: (BuildContext context, int index){
          final icon=gameIcons[index];
          final gameNames=['Indoor games','Outdoor games'];
            return InkWell(
              onTap: (){
                  // context.read<ServicesProvider>().switchTab(1);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(40, 218, 238, 0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon,size: 40,color: Color.fromRGBO(150, 27, 30, 1),),
                  ),
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height*0.006
                  ),
                  Text(
                    gameNames[index],
                    style: AppTextStyles.bodyStyle(
                        fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            );
          }),
    );
  }
}
