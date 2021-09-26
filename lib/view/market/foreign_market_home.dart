import 'package:flutter/material.dart';

import '/app/app_locale.dart';
import '/setting/theme.dart';

class ForeignMarketHome extends StatefulWidget {
  const ForeignMarketHome({Key? key}) : super(key: key);

  @override
  createState() => _ForeignMarketHomeState();
}

class _ForeignMarketHomeState extends State<ForeignMarketHome> {
  final _searchString = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocale.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('|   '),
            Text('-3000 USD'),
            Text('   |   '),
            Text('0 EUR'),
            Text('   |   '),
            Expanded(
              child: TextField(
                controller: _searchString,
                decoration: InputDecoration(
                  hintText: locale.get(' search...'),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
            Text('   |'),
          ],
        ),
        SizedBox(height: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              child: Text('Товарные рынки'),
              onPressed: () {},
            ),
            SizedBox(width: 2),
            ElevatedButton(
              child: Text('Логистика'),
              onPressed: null,
            ),
            SizedBox(width: 2),
            ElevatedButton(
              child: Text('Экспедирование'),
              onPressed: null,
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(locale.get('IMPORT / EXPORT')),
        Expanded(
            child: ListView(
          children: [
            _Offer('Wheat', 213213, 123123),
            _Offer('Corn', 5465465, 44645654),
            _Offer('Soy', 2231, 3434),
          ],
        )),
        SizedBox(
          height: 55,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_up),
                  iconSize: 30,
                  onPressed: () {},
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: ElevatedButton(
                          child: Text(
                            locale.get('Create an offer\nand sell'),
                            textAlign: TextAlign.center,
                          ),
                          style: AppTheme.sellButtonStyle,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: ElevatedButton(
                          child: Text(
                            locale.get('Create an offer\nand buy'),
                            textAlign: TextAlign.center,
                          ),
                          style: AppTheme.buyButtonStyle,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Offer extends StatelessWidget {
  final String _commodity;
  final int _price1;
  final int _price2;
  const _Offer(this._commodity, this._price1, this._price2);

  @override
  build(context) {
    return ListTile(
      leading: ElevatedButton(
        child: Text('BUY'),
        style: AppTheme.buyButtonStyle,
        onPressed: () {},
      ),
      title: Text(
        _commodity,
        textAlign: TextAlign.center,
      ),
      subtitle: Text(
        _price1.toString() + ' / ' + _price2.toString(),
        textAlign: TextAlign.center,
      ),
      trailing: ElevatedButton(
        child: Text('SELL'),
        style: AppTheme.sellButtonStyle,
        onPressed: () {},
      ),
    );
  }
}
