import 'package:flutter/material.dart';
import '../widgets/disappearing_bottom_navigation_bar.dart';
import '../models/data.dart' as data;
import '../models/models.dart';
import '../widgets/email_list_view.dart';
import 'animations.dart';
import 'transitions/list_detail_transition.dart';
import 'widgets/animated_floating_action_button.dart';
import 'widgets/disappearing_navigation_rail.dart';
import 'widgets/reply_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Responsiveness',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Feed(
        currentUser: data.user_0,
      ),
    );
  }
}

class Feed extends StatefulWidget {
  const Feed({super.key, required this.currentUser});

  final User currentUser;
  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with SingleTickerProviderStateMixin {
  late final _colorScheme = Theme.of(context).colorScheme;
  late final _backgroundColor = Color.alphaBlend(
      _colorScheme.primary.withOpacity(0.14), _colorScheme.surface);

  int selectedIndex = 0;
  bool controllerInitialized = false;

  late final _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 1250),
      value: 0,
      vsync: this);
  late final _railAnimation = RailAnimation(parent: _controller);
  late final _railFabAnimation = RailFabAnimation(parent: _controller);
  late final _barAnimation = BarAnimation(parent: _controller);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final double width = MediaQuery.of(context).size.width;

    final AnimationStatus status = _controller.status;
    if (width > 600) {
      if (status != AnimationStatus.forward &&
          status != AnimationStatus.completed) {
        _controller.forward();
      }
    } else {
      if (status != AnimationStatus.reverse &&
          status != AnimationStatus.dismissed) {
        _controller.reverse();
      }
    }
    if (!controllerInitialized) {
      controllerInitialized = true;
      _controller.value = width > 600 ? 1 : 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
            body: Row(
              children: [
                DisappearingNavigationRail(
                  railAnimation: _railAnimation,
                  railFabAnimation: _railFabAnimation,
                  backgroundColor: _backgroundColor,
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                Expanded(
                  child: ListDetailTransition(
                    animation: _railAnimation,
                    one: EmailListView(
                      selectedIndex: selectedIndex,
                      onSelected: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      currentUser: widget.currentUser,
                    ),
                    two: const ReplyListView(),
                  ),
                  
                ),
              ],
            ),
            floatingActionButton: AnimatedFloatingActionButton(
              animation: _barAnimation,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            bottomNavigationBar: DisappearingBottomNavigationBar(
              barAnimation: _barAnimation,
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ));
      },
    );
  }
}
