```{=html}
<section class="hero" id="download" aria-labelledby="hero-title">
  <div class="hero-copy">
    <h1 id="hero-title">Control your Mac from your iPhone.</h1>
    <p class="hero-lead">Use your iPhone as a trackpad and keyboard. See your Mac screen, check a build, or type into the terminal on the same Wi-Fi network.</p>
    <div class="hero-actions">
      <a class="button" href="@APP_STORE_URL@">Download for iPhone</a>
      <a class="button secondary" href="@MAC_PREVIEW_DOWNLOAD_URL@">Download Mac preview</a>
    </div>
    <p class="hero-releases"><a href="@MAC_RELEASE_URL@">Mac @MAC_VERSION@</a> · @MAC_RELEASE_STATUS@<br>The Mac preview requires a compatible iPhone beta.</p>
  </div>
  <figure class="hero-preview">
    <a href="screenshots/01.png"><img src="screenshots/01.png" width="1320" height="2868" alt="Any coding agent, any model. The Mac terminal and logos for Codex, Claude Code, and Gemini CLI introduce control for hosted or local models."></a>
    <figcaption><a href="#agent-preview">See the coding agent preview</a></figcaption>
  </figure>
</section>
```

::::: {.home-section #setup}
## Install and pair

Install Mouse on Phone on both devices. Keep your Mac awake and connect both devices to the same Wi-Fi network. Mouse on Phone requires no sign-up.

:::: {.install-grid}
::: {.install-step}
### On your Mac

1. [Download the stable Mac companion](@DOWNLOAD_URL@) to pair with the App Store iPhone app. It requires macOS 14 or later.
2. Open the ZIP file, move **Mouse on Phone** to **Applications**, and open it.
3. Allow **Accessibility** for pointer and keyboard control. Allow **Screen Recording** if you want Live View or a second display.
4. Click **Pair New iPhone** to show the QR code.
:::

::: {.install-step}
### On your iPhone

1. [Install Mouse on Phone from the App Store](@APP_STORE_URL@). It requires iOS 16 or later.
2. Open the app and tap **Scan Pairing Code**. Allow camera and local network access when asked.
3. Scan the code displayed on your Mac. Move your finger on the iPhone trackpad to check the connection.
:::
::::

Use the [FAQ to set up an iPad over Bluetooth](faq/#controls) or [get help with pairing](support/).
:::::

::: {.home-section .remote-setup #remote-setup}
## Remote setup with Tailscale

Use compatible iPhone and Mac beta builds to test remote access. The public release uses the same Wi-Fi network.

1. Install [Tailscale on your Mac](https://tailscale.com/docs/install/mac) and [iPhone](https://tailscale.com/docs/install/ios). Sign in to the same Tailscale network on both devices and connect them.
2. Keep your Mac awake and open Mouse on Phone. When the Mac detects Tailscale, click **Test Tailscale Pairing**.
3. Open Mouse on Phone on your iPhone and scan the Mac’s test QR code.
4. Check pointer movement or open your Mac screen from the iPhone. To test away from Wi-Fi, leave Tailscale connected, switch the iPhone to cellular, and repeat the check.

If **Test Tailscale Pairing** is unavailable, use the [same Wi-Fi setup](#setup).
:::

```{=html}
<section class="home-section" id="agent-preview" aria-labelledby="preview-title">
  <h2 id="preview-title">Coding agent preview</h2>
  <p>The screenshots use demo sessions. Agent Inbox actions depend on the agent and session you use.</p>
  <ul class="screenshot-grid" role="list">
    <li><a href="screenshots/02.png"><img src="screenshots/02.png" width="1320" height="2868" loading="lazy" decoding="async" alt="View Mac shows the iPhone keyboard sending a follow-up to Gemini CLI."></a></li>
    <li><a href="screenshots/03.png"><img src="screenshots/03.png" width="1320" height="2868" loading="lazy" decoding="async" alt="View Mac shows the iPhone keyboard sending a follow-up to a custom command-line agent that uses a local model."></a></li>
    <li><a href="screenshots/04.png"><img src="screenshots/04.png" width="1320" height="2868" loading="lazy" decoding="async" alt="Agent Inbox lists pending requests and detected Codex, Claude Code, and Gemini CLI sessions."></a></li>
    <li><a href="screenshots/05.png"><img src="screenshots/05.png" width="1320" height="2868" loading="lazy" decoding="async" alt="A Codex request shows the exact swift test command with options to approve once or decline."></a></li>
    <li><a href="screenshots/06.png"><img src="screenshots/06.png" width="1320" height="2868" loading="lazy" decoding="async" alt="The demo Codex request shows the chosen response and that the agent accepted it."></a></li>
    <li><a href="screenshots/07.png"><img src="screenshots/07.png" width="1320" height="2868" loading="lazy" decoding="async" alt="A Codex question asks which tests to run, with an answer selected and a Send answer button."></a></li>
  </ul>
</section>
```

::: {.home-section #features}
## What you can use today

- A full-screen trackpad with Mac gestures and Force Touch.
- Keyboard, media keys, custom panels, apps, and menus.
- Live View and a second display for your Mac.
- Bluetooth mouse and keyboard control for your iPad.

The public release has no analytics or cross-app tracking. Read the [privacy policy](privacy/) and [support guide](support/).
:::
