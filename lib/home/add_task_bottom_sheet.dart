import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskBottomSheet extends StatefulWidget {


  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDat = DateTime.now();
  var formkey = GlobalKey<FormState>();
  String title ='';
  String description ='';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.add_new_task,
          style: Theme.of(context).textTheme.titleMedium,),
          Form(
            key: formkey,
              child: Column(
            children: [
              TextFormField(
                onChanged : (text){
                  title = text;
                    },
                validator: (text) {
                  if(text == null || text.isEmpty){
                    return AppLocalizations.of(context)!.enter_task_title;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.enter_task_title,
                ),
              ),
              SizedBox(height: 12,),
              TextFormField(
                onChanged : (text){
                  description = text;
                },
                validator: (text) {
                  if(text == null || text.isEmpty){
                    return AppLocalizations.of(context)!.enter_task_description;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.enter_task_description,
                ),
                maxLines: 4,
              ),
              Text(AppLocalizations.of(context)!.selected_date,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.start,),
              SizedBox(height: 12,),
              TextButton(onPressed: (){
                showCalendar();
              },
                  child: Text('${selectedDat.year} / ${selectedDat.month}/ ${selectedDat.day}',
                    // use dateformat
                    style: Theme.of(context).textTheme.titleMedium,))
                ,
              ElevatedButton(onPressed: (){
                  addTask();
              },
                  child: Text(AppLocalizations.of(context)!.add),
              )
            ],
          ))
        ],
      ),
    );
  }

  void showCalendar() async {
    var chosenDate = await showDatePicker(
        //locale: 'ar',
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days:1095)));
    selectedDat = chosenDate ?? selectedDat;
    // if (chosenDate != null){
    //   selectedDat = chosenDate ;
    // } // this is alternative solution.
    setState(() {

    });
  }

  void addTask() {
    if(formkey.currentState?.validate() == true){
      /// add task to DB
    }
  }
}
