<#import "bamboozle-layout.ftl" as bz>
<@bz.layout>

  <h1>Welcome back</h1>
  <p class="subtitle">Sign in to your Bamboozle account</p>

  <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
    <div class="alert alert-${message.type}">${kcSanitize(message.summary)?no_esc}</div>
  </#if>

  <form id="kc-form-login" action="${url.loginAction}" method="post">

    <#if !usernameHidden??>
      <div class="form-group">
        <label for="username">
          <#if !realm.loginWithEmailAllowed>${msg("username")}
          <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
          <#else>${msg("email")}
          </#if>
        </label>
        <input id="username" name="username" type="text"
          value="${(login.username!'')}" autofocus autocomplete="username" />
      </div>
    </#if>

    <div class="form-group">
      <label for="password">${msg("password")}</label>
      <div class="password-wrapper">
        <input id="password" name="password" type="password" autocomplete="current-password" />
        <button type="button" class="password-toggle"
          onclick="var p=document.getElementById('password');p.type=p.type==='password'?'text':'password'">&#128065;</button>
      </div>
    </div>

    <div class="form-options">
      <#if realm.rememberMe && !usernameHidden??>
        <label>
          <input type="checkbox" name="rememberMe" <#if login.rememberMe??>checked</#if>>
          ${msg("rememberMe")}
        </label>
      <#else>
        <span></span>
      </#if>
      <#if realm.resetPasswordAllowed>
        <a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
      </#if>
    </div>

    <input type="hidden" name="credentialId"
      <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if> />

    <button id="kc-login" type="submit">${msg("doLogIn")}</button>

  </form>

  <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
    <div id="kc-registration">
      ${msg("noAccount")} <a href="${url.registrationUrl}">${msg("doRegister")}</a>
    </div>
  </#if>

</@bz.layout>
