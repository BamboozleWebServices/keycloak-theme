<#macro layout>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${msg("loginTitle",(realm.displayName!''))}</title>
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>
  <div id="kc-left-panel">
    <img class="logo" src="${url.resourcesPath}/img/logo-white.svg" alt="Bamboozle">

    <div id="kc-news">
      <h2>What's new</h2>

      <div class="news-item">
        <span class="news-date">Feb 2026</span>
        <strong>OSIE Portal Launch</strong>
        <p>Self-service cloud management is now live across Dubai, Fujairah and Vienna.</p>
      </div>

      <div class="news-item">
        <span class="news-date">Jan 2026</span>
        <strong>New GPU Servers Available</strong>
        <p>NVIDIA H200 and RTX PRO 6000 instances now available for AI workloads.</p>
      </div>

      <div class="news-item">
        <span class="news-date">Oct 2025</span>
        <strong>New Cloud Templates</strong>
        <p>AlmaLinux 10, Rocky Linux 10 and Oracle Linux 10 added across all locations.</p>
      </div>
    </div>

    <div class="tagline">
      <strong>Cloud Services Portal</strong>
      Private Cloud · Hosting · Cybersecurity · Colocation
    </div>
  </div>

  <div id="kc-right-panel">
    <div id="kc-form-area">
      <#nested>
    </div>

    <div id="kc-footer">
      <span>&copy; ${.now?string('yyyy')} Bamboozle Web Services Inc. All rights reserved.</span>
      <div class="footer-links">
        <a href="https://legal.bamboozle.me/agreements/terms-of-service-agreement" target="_blank">Terms of Service</a> <span style="color:#9ca3af">·</span>
        <a href="https://legal.bamboozle.me/policies/privacy-policy" target="_blank">Privacy Policy</a>
      </div>
    </div>
  </div>

</body>
</html>
</#macro>
