# Mouse on Phone privacy policy

**Effective November 27, 2026**
**Publisher:** Thribhuvan Kumar (individual developer)

## Summary

Mouse on Phone does not sell personal data or use it for advertising or cross-app tracking. It uses
PostHog in the EU for product analytics from the Mac companion. The iPhone App Store app runs without product analytics or session replay. Control traffic
moves between your paired devices over your local network, a VPN such as Tailscale, or Bluetooth.
For agent alerts while the app is closed, an operator-run relay forwards a bounded notification
preview to Apple Push Notification service.

## What Mouse on Phone handles, and where

| Data | Where it goes | Kept |
|---|---|---|
| Trackpad, keyboard and remote-control input, including what you type | From your iPhone to your paired Mac, encrypted, over your local network or VPN | Not stored |
| Mac screen images (Live View, screenshots, second display) | From your Mac to your paired iPhone, encrypted | Screenshots only if you save or share them |
| Visible text in detected agent tmux panes, including prompts, output, and anything else displayed there | From your Mac to your paired iPhone, encrypted. Other detected agents use a read-only terminal view | In memory on the Mac and iPhone. The iPhone can show the last received text after disconnect. Terminal text is not sent to product analytics |
| Claude Code or Grok notification text, when its optional hook pilot is enabled | A private file on your Mac, then encrypted to paired phones; a bounded preview may also go through the configured alert relay and Apple Push Notification service | Up to three recent notices per session. A later lifecycle event clears them; expired text can remain in the private file if the bridge stops. The phone treats them as past reports, not current decisions |
| Grok tmux socket path and pane ID, when its optional hook pilot is enabled | A private file on your Mac, for matching the report to a terminal screen | Until the session record is replaced or removed from the private state file; not sent to the phone |
| Grok process arguments and environment during hook-free session discovery | macOS returns both to the Mac app while it checks the foreground Grok session. The app uses only the supported launcher arguments to identify the session | Read temporarily in Mac memory; not intentionally saved, sent to the phone, or sent to analytics |
| Current Grok question text, choices, and your answers, when the experimental shared-leader adapter is enabled | From Grok on your Mac to paired phones over the encrypted connection; answers return to Grok. A bounded request preview may also go through the configured alert relay and Apple Push Notification service | The adapter keeps the current question and answer in Mac memory while handling the request. Grok handles the result under its own settings |
| Mac status (processor, memory, battery, network and disk use, and the names of your busiest apps) | From your Mac to your paired iPhone, encrypted, only while you look at it | Not stored |
| Pairing keys | Keychain on your iPhone and your Mac, and on an Apple TV you pair | Until you forget or revoke the pairing |
| Mac random stable ID | Keychain on the Mac and iPhone; the pairing QR code, local Bonjour record, and encrypted welcome carry it so a rename does not create another Mac | Until you forget the pairing; the Mac keeps its ID until its Keychain item is removed |
| Settings, custom panels and scripts | On your iPhone (panels, scripts) and Mac (settings) | Until you delete the app |
| Camera image | Used on your iPhone only to read the pairing QR code | Not stored |
| Mac camera image (Follow My Eyes, only while you have it on) | Used on your Mac only, to find which screen you look at, from the direction of your head and eyes. It never leaves your Mac | Not stored |
| Follow My Eyes calibration (the direction of your head and eyes for each screen) | On your Mac | Until you calibrate again or delete the app |
| Bluetooth | Your iPhone acts as a keyboard and mouse for an iPad you pair it with | Not stored |
| Apple TV remote input, including what you type | From your iPhone to an Apple TV you pair with a PIN, encrypted, over your local network | Not stored |
| Crash reports (from Apple's MetricKit) | Stay on your device | Until you share them with us, by your choice |
| Mac product interaction events, screen names, platform, approximate location from the network address when available, and a random device identifier | PostHog EU cloud, for product analytics from the Mac companion | The project uses PostHog's 12-month default retention setting for analytics events. The random ID remains in the device's Keychain until its item is removed |
| APNs device token, agent notification routing IDs, agent source, request type and fingerprint, Mac label with a stable ID suffix, source scope, short session context, and request preview | From your Mac to the private notification relay and Apple Push Notification service, to alert your iPhone | The relay keeps the token while the pairing renews it, removes it on revocation or after seven days without renewal, and keeps delivery IDs for up to seven days. It does not store alert text |
| IDs for an unresolved agent response | On your iPhone, with complete file protection, so an app restart cannot silently send another response to the same request | Until the Mac reports that the request is handled or you verify the current request and allow another response; response text is not stored in this record |
| Numbered Siri agent review, including the request details Siri read to you | In this iPhone's device-only Keychain, after local device authentication | Replaced before each review; its actions expire after two minutes |
| Codex command text this iPhone has already received, a source explanation attached to that approval, an on-device note, and a detected action | Stored only on this iPhone, with complete file protection, in Command memory. The file is excluded from backup | Until you remove Command memory or delete the app. It is not sent to the Mac, the alert relay, or product analytics |
| Qwen2.5-Coder 0.5B model weights | Downloaded once from Hugging Face to this iPhone, with complete file protection, and excluded from backup. The download does not include a command | Until you remove the coding model or delete the app |
| Recognized Codex command names and short activity explanations | Apple Foundation Models processes command names locally on the Mac. Arguments, paths, command output, and user prompts are excluded. Explanations travel to paired phones over the existing encrypted connection | Cached in Mac memory for current activities; no explanation archive or analytics |

Mac activity explanations use Apple's on-device system model when available on macOS 26 or later. They do not use Private Cloud Compute. For pending requests, the Mac also sends the bounded command, source reason, and scope to this local model to summarize the reason and command meaning. The next step comes from the source request's supported actions, not generated advice. These inputs stay on the Mac. Validated summaries and the existing command preview go to the paired phone and, when configured, through the relay. Alerts include a summary only when it fits with the source details. The relay does not store this text. Notifications wait at most six seconds for generation and then use source text and rule-based guidance. Existing Live Activities display the last phone-received explanation; this does not add remote Live Activity updates while the phone is suspended.

## What we do not do

- No advertising or cross-app tracking.
- Product analytics events do not include trackpad input, typed text, agent messages, commands or Mac screen images.
- No transfer of control traffic to us. Agent notification previews pass through the operator-run relay and Apple Push Notification service when closed-app alerts are configured.
- An on-device note and detected action use the coding model installed on the iPhone. The app downloads the model weights once. It does not send the command or model output to a model service. Model output cannot approve a command.

## Privacy choices

Turn off Mouse on Phone notifications in iOS Settings to withdraw notification permission. Revoke a paired device in the Mac companion to remove its alert registration. For access or deletion requests, use the contact below and ask for a private reply before sharing a device identifier or agent content.

## Children

Mouse on Phone is not directed at children under 13. We do not knowingly collect personal data from children under 13.

## Changes

We will post changes to this policy on this page with a new effective date.

## Contact

Questions and requests about this policy: [open an issue on GitHub](@ISSUES_URL@).
