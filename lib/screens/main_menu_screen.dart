import 'package:flutter/material.dart';
import 'package:multiplayer_tictactoe/utils/colors.dart';

import '../responsive/responsive.dart';
import '../widgets/custom_button.dart';
import 'create_room_screen.dart';
import 'join_room_screen.dart';


class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {

    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            const Text(" Multiplayer\nTic-Tac-Toe",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: btnColor,


              ),
            ),


            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.safety_divider_outlined, size: 50,),
                Icon(Icons.lens_blur_sharp, size: 50,),
                Icon(Icons.tag_rounded, size: 50,),
              ],
            ),



            Column(
              children: [
                CustomButton(
                  onTap: () => createRoom(context),
                  text: 'Create Room',
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onTap: () => joinRoom(context),
                  text: 'Join Room',
                ),
              ],
            ),

            // const SizedBox(height: 50,),


          ],
        ),
      ),
    );
  }
}
