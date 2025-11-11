# macos-actually-copy-image
The "Copy Image" option in macOS apps like Safari copies to a macOS multi-format clipboard entry that can be pasted as image or an URL depending on the application that's pasted in; however in reality most websites and apps don't support that and will default to pasting an URL instead (e.g. Facebook Messenger, Discord, etc). An opposite situation is MS Office apps on macOS which really love to copy text as images.

This is a simple Hammerspoon script that watches clipboard changes, detects copied items, then replaces multi-format image entries with pure image type entries. For MS apps, it strips images from copied text. This allows simple pasting of images in these aforementioned websites. If an URL is needed instead, "Copy Image Link" works as intended.
