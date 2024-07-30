import 'package:flutter/material.dart';

import '../resources/socket_methods.dart';
import '../responsive/responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.only(
            left: 35, right: 35, top: 80
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              const CustomText(
                shadows: [
                  Shadow(
                    blurRadius: 0,
                    color: Colors.black,
                  ),
                ],
                text: 'Create Room',
                fontSize: 28,
              ),
              // SizedBox(height: size.height * 0.08),


              const Icon(Icons.house_outlined, size: 50,),


              CustomTextField(
                controller: _nameController,
                hintText: 'Enter your nickname',
              ),


              // SizedBox(height: size.height * 0.045),
              CustomButton(
                  onTap: () => _socketMethods.createRoom(
                    _nameController.text,
                  ),
                  text: 'Create'),
            ],
          ),
        ),
      ),
    );
  }
}
