Core application support Traco project with REST API standart convention

Modified Jan 5, 2013 :

                       
Android  ------> token ------- server --------> Generate Tracore token (User model) 
                                      --------> Store Provider token   (Authentification model) 
                                  


* just provide one credential for one provider
* token move to user model so can easily and faster access token directly
* available using token for next plan integrate with OAuth security plugin
* there are 2 token types => 
    1. Token from Tracore (exist in user model) specific for one user.
    2. Token provider (fill when connect with 3rd party.    e.g 'facebook, twitter') will be stored in "authentification".
    3. If "user" account already exist , will not create anymore just only update for several field needed.
    4. If "authentification" already exist , application not create anymore for another one.
    5. Registration just passing one parameter "token" from mobile facebook token .
    6. Access Token take from android Facebook SDK.
    7. Not used authorization from WebView login but still being keep for preparation if want to use access from web client.

