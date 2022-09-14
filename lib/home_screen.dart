import 'package:flutter/material.dart';
import 'package:mailapp/data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    MySize = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: kPadding),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Mail',
                    style: TextStyle(fontSize: kPadding - 2),
                  ),
                ),
                SizedBox(
                  height: kPadding - 15,
                ),
                Divider(
                  height: 2,
                  color: Colors.black54,
                ),
                SizedBox(
                  height: kPadding - 10,
                ),
                buildDrawerItem(Icons.inbox, 'All Inbox', 0),
                SizedBox(
                  height: kPadding - 15,
                ),
                Divider(
                  height: 2,
                  color: Colors.black54,
                ),
                buildDrawerItem(Icons.email_outlined, 'Primary', 1),
                buildDrawerItem(Icons.person, 'Social', 2),
                buildDrawerItem(Icons.tag, 'Promotion', 3),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'All Labels',
                    style: TextStyle(
                        fontSize: kPadding - 5, fontWeight: FontWeight.w600),
                  ),
                ),
                buildDrawerItem(Icons.star_rate_outlined, 'Starred', 4),
                buildDrawerItem(Icons.history_toggle_off, 'Snoozed', 5),
                buildDrawerItem(Icons.drafts, 'Draft', 6),
                buildDrawerItem(Icons.bug_report_outlined, 'spam', 7),
                buildDrawerItem(Icons.delete, 'Bin', 8),
                buildDrawerItem(Icons.send, 'send', 9),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'All Labels',
                    style: TextStyle(
                        fontSize: kPadding - 5, fontWeight: FontWeight.w600),
                  ),
                ),
                buildDrawerItem(Icons.calendar_today, 'Calendar', 10),
                buildDrawerItem(Icons.contacts, 'Contact', 11),
                buildDrawerItem(Icons.settings, 'settings', 12),
                buildDrawerItem(Icons.help_outline, 'Help and Feedback', 13),
                buildDrawerItem(Icons.help_outline, 'Help and Feedback', 14),
                buildDrawerItem(Icons.help_outline, 'Help and Feedback', 15),
                buildDrawerItem(Icons.help_outline, 'Help and Feedback', 16),
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

  Widget buildDrawerItem(IconData icon, String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = index;
        });
      },
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: kPadding, vertical: kPadding - 10),
        margin: EdgeInsets.only(right: kPadding),
        decoration: BoxDecoration(
          color: index == _selectedItem ? Colors.blue.withOpacity(0.2) : null,
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
            ),
            SizedBox(
              width: kPadding,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
          ],
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
