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
  List<String> list = [];

  fetch() async {
    var result = await RmrkGraphQlClient()
        .client
        .query(graphql.QueryOptions(document: graphql.gql(NEWLY_MINTED_NFTS)));

    var images = result.data!["get_newly_listed"]
        .map((e) => e["metadata_image"].toString())
        .toList();

    setState(() {
      list = processIpfs(List<String>.from(images));
    });
  }

//a really hacky workaround to handle ipfs images
  processIpfs(List<String> ipfsLinks) {
    var cids = ipfsLinks.map((e) => e.substring(12)).toList();
    var httpsLinks = cids.map((e) => "https://$e.ipfs.dweb.link").toList();
    return httpsLinks;
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
                child:
                    SingleChildScrollView(
                      child: Column(children: [...list.map((i) => Container(
                          padding: EdgeInsets.all(16),
                          child: Image.network(i)))]),
                    ))));
  }
}
