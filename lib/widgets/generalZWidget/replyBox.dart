import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/widgets/generalZWidget/taskBoxes.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';

class GeneralZUserReply extends StatelessWidget {
  GeneralZUserReply({Key? key, required this.text, required this.time})
      : super(
          key: key,
        );
  String text;
  String time;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 10, top: 9, bottom: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14), color: themeClor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 22),
                child: Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Satoshi",
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                time,
                style: const TextStyle(
                    color: Colors.white60,
                    fontFamily: "Satoshi",
                    fontSize: 6,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ));
  }
}

class NormalReplyByGeneralZ extends StatelessWidget {
  NormalReplyByGeneralZ({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Image.asset(
            "assets/images/generalz.webp",
            height: 39,
            width: 39,
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.only(left: 15, top: 12, right: 15, bottom: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), color: themeClor),
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Satoshi",
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}

class GeneralZReplyWithOptionTasks extends StatelessWidget {
  GeneralZReplyWithOptionTasks(
      {Key? key,
      required this.words,
      required this.text,
      required this.taskList})
      : super(key: key);
  List<String> taskList;
  String text;

  final Map<String, HighlightedWord> words;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 46,
        ),
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.only(left: 11, right: 11, top: 11, bottom: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), color: themeClor),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4),
                  child: TextHighlight(
                    text: text,
                    words: words,
                    textStyle: const TextStyle(
                        fontSize: 12,
                        height: 1.4,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Satoshi",
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    runSpacing: 8.42,
                    spacing: 7.22,
                    children: [
                      for (int i = 0; i < taskList.length; i++)
                        i < 2
                            ? PriorTaskBoxes(task: taskList[i])
                            : SecondPriorTaskBoxes(task: taskList[i])
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color.fromRGBO(58, 62, 50, 1)),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 14,
                          color: themeClor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Add Shortcut",
                      style: TextStyle(
                          color: themeClor,
                          fontFamily: "Satoshi",
                          fontSize: 7.62,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class GeneralZFirstReply extends StatelessWidget {
  GeneralZFirstReply({Key? key, required this.words, required this.text})
      : super(key: key);
  String text;
  final Map<String, HighlightedWord> words;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Image.asset(
            "assets/images/generalz.webp",
            height: 39,
            width: 39,
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.only(left: 14, right: 14, top: 11, bottom: 11),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), color: themeClor),
            child: TextHighlight(
              text: text,
              words: words,
              textStyle: const TextStyle(
                  fontSize: 12,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Satoshi",
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
