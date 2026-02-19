# Bamboozle Keycloak Theme

Bamboozle-branded login theme for Keycloak, built as a child of [Keywind](https://github.com/lukin/keywind).
Deployed automatically to MicroK8s via GitHub Actions.

## Quick Start

1. Add logo: `theme/bamboozle/login/resources/img/logo.png`
2. Set brand colours in `tailwind.config.js` (update `primary.500`)
3. Set secrets in GitHub: `KUBECONFIG` (base64 of microk8s config)
4. Update `KC_NAMESPACE` and `KC_DEPLOYMENT` in `.github/workflows/deploy-theme.yml`
5. Push to `main` — Actions deploys automatically

## Local Dev

```bash
pnpm install
pnpm build
pnpm build:jar
# Test with Docker:
docker run -p 8080:8080 -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin \
  -v "$(pwd)/bamboozle-keycloak-theme.jar:/opt/keycloak/providers/bamboozle-keycloak-theme.jar" \
  quay.io/keycloak/keycloak:latest start-dev
```

## Getting KUBECONFIG secret value

```bash
microk8s config | base64 -w 0
```

Paste the output as the `KUBECONFIG` secret in: Settings → Secrets and variables → Actions

## Enabling in Keycloak

After first deploy: Keycloak Admin → Realm Settings → Themes → Login Theme → `bamboozle`
