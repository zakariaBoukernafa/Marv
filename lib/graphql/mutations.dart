// ignore: constant_identifier_names
const String SIGNIN_MUTATION = r'''
  mutation SIGNIN_MUTATION($email: String!, $password: String!) {
    authenticateUserWithPassword(email: $email, password: $password) {
      ... on UserAuthenticationWithPasswordSuccess {
      sessionToken
        item {
          id
          name
          email
        }
      }
      ... on UserAuthenticationWithPasswordFailure {
        code
        message
      }
    }
  }
''';

// ignore: constant_identifier_names
const String SIGNUP_MUTATION = r'''
  mutation SIGNUP_MUTATION(
    $email: String!
    $name: String!
    $password: String!
  ) {
    createUser(data: { email: $email, name: $name, password: $password }) {
      id
      name
      email
    }
  }
''';

// ignore: constant_identifier_names
const ADD_TO_CART_MUTATION = r'''
  mutation ADD_TO_CART_MUTATION($id: ID!) {
    addToCart(productId: $id) {
      id
    }
  }
''';

// ignore: constant_identifier_names
const DELETE_PRODUCT_FROM_CART = r'''
  mutation DELETE_PRODUCT_FROM_CART($id: ID!) {
    deleteCartItem(id: $id) {
      id
    }
  }
''';

// ignore: constant_identifier_names
const CREATE_ORDER_MUTATION = r'''
 mutation CREATE_ORDER_MUTATION($token: String!) {
    checkout(token: $token) {
      id
      charge
      total
      items {
        id
        name
      }
    }
  }
''';

// ignore: constant_identifier_names, unnecessary_raw_strings
const SIGNOUT_MUTATION = r'''
  mutation SIGNOUT_MUTATION {
    endSession
  }
''';
