#!/usr/bin/env node
/**
 * build-jar.mjs
 * Packages the bamboozle theme + keywind into a single deployable Keycloak JAR.
 */
import { execSync } from "child_process";
import { existsSync, mkdirSync, cpSync } from "fs";
import { resolve, join } from "path";
import { fileURLToPath } from "url";

const __dirname = fileURLToPath(new URL(".", import.meta.url));
const root      = resolve(__dirname, "..");
const dist      = join(root, "dist");
const jarName   = "bamboozle-keycloak-theme.jar";

if (existsSync(dist)) execSync(`rm -rf ${dist}`);
mkdirSync(dist, { recursive: true });

cpSync(join(root, "META-INF"), join(dist, "META-INF"), { recursive: true });

const keywindTheme = join(root, "node_modules", "keywind", "theme");
if (!existsSync(keywindTheme)) {
  console.error("ERROR: keywind theme not found. Run 'pnpm install && pnpm build' first.");
  process.exit(1);
}
cpSync(keywindTheme, join(dist, "theme"), { recursive: true });
cpSync(join(root, "theme", "bamboozle"), join(dist, "theme", "bamboozle"), { recursive: true });

const jarPath = join(root, jarName);
execSync(`jar cf ${jarPath} -C ${dist} .`, { stdio: "inherit" });
console.log(`\n✅ JAR built: ${jarName}\n`);
