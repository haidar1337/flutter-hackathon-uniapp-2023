import 'package:flutter/material.dart';
import 'package:projectname/features/profile/data/Student.dart';
import 'package:projectname/features/profile/data/data_generator.dart';

const Color pageBackColor = Colors.white;
const Color rectBackColor = Colors.green;
const Color backButtonColor = Colors.white;
final Color redColor = Colors.red.shade900;
const double boxHight = 160;
const String personName = "Ahmed Talal";
const String stuID = "202017740";
const String govID = "1116607423";
const String nationEng = "Saudi";
const String dateEng = "25/6/2002";
const String personEmail = "s202017740@kfupm.edu.sa";
const textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

final Student student = Student(
  name: personName,
  stuId: stuID,
  govId: govID,
  nationality: nationEng,
  dateBirth: dateEng,
  email: personEmail,
);

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
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              right: 20.0,
              left: 20.0,
            ),
            child: Column(
              children: [
                const Center(
                  child: SizedBox(height: boxHight - 120),
                ),
                const CircleAvatar(
                  radius: 70,
                  backgroundColor: pageBackColor,
                  child: CircleAvatar(
                    backgroundColor: rectBackColor,
                    // backgroundImage: , // provide the image
                    radius: 60,
                    child: Icon(
                      color: pageBackColor,
                      Icons.person,
                      size: 100,
                    ),
                  ),
                ),
                DataGenerator(student: student),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(backButtonColor),
                    ),
                    onPressed: () {},
                    child: const Text("Log Out", style: textStyle),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
