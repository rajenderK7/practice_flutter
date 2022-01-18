import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreens extends StatelessWidget {
  const IntroScreens({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageColors = [
      Colors.amberAccent,
      Colors.pinkAccent,
      Colors.greenAccent,
    ];

    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: pageColors.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/welcome-${index + 1}.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(
                top: 100,
                left: 30,
                right: 50,
                bottom: 100,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pageText[index].text,
                          style: GoogleFonts.montserrat(
                            color: Colors.deepPurple,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy text used in many programming applications, while placeholder is shown before rendering a widget in order to keep space.",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      index == 0
                          ? const PageIndicator()
                          : const DullPageIndicator(),
                      index == 1
                          ? const PageIndicator()
                          : const DullPageIndicator(),
                      index == 2
                          ? const PageIndicator()
                          : const DullPageIndicator(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PageText {
  final String text;
  const PageText({required this.text});
}

List<PageText> pageText = [
  const PageText(text: "This is page 1."),
  const PageText(text: "This is page 2."),
  const PageText(text: "This is page 3."),
];

class PageIndicator extends StatelessWidget {
  const PageIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      height: 30,
      width: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.deepPurple,
      ),
    );
  }
}

class DullPageIndicator extends StatelessWidget {
  const DullPageIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey,
      ),
    );
  }
}
