import 'dart:async';

import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/service/AiService.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../theme/themeProvider.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    talkToMark();
  }

  talkToMark() {
    MarkAI mark = MarkAI();
    _chat = mark.talkToMark();
    setState(() {});
  }

  final ScrollController _scrollController = ScrollController();
  // late final GenerativeModel _model;
  // late final GenerativeModel _functionCallModel;
  late final ChatSession _chat;
  final List<({String? text, bool fromUser})> _generatedContent =
      <({String? text, bool fromUser})>[
    (
      text:
          "Hello there! 👋 \nI'm Mark, Aviral's AI Personal Assistant.\nI'm here to assist and share insights into his expertise!",
      fromUser: false
    )
  ];
  // List<Content> _message = [
  //   Content.text(
  //       "Hello there! 👋 \nI'm Mark, Aviral's AI Personal Assistant.\nI'm here to assist and share insights into his expertise!")
  // ];

  final TextEditingController _textController = TextEditingController();

  void _showError(String message) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  bool _loading = false;
  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });

    try {
      _generatedContent.add((text: message, fromUser: true));
      var response = await _chat.sendMessage(
        Content.text(message),
      );
      var text = response.text;
      _generatedContent.add((text: text, fromUser: false));

      if (text == null) {
        _showError('No response from API.');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  final FocusNode _textFieldFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: darkthemeColor,
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
            border: Border.all(
          color: Provider.of<ThemeProvider>(context).getThemeColor,
        )),
        child: Column(
          children: [
            const AIAppBar(),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: const Offset(-2, -2),
                        color: Provider.of<ThemeProvider>(context)
                            .getThemeColor
                            .withOpacity(.5)),
                    BoxShadow(
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                        color: Provider.of<ThemeProvider>(context)
                            .getThemeColor
                            .withOpacity(.5))
                  ],
                  color: const Color.fromARGB(255, 35, 35, 35),
                  border: Border.all(
                      width: .5,
                      color:
                          Provider.of<ThemeProvider>(context).getThemeColor)),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width > mobileSize
                      ? 800
                      : MediaQuery.sizeOf(context).width),
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _generatedContent.length,
                  itemBuilder: (context, index) {
                    var content = _generatedContent[index];
                    return MessageWidget(
                      text: content.text.toString(),
                      isFromUser: content.fromUser,
                    );
                  }),
            )),
            TextFormField(
              focusNode: _textFieldFocus,
              controller: _textController,
              cursorColor: Colors.white,
              onFieldSubmitted: (value) {
                _sendChatMessage(value);
              },
              decoration: InputDecoration(
                suffixIcon: (!_loading)
                    ? InkWell(
                        onTap: () {
                          _sendChatMessage(_textController.text);
                        },
                        child: Icon(
                          Icons.send,
                          color:
                              Provider.of<ThemeProvider>(context).getThemeColor,
                        ),
                      )
                    : SizedBox(
                        height: 30,
                        width: 30,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Provider.of<ThemeProvider>(context)
                                .getThemeColor,
                          ),
                        ),
                      ),
                contentPadding: const EdgeInsets.all(15),
                filled: true, // Enables the filled color
                fillColor: Colors.black, // Background color

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  borderSide: BorderSide(
                    color: Provider.of<ThemeProvider>(context)
                        .getThemeColor, // Border color
                    width: 1.0, // Border thickness
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Provider.of<ThemeProvider>(context)
                        .getThemeColor, // Border color
                    width: 1.0, // Border thickness
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Provider.of<ThemeProvider>(context)
                        .getThemeColor, // Border colorBorder color
                    width: 1.0, // Border thickness
                  ),
                ),
                hintText: 'Ask Mark ...', // Optional label
                hintStyle: GoogleFonts.roboto(
                    color: const Color.fromARGB(
                        207, 229, 228, 228)), // Label text color
              ),
              style: GoogleFonts.roboto(
                  color: Colors.white), // Text color inside the field
            ),
          ],
        ),
      ),
    );
  }
}

class AIAppBar extends StatelessWidget {
  const AIAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: darkthemeColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              offset: const Offset(-2, -2),
                              color: Provider.of<ThemeProvider>(context)
                                  .getThemeColor
                                  .withOpacity(.5)),
                          BoxShadow(
                              blurRadius: 4,
                              offset: const Offset(2, 2),
                              color: Provider.of<ThemeProvider>(context)
                                  .getThemeColor
                                  .withOpacity(.5))
                        ],
                        border: Border.all(
                            color: Provider.of<ThemeProvider>(context)
                                .getThemeColor),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Image.asset("assets/images/mark.webp")),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mark",
                      style: GoogleFonts.orbitron(
                        fontSize: 22,
                        color:
                            Provider.of<ThemeProvider>(context).getThemeColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text("Aviral's Personal Assistant",
                        style: GoogleFonts.gruppo(
                          fontSize: 8,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class MessageWidget extends StatefulWidget {
  final String text;
  final bool isFromUser;

  const MessageWidget({
    super.key,
    required this.text,
    required this.isFromUser,
  });

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return !widget.isFromUser
        ? Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              offset: const Offset(-2, -2),
                              color: Provider.of<ThemeProvider>(context)
                                  .getThemeColor
                                  .withOpacity(.5)),
                          BoxShadow(
                              blurRadius: 4,
                              offset: const Offset(2, 2),
                              color: Provider.of<ThemeProvider>(context)
                                  .getThemeColor
                                  .withOpacity(.5))
                        ],
                        color: darkthemeColor,
                        border: Border.all(
                            color: Provider.of<ThemeProvider>(context)
                                .getThemeColor),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Image.asset("assets/images/mark.webp")),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 12, top: 12),
                      constraints: BoxConstraints(
                          maxWidth:
                              MediaQuery.sizeOf(context).width > mobileSize
                                  ? 680
                                  : MediaQuery.sizeOf(context).width - 105),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 41, 41, 41)),
                      child: MarkdownBody(
                        data: widget.text,
                        styleSheet:
                            MarkdownStyleSheet.fromTheme(Theme.of(context))
                                .copyWith(
                          listBullet: const TextStyle(color: Colors.white),
                          p: const TextStyle(
                              color:
                                  Colors.white), // Change paragraph text color
                          h1: const TextStyle(
                              color:
                                  Colors.white), // Change heading 1 text color
                          a: const TextStyle(
                              color: Colors.white), // Change link text color
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 12, top: 12),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width > mobileSize
                            ? 720
                            : MediaQuery.sizeOf(context).width - 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 77, 76, 76)),
                    child: Text(widget.text,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                )),
          );
  }
}
