::: {.faq}
# Mouse on Phone FAQ

<nav class="faq-topics" aria-label="FAQ topics">
  <a href="#setup">Setup</a>
  <a href="#agents">Coding agents</a>
  <a href="#controls">Mac and iPad</a>
  <a href="#network">Connections</a>
  <a href="#privacy">Privacy</a>
  <a href="#help">Troubleshooting</a>
</nav>

## Setup {#setup}

<details open>
<summary>What is Mouse on Phone?</summary>

Use your iPhone as a trackpad, keyboard, and remote for your Mac. You can view your Mac screen, use your iPhone as a second display, or use your iPhone as a Bluetooth mouse and keyboard for an iPad.

</details>

<details>
<summary>What devices do I need?</summary>

For Mac control, use an iPhone with iOS 16 or later and a Mac with macOS 14 or later. Install [the iPhone app](https://apps.apple.com/app/id6824015332) and the [Mac companion](@DOWNLOAD_URL@). For iPad control, install Mouse on Phone on the iPhone and iPad and pair them over Bluetooth. This setup works without a Mac.

</details>

<details>
<summary>How much does it cost?</summary>

The iPhone app is a one-time App Store purchase. See the [App Store listing](https://apps.apple.com/app/id6824015332) for your local price. The Mac companion is a free download.

</details>

<details>
<summary>How do I pair my iPhone with my Mac?</summary>

1. Put the iPhone and Mac on the same Wi-Fi network. Keep the Mac awake.
2. Open the Mac download, move **Mouse on Phone** to **Applications**, and open it.
3. In the Mac app, click **Pair New iPhone**.
4. In the iPhone app, tap **Scan Pairing Code** and scan the code shown on your Mac.

</details>

<details>
<summary>Which permissions do I need?</summary>

Allow **Local Network** on your iPhone for Mac connections and **Camera** to scan the pairing code. Allow **Accessibility** on your Mac for pointer and keyboard control. Allow **Screen & System Audio Recording** for Live View and the second display. If you use iPad control, allow Bluetooth.

</details>

<details>
<summary>How do I update or reinstall the apps?</summary>

On your iPhone, use the App Store. Download the app again with the Apple Account you used to buy it. For the Mac, check the [release history](@RELEASES_URL@) and install the new companion in Applications.

</details>

<details>
<summary>How can I verify the Mac download?</summary>

Use the [Mac download on this site](@DOWNLOAD_URL@). The developer signs the app and Apple notarizes it. To check the zip, run `shasum -a 256 Mouse-on-Phone.zip` in the folder where you saved it. Compare the result with the SHA-256 checksum on the [release page](@RELEASES_URL@).

</details>

## Coding agents {#agents}

<details>
<summary>Can I control a coding agent running in my terminal?</summary>

Yes. Start your agent on the Mac. On your iPhone, open **Mirror Display** from the trackpad’s display menu to see your Mac and use the keyboard. Tap the terminal window before you type. You can read the output, send a follow-up, or answer a prompt in the same session.

</details>

<details>
<summary>Which coding agents and models can I use?</summary>

You can control the terminal session of any coding agent you can run on your Mac, including Codex, Claude Code, Gemini CLI, OpenCode, Grok, or a custom command-line agent. The agent uses its own local or cloud model and its usual settings. Mouse on Phone sends your input to the Mac terminal.

</details>

<details>
<summary>Can I work with several agents at once?</summary>

Yes. Run agents in separate terminal windows or tabs on your Mac. Use the trackpad or Mirror Display to select the session you want. You can ask one agent to write a change and another to review it.

</details>

<details>
<summary>Do I need an agent account or API key?</summary>

Mouse on Phone requires no sign-up. Set up each agent on your Mac as you normally would. If the agent needs a subscription, account, or API key, use that agent’s own setup.

</details>

<details>
<summary>Can I get agent alerts or approve requests in Agent Inbox?</summary>

Agent Inbox and closed-app agent alerts are in development. In test builds, direct actions depend on what the agent and session support. With the public release, use Mirror Display and the keyboard to respond to a request in your Mac terminal.

</details>

## Mac and iPad controls {#controls}

<details>
<summary>What can I control on my Mac?</summary>

Move the pointer, click, scroll, zoom, type, use keyboard shortcuts, and adjust media playback. Mac controls also give you access to apps, menus, and custom panels. You can enable additional actions, such as scripts and Shortcuts, in the Mac app.

</details>

<details>
<summary>What is the difference between Live View and a second display?</summary>

Open **Controls → Live View** to see your Mac screen, a window, or a region. Use the trackpad’s display menu to open **Extend Display** and move a window to your iPhone, or **Mirror Display** to see your existing desktop with keyboard controls.

</details>

<details>
<summary>How do I use my iPhone as a Bluetooth mouse and keyboard for my iPad?</summary>

1. On your iPhone, open Mouse on Phone and tap **Control an iPad over Bluetooth**.
2. On your iPad, open Mouse on Phone and choose **Control This iPad → Use an iPhone as the Trackpad**.
3. Select your iPhone in the app and accept the pairing request on both devices.

You can point, click, scroll, type, and use media keys. iPad multi-finger trackpad gestures require an Apple trackpad.

</details>

<details>
<summary>Can I switch between devices?</summary>

Yes. Pair each Mac separately. Use the **Devices** button by **Settings** on the iPhone trackpad to switch between Macs and connected iPads. When multiple iPads are connected, your input goes to the one you select.

</details>

<details>
<summary>Can I use it with Windows, Linux, Android, or Apple TV?</summary>

The public app supports Mac control and Bluetooth control of an iPad. Windows, Linux, Android, and Apple TV control are outside the public release.

</details>

## Connections {#network}

<details>
<summary>Do my devices need internet access?</summary>

For Mac control, the iPhone and Mac must be able to reach each other on the same local network. That connection does not require internet access. Downloads and cloud-based coding agents can still need internet. For iPad control, use Bluetooth.

</details>

<details>
<summary>Can I connect from outside my home or office?</summary>

The supported Mac setup uses the same local network. Use both devices on that network when you need to view or control the Mac.

</details>

<details>
<summary>Does the Mac have to stay awake?</summary>

Yes. Keep the Mac awake and connected to the network while you use the app. If your Mac goes to sleep when you close its lid, reconnect after you wake it.

</details>

<details>
<summary>How do I remove a paired iPhone?</summary>

Open Mouse on Phone on the Mac and click **Revoke** next to the iPhone. If you want to connect it later, click **Pair New iPhone** to generate a new code.

</details>

## Privacy {#privacy}

<details>
<summary>Does Mouse on Phone require an account or collect my data?</summary>

You do not need a Mouse on Phone account. The public release has no ads, analytics, or cross-app tracking. Your keyboard input and Mac screen images travel over an encrypted connection between your paired devices. Crash reports stay on your device until you choose to share them. Read the [privacy policy](../privacy/) for details.

</details>

<details>
<summary>What can I do if I shared my pairing code?</summary>

Pair your own devices in person. If someone used your code to pair a device, open Mouse on Phone on your Mac and click **Revoke** next to that device.

</details>

<details>
<summary>Why does the app ask for camera access?</summary>

The iPhone camera scans the pairing QR code. The app does not store those camera images.

</details>

<details>
<summary>Are terms and privacy details available?</summary>

Read [Apple’s standard App Store license](https://www.apple.com/legal/internet-services/itunes/dev/stdeula/) and the [Mouse on Phone privacy policy](../privacy/).

</details>

## Troubleshooting {#help}

<details>
<summary>Why can’t my iPhone find my Mac?</summary>

Open Mouse on Phone on your Mac and keep it awake. Put both devices on the same Wi-Fi network. On your iPhone, go to **Settings → Privacy & Security → Local Network** and turn on Mouse on Phone. If you are on guest Wi-Fi, try a network that lets devices communicate with each other.

</details>

<details>
<summary>What if the pairing code does not scan?</summary>

On your iPhone, allow camera access for Mouse on Phone. On your Mac, click **Pair New iPhone** for a fresh code. Scan the new code while both devices are on the same Wi-Fi network.

</details>

<details>
<summary>What if the app says my iPhone and Mac versions are incompatible?</summary>

Follow the message to update the app on the device it names. Get the iPhone update from the [App Store](https://apps.apple.com/app/id6824015332) or the Mac update from the [website download](@DOWNLOAD_URL@). Reopen both apps and try to connect again.

</details>

<details>
<summary>Why does the pointer not move or the keyboard not type?</summary>

On your Mac, open **System Settings → Privacy & Security → Accessibility** and turn on Mouse on Phone. If it is already on, turn it off and back on, then reopen the Mac app. If the app offers **Restart Mouse on Phone**, click it. For typing, click the text field or terminal on your Mac before using the keyboard.

</details>

<details>
<summary>Why does typing stop in a password field?</summary>

macOS can block remote keyboard input while secure keyboard entry is active. Type the password on your Mac, then return to the iPhone keyboard.

</details>

<details>
<summary>Why is Live View or the second display black?</summary>

On your Mac, open **System Settings → Privacy & Security → Screen & System Audio Recording**, turn on Mouse on Phone, and reopen the app.

</details>

<details>
<summary>Why do scripts, Shortcuts, or system actions do nothing?</summary>

Enable the actions you want in Mouse on Phone on your Mac. If macOS asks for permission to control System Events, allow it for the action you are trying to use.

</details>

<details>
<summary>Why does my iPhone not appear in the iPad’s Bluetooth settings?</summary>

Start pairing in Mouse on Phone on both devices. The iPhone appears in the app’s device list on your iPad. Turn on Bluetooth on both devices and accept the pairing request when it appears.

</details>

<details>
<summary>How do I report a problem?</summary>

Open **Help** in Mouse on Phone or read the [support guide](../support/). If you still need help, [open a GitHub issue](@ISSUES_URL@) with the device models, operating system versions, and steps to reproduce the problem. If the app recorded a crash, you can share the report from **Settings → Help → Share Crash Reports**.

</details>
:::
