import 'package:flutter/material.dart';
import 'package:singular_app/graphql/queries/newly_minted_nfts.dart';
import 'package:singular_app/graphql/rmrk_graphql_client.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;

class NftList extends StatefulWidget {
  const NftList({Key? key}) : super(key: key);

  @override
  _NftListState createState() => _NftListState();
}

class _NftListState extends State<NftList> {
  String list = "";

  fetch() async {
    var result = await RmrkGraphQlClient()
        .client
        .query(graphql.QueryOptions(document: graphql.gql(NEWLY_MINTED_NFTS)));

    print(result.data.toString());
    setState(() {
      list = result.data.toString();
    });
  }

  @override
  initState() {
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: Text(list),
    )));
  }
}
