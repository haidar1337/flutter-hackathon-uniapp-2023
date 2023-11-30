import 'package:flutter/material.dart';

const Color pageBackColor = Colors.white;
const Color rectBackColor = Colors.green;
const Color backButtonColor = Colors.white;
const double boxHight = 160;
const String personName = "Ali hubail";
const String personEmail = "Alllli@gmail.com";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackColor,
      body: Stack(
        children: [
          Container(
            color: rectBackColor,
            width: double.maxFinite,
            height: boxHight,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
            child: SafeArea(
              child: SizedBox(
                width: 110,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(backButtonColor),
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Text("Back"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              right: 20.0,
              left: 20.0,
            ),
            child: Column(
              children: [
                const Center(
                  child: SizedBox(height: boxHight - 130),
                ),
                const CircleAvatar(
                  radius: 75,
                  backgroundColor: pageBackColor,
                  child: CircleAvatar(
                    // backgroundImage: , // provide the image
                    radius: 60,
                    child: Icon(
                      Icons.person,
                      size: 100,
                    ),
                  ),
                ),
                const Text(
                  personName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(personEmail),
                const SizedBox(height: 10),
                SizedBox(
                  width: 145,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(backButtonColor),
                    ),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Edit Profile"),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 270,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: rectBackColor,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
