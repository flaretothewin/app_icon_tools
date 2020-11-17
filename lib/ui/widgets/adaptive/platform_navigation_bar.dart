import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:platform_info/platform_info.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../models/constants/platforms_list.dart';
import '../../../models/setup_icon.dart';
import '../../../models/user_interface.dart';
import '../../platform_icons/icons_screen.dart';

class AdaptiveNavgationBar extends StatelessWidget {
  const AdaptiveNavgationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int selectedPlatform = context.select((SetupIcon icon) => icon.platformID);
    final int countdown = context.select((SetupIcon icon) => icon.countdown);
    final bool isSmallScreen = MediaQuery.of(context).size.width < (UserInterface.isApple ? 800 : 600);

    return Align(
      alignment: Alignment.bottomCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: UserInterface.isApple ? 860 : 500),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: (countdown > 0)
              ? _DoneInfo(countdown)
              : UserInterface.isApple
                  ? CupertinoSlidingSegmentedControl<int>(
                      onValueChanged: (int selectedPlatform) => context.read<SetupIcon>().setPlatform(selectedPlatform),
                      groupValue: selectedPlatform,
                      backgroundColor: CupertinoTheme.of(context).textTheme.textStyle.color?.withOpacity(0.04),
                      padding: const EdgeInsets.all(5),
                      children: {
                        for (IconPreview platform in platformList)
                          platformList.indexOf(platform): Tooltip(
                              message: '${S.of(context).operatingSystem} ${platform.name}',
                              child: isSmallScreen
                                  ? Icon(platform.icon)
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [Icon(platform.icon), const SizedBox(width: 5), Text(platform.name)]))
                      },
                    )
                  : ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: GNav(
                          onTabChange: (int selectedPlatform) =>
                              context.read<SetupIcon>().setPlatform(selectedPlatform),
                          gap: 4,
                          activeColor: Theme.of(context).sliderTheme.thumbColor,
                          iconSize: 24,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          tabBackgroundColor: Theme.of(context).buttonColor,
                          backgroundColor: Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.04),
                          selectedIndex: selectedPlatform,
                          tabs: [
                            for (IconPreview platform in platformList)
                              GButton(
                                  iconColor: Theme.of(context).sliderTheme.thumbColor?.withOpacity(0.6),
                                  // margin: const EdgeInsets.all(6),
                                  icon: platform.icon,
                                  text: isSmallScreen ? '' : platform.name),
                          ]),
                    ),
        ),
      ),
    );
  }
}

class _DoneInfo extends StatelessWidget {
  const _DoneInfo(this.countdown, {Key key}) : super(key: key);

  final int countdown;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            color: Colors.greenAccent.withOpacity(0.2),
            border: Border.all(color: Colors.greenAccent),
            borderRadius: BorderRadius.all(Radius.circular(UserInterface.isApple ? 10 : 20))),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: UserInterface.isApple ? 4 : 8, horizontal: 12),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 10),
                Text(platform.isMobile ? S.of(context).share : S.of(context).downloadsFolder),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                          backgroundColor: Colors.grey.withOpacity(0.25),
                          value: countdown / 100)),
                ),
              ],
            ),
          ),
        ),
      );
}
