<#import "bamboozle-layout.ftl" as bz>
<@bz.layout>

  <h1>Mobile Authenticator Setup</h1>

  <ol>
    <li>${msg("loginTotpStep1")}</li>
    <li>${msg("loginTotpStep2")}</li>
    <li>${msg("loginTotpStep3")}</li>
  </ol>

  <#if mode?? && mode = "manual">
    <p><strong>${msg("loginTotpManualStep3")}</strong></p>
    <p>${totp.totpSecretEncoded}</p>
    <a href="${totp.qrUrl}">${msg("loginTotpScanBarcode")}</a>
  <#else>
    <img src="data:image/png;base64,${totp.totpSecretQrCode}" alt="QR Code"/>
    <a href="${totp.manualUrl}">${msg("loginTotpUnableToScan")}</a>
  </#if>

  <form action="${url.loginAction}" method="post">
    <div class="form-group">
      <label for="totp">${msg("authenticatorCode")}</label>
      <input id="totp" name="totp" type="text" autocomplete="off" />
    </div>
    <div class="form-group">
      <label for="userLabel">${msg("loginTotpDeviceName")}</label>
      <input id="userLabel" name="userLabel" type="text" />
    </div>
    <input type="hidden" name="credentialId" value="${credentialId!''}"/>
    <button type="submit">${msg("doSubmit")}</button>
    <a href="${url.loginUrl}">${msg("doCancel")}</a>
  </form>

</@bz.layout>
