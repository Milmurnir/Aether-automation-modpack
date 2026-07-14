# Aether Automation (packwiz)

Auto-updating distribution of the Aether Automation modpack (NeoForge 1.20.1).

## Player setup (Prism Launcher, one time)

1. Create a new Prism instance: Minecraft **1.20.1**, install **NeoForge 47.1.106** in the instance settings.
2. Download [`packwiz-installer-bootstrap.jar`](https://github.com/packwiz/packwiz-installer-bootstrap/releases/latest) and put it in the instance's `minecraft` folder (right-click instance → Folder).
3. Instance → Edit → Settings → Custom commands → enable, and set **Pre-launch command** to:

   ```
   "$INST_JAVA" -jar packwiz-installer-bootstrap.jar https://raw.githubusercontent.com/<GITHUB_USER>/<REPO>/main/pack.toml
   ```

4. Launch. The pack installs itself and re-checks for updates on every launch — no manual mrpack imports ever again.

## Publishing an update (maintainer)

1. Edit the changed `.pw.toml` files under `mods/` (or config files), bump `version` in `pack.toml`.
2. Regenerate hashes in `index.toml` and the index hash in `pack.toml` (the build script does this).
3. Commit and push. Players get the update on next launch.

The mrpack and server-zip builds in `Desktop\Modpack` remain the source of truth; this repo is generated from the latest mrpack.
