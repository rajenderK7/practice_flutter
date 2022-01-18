import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_x/intro_screens/intro_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroScreens(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pagesRow = ["Home", "Store", "Profile"];
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Clean UI",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
              child: ListView.builder(
                itemCount: pagesRow.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return topNavItem(index);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "Clean",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "UI",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "Flutter.",
                        style: GoogleFonts.poppins(
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "People",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: contactItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading:
                          CircleAvatar(backgroundColor: contactColors[index]),
                      title: Text(
                        contactItems[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(contactItems[index].desc),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Inspiration",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contactItems.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: contactColors[index],
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Text(contactItems[index].name),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding topNavItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            pageIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: pageIndex == index ? Colors.black : null,
          ),
          child: Center(
            child: Text(
              pagesRow[index],
              style: pageIndex == index
                  ? const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )
                  : const TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContactItem {
  final String name;
  final String desc;

  const ContactItem({required this.name, required this.desc});
}

final List<ContactItem> contactItems = [
  const ContactItem(name: "Rajender", desc: "Bussiness Man"),
  const ContactItem(name: "Virat Kohli", desc: "Cricketer"),
  const ContactItem(name: "Lionel Messi", desc: "Footballer"),
  const ContactItem(name: "Zendaya", desc: "Actress"),
  const ContactItem(name: "Linus Torvals", desc: "Computer Scientist"),
];

final contactColors = [
  Colors.black,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.red,
];
