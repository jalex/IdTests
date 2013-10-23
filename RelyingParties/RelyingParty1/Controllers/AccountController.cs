using System;
using System.IdentityModel.Services;
using System.Web.Mvc;

namespace RelyingParty1.Controllers {

    public class AccountController: Controller {

        public ActionResult Login() {
            var authModule = FederatedAuthentication.WSFederationAuthenticationModule;
            var signInRequestMessage = authModule.CreateSignInRequest(null, null, false);

            return Redirect(signInRequestMessage.RequestUrl);
        }

        public ActionResult Logout() {
            var authModule = FederatedAuthentication.WSFederationAuthenticationModule;
            authModule.SignOut(false);
            var signOutRequestMessage = new SignOutRequestMessage(new Uri(authModule.Issuer), authModule.Realm); // initiate federated sign out request to the STS
            var redirectUrl = signOutRequestMessage.WriteQueryString();
            return Redirect(redirectUrl);
        }

    }
}
