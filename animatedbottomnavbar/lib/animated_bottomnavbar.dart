import 'package:flutter/material.dart';

class AnimatedBottomNavBar extends StatefulWidget {
  final List<NavItem> navItems;
  final Duration animationDuration;
  final Function onBarTap;

  AnimatedBottomNavBar(
      {this.animationDuration = const Duration(milliseconds: 1000),
      this.navItems,
      this.onBarTap});

  @override
  _AnimatedBottomNavBarState createState() => _AnimatedBottomNavBarState();
}

class _AnimatedBottomNavBarState extends State<AnimatedBottomNavBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 20, top: 20, left: 16, right: 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildNavItems(),
        ),
      ),
    );
  }

  List<Widget> _buildNavItems() {
    List<Widget> _navItems = List();
    for (int i = 0; i < widget.navItems.length; i++) {
      NavItem item = widget.navItems[i];
      bool isSelected = selectedBarIndex == i;
      _navItems.add(InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedBarIndex = i;
            widget.onBarTap(selectedBarIndex);
          });
        },
        child: AnimatedContainer(
          duration: widget.animationDuration,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color:
                isSelected ? item.color.withOpacity(0.4) : Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Row(
            children: [
              Icon(
                item.icon,
                color: isSelected ? item.color : Colors.black54,
                size: 30,
              ),
              SizedBox(width: 5),
              AnimatedSize(
                vsync: this,
                curve: Curves.easeIn,
                duration: widget.animationDuration,
                child: Text(
                  isSelected ? item.text : "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: item.color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return _navItems;
  }
}

class NavItem {
  Color color;
  String text;
  IconData icon;

  NavItem({
    this.color,
    this.text,
    this.icon,
  });
}

final List<NavItem> navItems = [
  NavItem(
    text: "Home",
    icon: Icons.home,
    color: Color.fromRGBO(251, 86, 7, 1),
  ),
  NavItem(
    text: "Accounts",
    icon: Icons.account_balance,
    color: Color.fromRGBO(255, 0, 110, 1),
  ),
  NavItem(
    text: "Payments",
    icon: Icons.payment,
    color: Color.fromRGBO(131, 56, 236, 1),
  ),
  NavItem(
    text: "Profile",
    icon: Icons.person_outline,
    color: Color.fromRGBO(58, 134, 255, 1),
  ),
];
