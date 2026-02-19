<#import "bamboozle-layout.ftl" as bz>
<@bz.layout>

  <h1>${msg("registerTitle")}</h1>
  <p class="subtitle">Create your Bamboozle account</p>

  <#if message?has_content>
    <div class="alert alert-${message.type}">${kcSanitize(message.summary)?no_esc}</div>
  </#if>

  <form action="${url.registrationAction}" method="post">

    <#if !realm.registrationEmailAsUsername>
      <div class="form-group">
        <label for="username">${msg("username")}</label>
        <input id="username" name="username" type="text"
          value="${(register.formData.username!'')}" autocomplete="username" />
      </div>
    </#if>

    <div class="form-group">
      <label for="firstName">${msg("firstName")}</label>
      <input id="firstName" name="firstName" type="text"
        value="${(register.formData.firstName!'')}" />
    </div>

    <div class="form-group">
      <label for="lastName">${msg("lastName")}</label>
      <input id="lastName" name="lastName" type="text"
        value="${(register.formData.lastName!'')}" />
    </div>

    <div class="form-group">
      <label for="email">${msg("email")}</label>
      <input id="email" name="email" type="email"
        value="${(register.formData.email!'')}" autocomplete="email" />
    </div>

    <#if passwordRequired??>
      <div class="form-group">
        <label for="password">${msg("password")}</label>
        <div class="password-wrapper">
          <input id="password" name="password" type="password" autocomplete="new-password" />
          <button type="button" class="password-toggle"
            onclick="var p=document.getElementById('password');p.type=p.type==='password'?'text':'password'">&#128065;</button>
        </div>
      </div>

      <div class="form-group">
        <label for="password-confirm">${msg("passwordConfirm")}</label>
        <div class="password-wrapper">
          <input id="password-confirm" name="password-confirm" type="password" autocomplete="new-password" />
          <button type="button" class="password-toggle"
            onclick="var p=document.getElementById('password-confirm');p.type=p.type==='password'?'text':'password'">&#128065;</button>
        </div>
      </div>
    </#if>

    <button id="kc-login" type="submit">${msg("doRegister")}</button>

  </form>

  <div id="kc-registration">
    <a href="${url.loginUrl}">Back to Login</a>
  </div>

</@bz.layout>
