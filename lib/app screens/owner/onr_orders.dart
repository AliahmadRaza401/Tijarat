// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tijarat/api/api.dart';
import 'package:tijarat/model/allpostList.dart';
import 'package:tijarat/services/sp_services.dart';
import 'package:tijarat/utils/dynamic_sizes.dart';

class OwnerOrders extends StatefulWidget {
  const OwnerOrders({Key? key}) : super(key: key);

  @override
  _OwnerOrdersState createState() => _OwnerOrdersState();
}

class _OwnerOrdersState extends State<OwnerOrders> {
  List<GetAllPostModel> allpost = [];
  bool loading = true;

  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };

  Future<List<GetAllPostModel>> getRequest() async {
    print("fetching Post");
    final response =
        await http.get(Uri.parse(API.getPostList), headers: headers);

    var responseData = json.decode(response.body);
    print('responseData: $responseData');
    for (var data in responseData['data']['data']) {
      GetAllPostModel item = GetAllPostModel(
        id: data['id'],
        categoryId: data['category_id'],
        productId: data['product_id'],
        userId: data['user_id'],
        price: data['price'],
        unit: data['unit'],
        image: data['image'],
        description: data['description'],
        address: data['address'],
        specialOffer: data['special_offer'],
        createdAt: DateTime.parse(data['created_at']),
        updatedAt: DateTime.parse(data['updated_at']),
      );

      //Adding user to the list.
      setState(() {
        allpost.add(item);
        loading = false;
      });
    }
    return allpost;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  var token = '';

  getData() async {
    token = await SpServices.getUserToken();
    await getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("All Post"),
          leading: Icon(
            Icons.get_app,
          ),
        ),
        body: Container(
          height: CustomSizes().dynamicHeight(context, 1),
          padding: EdgeInsets.all(16.0),
          child: loading
              ? CircularProgressIndicator()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: allpost.length,
                  itemBuilder: (ctx, index) => ListTile(
                    title: Text(allpost[index].unit),
                    subtitle: Text(allpost[index].price),
                    contentPadding: EdgeInsets.only(bottom: 20.0),
                  ),
                ),
        ),
      ),
    );
  }
}
