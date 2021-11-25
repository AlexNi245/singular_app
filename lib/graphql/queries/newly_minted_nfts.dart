String NEWLY_MINTED_NFTS = """fragment NFT on nfts {
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
  metadata_description
  name
  owner
  sn
  transferable
  collection {
    max
    name
    issuer
    metadata
    singular_nsfw_collections {
      created_at
      reason
      __typename
    }
    singular_verified_collections {
      collection_id
      __typename
    }
    __typename
  }
  singular_curated {
    created_at
    __typename
  }
  singular_nsfw {
    created_at
    reason
    __typename
  }
  __typename
}

query NewlyListedNfts {
  get_newly_listed(
    where: {burned: {_eq: ""}, _and: [{collection: {_not: {singular_nsfw_collections: {}}}}, {collection: {_not: {singular_hidden_collections: {}}}}, {collection: {_not: {singular_blacklisted_accounts: {}}}}, {collection: {singular_verified_collections: {}}}, {_not: {singular_nsfw: {}}}, {_not: {singular_hidden: {}}}]}
    limit: 12
  ) {
    ...NFT
    __typename
  }
}
""";
