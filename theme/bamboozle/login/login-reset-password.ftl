<#import "bamboozle-layout.ftl" as bz>
<@bz.layout>

  <h1>${msg("emailForgotTitle")}</h1>
  <p class="subtitle">${msg("emailInstruction")}</p>

  <#if message?has_content>
    <div class="alert alert-${message.type}">${kcSanitize(message.summary)?no_esc}</div>
  </#if>

  <form action="${url.loginAction}" method="post">

    <div class="form-group">
      <label for="username">
        <#if !realm.loginWithEmailAllowed>${msg("username")}
        <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
        <#else>${msg("email")}
        </#if>
      </label>
      <input id="username" name="username" type="text"
        value="${(auth.attemptedUsername!'')}" autofocus autocomplete="username" />
    </div>

    <button id="kc-login" type="submit">${msg("doSubmit")}</button>

  </form>

  <div id="kc-registration">
    <a href="${url.loginUrl}">Back to Login</a>
  </div>

</@bz.layout>
