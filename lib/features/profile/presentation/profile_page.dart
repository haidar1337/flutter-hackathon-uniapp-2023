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
          Expanded(
            child: Container(
              color: rectBackColor,
              width: double.maxFinite,
              height: boxHight,
            ),
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
                StudentCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

const textStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

class StudentCard extends StatelessWidget {
  const StudentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 324,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: rectBackColor,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red.shade900,
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(40)),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "طالب",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Studetn",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(40)),
                  ),
                  child: const Center(
                    child: Text(
                      "King Fahd University",
                      style: textStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("202017740", style: textStyle),
              const SizedBox(width: 10),
              Container(
                color: Colors.green.shade200,
                width: 2,
                height: 40,
              ),
              const SizedBox(width: 10),
              const Column(
                children: [
                  Text(
                    "أحمد طلال",
                    style: textStyle,
                  ),
                  Text(
                    "Ahmed Talal",
                    style: textStyle,
                  ),
                ],
              ),
            ],
          ),
          Divider(color: Colors.green.shade200, thickness: 1),
          rowGenetator("Govt.ID", "السجل المدني", "1116607423", "١١١٦٦٠٧٤٢٣"),
          Divider(color: Colors.green.shade200, thickness: 1),
          rowGenetator("Nationality", "الجنسية", "Saudi", "سعودي"),
          Divider(color: Colors.green.shade200, thickness: 1),
          rowGenetator(
            "Date of Birth",
            "تاريخ الميلاد",
            "25/6/2002",
            "14/4/1423",
          ),
        ],
      ),
    );
  }

  Row rowGenetator(
      String titleEng, String titleArb, String valueEng, String valueArb) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(valueEng, style: textStyle),
        const SizedBox(width: 10),
        Container(
          color: Colors.green.shade200,
          width: 2,
          height: 40,
        ),
        const SizedBox(width: 10),
        Text(valueArb, style: textStyle),
        const SizedBox(width: 10),
        Container(
          color: Colors.green.shade200,
          width: 2,
          height: 40,
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Text(titleArb, style: textStyle),
            Text(titleEng, style: textStyle),
          ],
        ),
      ],
    );
  }
}
