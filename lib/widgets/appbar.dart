import 'package:flutter/material.dart';
import 'package:tasksapp/blocs/bloc_exports.dart';
import 'package:tasksapp/blocs/dark_mode_bloc/dark_mode_bloc.dart';

import '../utilities/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeBloc, DarkModeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: state.switchValue ? kprimaryColor : kwhiteColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Builder(builder: (context) {
                  return InkWell(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: Image.asset(
                      'assets/images/menus.png',
                      height: 37,
                      width: 37,
                      color: state.switchValue ? kwhiteColor : kprimaryColor,
                      fit: BoxFit.cover,
                    ),
                  );
                }),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
