# Authentication flow

Here is the basic flow for authenticating a user. 

## Terminology

**Diziet**
: This app.

**Vulgarian**
: The main (Masqt-controlled) server that handles authentication.

**Firebase**
:
[Firebase](https://firebase.google.com),
Google's cloud platform. We use Firebase Cloud Messaging to sync users'
SMS messages.

**Twilio**
: [Twilio](https://twilio.com) Our telephony provider.
It also uses Firebase Cloud Messaging to send incoming call invites 
to devices, but uses its own authentication scheme.

## Authenticating from scratch

Here's how things work when the user starts the app and isn't
logged in. (This because they've never run the app before, or
they've logged out, or they have an expired authentication token.)

1.  The user enters a username/password pair into a form and hits
    the submit button. Diziet sends this information to Vulgarian.
1.  Vulgarian checks the username and password and retrieves
    an authentication token. It sends the token back to Diziet
    in the response.
1.  Diziet, using the authentication token, requests a Firebase token
    from Vulgarian.
1.  Vulgarian identifies the user by their authentication token,
    acquires a Firebase token from Firebase, and sends the Firebase token
    back in the response to Diziet.
1.  Diziet uses the Firebase token to authenticate on Firebase.
1.  Diziet, using the authentication token, requests a Twilio token
    from Vulgarian.
1.  Vulgarian identifies the user by their authentication token,
    acquires a Twilio token, and sends this back to Diziet.
1.  Diziet, using the Twilio token, registers on Firebase to
    receive incoming call invites.
    
## Start-up when we already have a Vulgarian authentication token

Things work almost the same as authenticating from scratch, but
if we already have an authentication token for Vulgarian, we
can skip to step 3.

## Token expiry

TODO
