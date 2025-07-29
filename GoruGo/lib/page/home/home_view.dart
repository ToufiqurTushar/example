import 'package:cowmaster/layouts/sizebox_widgets.dart';
import 'package:cowmaster/layouts/text_widgets.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import '../../layouts/custom_drawer.dart';
import '../../layouts/header_widget.dart';
import '../../layouts/tile.dart';
import '../bottom_nav/bottom_nav_logic.dart';
import '../profile/profile_view.dart';
import 'home_i18n.dart';
import 'home_logic.dart';
import 'nview/dashboard_item.dart';

class HomeView extends RapidView<HomeLogic> {
  static String routeName = "/home";

  const HomeView({super.key});

  @override
  void loadDependentLogics() {
    Get.lazyPut<HomeLogic>(() => HomeLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return HomeI18N.getTranslations();
  }

  @override
  Widget build(BuildContext context) {
    controller.scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        title: const Text("GoruGo"),
        actions: [
          InkWell(
            onTap: ()=>Get.toNamed(ProfileView.routeName),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.account_circle),
            ),
          )
        ],
      ),
      drawer: const AppDrawer(),
      onDrawerChanged: (bool isOpened){
        Get.find<BottomNavLogic>().isDrawerOpen = isOpened;
        Get.find<BottomNavLogic>().scaffoldKey = controller.scaffoldKey;
      },
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XXSmallSpacer(),
              HeaderWidget(
                title: "Number of Cows",
                headerTextcolor: Colors.black,
                isCentered: true,
                contentMargin: EdgeInsets.only(bottom: 8, left: 4, right: 4),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: CattleCard(controller.cattleInfo[0])),
                        SizedBox(width: 8,),
                        Expanded(child: CattleCard(controller.cattleInfo[1])),
                        SizedBox(width: 8,),
                        Expanded(child: CattleCard(controller.cattleInfo[2])),
                      ],
                    ),
                    XSmallSpacer(),
                    Row(
                      children: [
                        Expanded(flex:1, child: Container()),
                        Expanded(flex:2, child: CattleCard(controller.cattleInfo[3])),
                        SizedBox(width: 8,),
                        Expanded(flex:2, child: CattleCard(controller.cattleInfo[4])),
                        Expanded(flex:1, child: Container()),
                      ],
                    ),
                  ],
                ),
              ),
              SmallSpacer(),
              Row(
                children: [
                  Expanded(child: BorderedButton(context, "Disposed", (){})),
                  SizedBox(width: 8,),
                  Expanded(child: BorderedButton(context,"Dead", (){})),
                ],
              ),
              SmallSpacer(),
              HeaderWidget(
                title: "Summary",
                headerBackgroundColor: Color(0xff3e3f54),
                contentMargin: EdgeInsets.only(bottom: 8, left: 4, right: 4),
                isCentered: true,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(width:double.infinity, child: BlackBorderedButton(context,"Inseminated", () {})),
                            SizedBox(height: 8),
                            Container(width:double.infinity, child: BlackBorderedButton(context,"Fresh", () {})),
                            SizedBox(height: 8),
                            Container(width:double.infinity, child: BlackBorderedButton(context,"Open", () {})),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          children: [
                            SummaryCard(controller.summeryInfo[0]),
                            SizedBox(height: 8),
                            SummaryCard(controller.summeryInfo[1]),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          children: [
                            SummaryCard(controller.summeryInfo[2]),
                            SizedBox(height: 8),
                            SummaryCard(controller.summeryInfo[3]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              XSmallSpacer(),
              HeaderWidget(
                title: "Income/ Expenses",
                headerBackgroundColor: Color(0xff3e3f54),
                isCentered: true,
                contentMargin: EdgeInsets.only(bottom: 8, left: 4, right: 4),
                child: Row(
                  children: [
                    Expanded(child: IncomeCard("Incomes", "৳ 0.00", "Receivables: ৳ 0.00")),
                    Container(
                      width: 60,
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Row(
                        children: [
                          Expanded(child: Container(color: Colors.teal[200])),
                          Expanded(child: Container(color: Colors.pink[300])),
                        ],
                      ),
                    ),
                    Expanded(child: IncomeCard("Expenses", "৳ 0.00", "Debts: ৳ 0.00")),
                  ],
                ),
              ),
              XSmallSpacer(),
              HeaderWidget(
                title: "Events/ Notifications",
                headerBackgroundColor: Color(0xff3e3f54),
                isCentered: true,
                contentMargin: EdgeInsets.only(bottom: 8, left: 4, right: 4),
                child: Row(
                  children: [
                    Expanded(child: EventCard("Latest Events", "৳ 0.00", "Receivables: ৳ 0.00")),
                    SizedBox(width:  8),
                    Expanded(child: EventCard("Weekly Task", "৳ 0.00", "Debts: ৳ 0.00")),
                  ],
                ),
              ),
              XSmallSpacer(),
              HeaderWidget(
                title: "Milk (lt)",
                headerBackgroundColor: Color(0xff3e3f54),
                isCentered: true,
                contentMargin: EdgeInsets.only(bottom: 8, left: 4, right: 4),
                child: Row(
                  children: [
                    Expanded(child: EventCard("Annual DIM", "৳ 0.00", "Receivables: ৳ 0.00")),
                    SizedBox(width:  8),
                    Expanded(child: EventCard("Total Milk", "৳ 0.00", "Debts: ৳ 0.00")),
                  ],
                ),
              ),
              XSmallSpacer(),
              HeaderWidget(
                title: "Rations/ Stock",
                headerBackgroundColor: Color(0xff3e3f54),
                isCentered: true,
                contentMargin: EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(child: StockCard("Rations", Icons.grass)),
                    const SizedBox(width: 8),
                    Expanded(child: StockCard("Stock", Icons.inventory)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CattleCard(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: item['color'],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item['icon'], size: 30, color: Colors.black),
          SizedBox(height: 8),
          Text(item['label'], style: TextStyle(fontSize: 16)),
          SizedBox(height: 4),
          Text(item['count'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget BorderedButton(context, String label, VoidCallback? onTap) {
    return OutlinedButton(onPressed: onTap,style: OutlinedButton.styleFrom(
      side: BorderSide(color: Theme.of(context).focusColor, width: 1), // 👈 border color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // 👈 rounded corners
      ),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
    ), child: Text(label, style: TextStyle(color: Theme.of(context).focusColor),));
  }

  Widget BlackBorderedButton(context, String label, VoidCallback? onTap) {
    return OutlinedButton(onPressed: onTap,style: OutlinedButton.styleFrom(
      side: BorderSide(color: Colors.black, width: 1), // 👈 border color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // 👈 rounded corners
      ),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
    ), child: Text(label, style: TextStyle(color: Colors.black)));
  }

  Widget SummaryCard(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: item['color'],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 8),
      child: Row(
        children: [
          Icon(item['icon'], size: 22),
          SizedBox(width: 8),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${item['label']}", style: TextStyle(fontSize: 14)),
              Text("${item['count']}", style: TextStyle(fontSize: 14)),
            ],
          )),
        ],
      ),
    );
  }

  Widget IncomeCard(String title, String amount, String note) => Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.stacked_line_chart, color: Colors.teal[200], size: 20),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const Icon(Icons.chevron_right, size: 18, color: Colors.black45),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "৳0.00",
          style: TextStyle(
            color: Colors.teal[200],
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Receivables: ৳0.00",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  );

  Widget EventCard(String title, String amount, String note) => Container(
    width: 130,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black45),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_month, size: 18, color: Colors.black87),
            SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          "9",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        )
      ],
    ),
  );

  Widget StockCard(String title, IconData icon) => Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        Icon(icon, size: 30),
        const SizedBox(height: 5),
        Text(title, textAlign: TextAlign.center),
      ],
    ),
  );
}


