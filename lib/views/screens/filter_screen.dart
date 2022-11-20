import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app/controllers/filter_controller.dart';
import 'package:traveling_app/views/widgets/my_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const screenRoute = '/filters';

  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("فلترة"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: Provider.of<FilterController>(context).filters['summer']!,
            onChanged: (value) {
              Provider.of<FilterController>(context, listen: false)
                  .currentFilter("summer");
              Provider.of<FilterController>(context, listen: false).changeFilter();
            },
            title: Text('الرحلات الصيفية فقط'),
            subtitle: Text(
              'إظهار الرحلات في فصل الصيف فقط',
            ),
          ),
          SwitchListTile(
            value: Provider.of<FilterController>(context).filters['winter']!,
            onChanged: (value) {
              Provider.of<FilterController>(context, listen: false)
                  .currentFilter("winter");
              Provider.of<FilterController>(context, listen: false).changeFilter();
            },
            title: Text('الرحلات الشتوية فقط'),
            subtitle: Text(
              'إظهار الرحلات في فصل الشتاء فقط',
            ),
          ),
          SwitchListTile(
            value: Provider.of<FilterController>(context).filters['family']!,
            onChanged: (value) {
              Provider.of<FilterController>(context, listen: false)
                  .currentFilter("family");
              Provider.of<FilterController>(context, listen: false).changeFilter();
            },
            title: Text('للعائلات'),
            subtitle: Text(
              'إظهار الرحلات التي للعائلات فقط',
            ),
          )
        ],
      ),
    );
  }
}
