// ignore: constant_identifier_names, unnecessary_raw_strings
const String CURRENT_USER_QUERY = r'''
  query {
    authenticatedItem {
      ... on User {
        id
        name
        email
        cart {
          id
          quantity
          product {
            id
            price
            name
            description
            photo {
              image {
                publicUrlTransformed
              }
            }
          }
        }
      }
    }
  }
''';

// ignore: constant_identifier_names
const String ALL_PRODUCTS_QUERY = r'''
   query ALL_PRODUCTS_QUERY($skip: Int = 0, $first: Int) {
    allProducts(first: $first, skip: $skip) {
      id
      name
      price
      description
      photo {
        id
        image {
          publicUrlTransformed
        }
      }
    }
  }
''';

// ignore: constant_identifier_names
const SEARCH_PRODUCTS_QUERY = r'''
query SEARCH_PRODUCTS_QUERY($searchTerm: String!) {
    searchTerms: allProducts(
      where: {
        OR: [
          { name_contains_i: $searchTerm }
          { description_contains_i: $searchTerm }
        ]
      }
    ) {
      id
      name
      description
      photo {
        image {
          publicUrlTransformed
        }
      }
    }
  }
  
''';

// ignore: constant_identifier_names
const SINGLE_ITEM_QUERY  = r'''
 query SINGLE_ITEM_QUERY($id: ID!) {
    Product(where: { id: $id }) {
      id
      name
      description
      price
      photo {
        altText
        image {
          publicUrlTransformed
        }
      }
    }
  }
''';

// ignore: constant_identifier_names, unnecessary_raw_strings
const USER_ORDERS_QUERY   = r'''
  query USER_ORDERS_QUERY {
      allOrders {
        id
        charge
        total
        user {
        id
      }
      items {
        id
        name
        description
        price
        quantity
        photo {
          image {
            publicUrlTransformed
          }
        }
      }
    }
  }
''';