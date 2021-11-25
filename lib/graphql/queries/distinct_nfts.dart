String distinct = """
query PaginatedDistinctNftQuery(
    \$where: distinct_nfts_bool_exp!
    \$orderBy: [distinct_nfts_order_by!]
    \$limit: Int!
    \$offset: Int!
  ) {
    distinct_nfts(where: \$where, order_by: \$orderBy, limit: \$limit, offset: \$offset) {
      ...DISTINCT_NFT
    }
    distinct_nfts_aggregate(where: \$where) {
      aggregate {
        count
      }
    }
  }
  
  fragment DISTINCT_NFT on distinct_nfts {
    id
    block
    burned
    forsale
    collectionId
    instance
    metadata
    metadata_name
    metadata_content_type
    metadata_image
    metadata_animation_url
    name
    owner
    sn
    transferable
    collection {
      max
      name
      issuer
      singular_nsfw_collections {
        created_at
        reason
      }
      singular_verified_collections {
        collection_id
      }
    }
    singular_curated {
      created_at
    }
    singular_nsfw {
      created_at
      reason
    }
  }
""";
