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
