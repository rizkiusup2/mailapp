import 'package:flutter/material.dart';
import 'package:mailapp/data.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    MySize = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Mail',
                  style: TextStyle(fontSize: kPadding - 2),
                ),
                SizedBox(
                  height: kPadding - 15,
                ),
                Divider(
                  height: 6,
                ),
                SizedBox(
                  height: kPadding - 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.inbox,
                      size: 24,
                    ),
                    SizedBox(
                      width: kPadding - 15,
                    ),
                    Text(
                      'All inbox',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: kPadding - 15,
              ),
              //-----header
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.black26,
                      offset: Offset(2, 0),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 24,
                        color: Colors.black54,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search Here',
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            isDense: false,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Image.asset('assets/images/boy.png'),
                      ),
                    ),
                    SizedBox(
                      width: kPadding - 15,
                    ),
                  ],
                ),
              ),
              SizedBox(height: kPadding - 10),
              //-----Heading Title
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Primary Mails',
                  style: TextStyle(
                    fontSize: 18,
                    wordSpacing: 4,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(height: kPadding - 10),
              //-----Content/Mails
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: mailList.length,
                  itemBuilder: (context, index) {
                    return MailItemWidget(
                        title: mailList[index].title,
                        description: mailList[index].description,
                        content: mailList[index].content,
                        isRead: mailList[index].isRead,
                        time: mailList[index].time);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MailItemWidget extends StatelessWidget {
  const MailItemWidget({
    required this.title,
    required this.description,
    required this.content,
    required this.isRead,
    required this.time,
    Key? key,
  }) : super(key: key);
  final String title, description, content, time;
  final bool isRead;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: kPadding - 14),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black26,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Expanded(
        flex: 1,
        child: Row(
          children: [
            CircleAvatar(child: Text(title.substring(0, 1))),
            SizedBox(width: kPadding - 12),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                                  isRead ? FontWeight.w600 : FontWeight.w400),
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    content,
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
