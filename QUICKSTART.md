# Quick Start Guide - tree-sitter-hercscript for Zed Editor

🚀 Get up and running in under 2 minutes!

## Prerequisites

Make sure you have these installed:
- ✅ Zed Editor
- ✅ Rust (via [rustup.rs](https://rustup.rs/))
- ✅ Node.js (optional, for development)

## Installation (3 Steps)

### 1. Clone to Zed Extensions Directory

```bash
mkdir -p ~/.config/zed/extensions
cd ~/.config/zed/extensions
git clone https://github.com/vietlubu/tree-sitter-hercscript
```

### 2. Build the Grammar

```bash
cd tree-sitter-hercscript
./build.sh
```

**Expected output:**
```
✓ Node.js found: v20.x.x
✓ npm found: 10.x.x
✓ Cargo found: cargo 1.x.x
✓ Parser generated: src/parser.c
✓ Rust bindings compiled successfully
✓ Build complete!
```

### 3. Restart Zed

- Close and reopen Zed Editor
- Open any `.hcs` file
- Syntax highlighting should work automatically! 🎉

## Verify Installation

1. Open a Hercules Script file (`.hcs`)
2. Check the language indicator (bottom-right) - should show "hercscript"
3. Keywords like `script`, `function`, `if` should be highlighted

## Test File

Create a test file `test.hcs`:

```hercscript
prontera,155,181,5	script	Test NPC	1_M_01,{
OnInit:
    mes "Hello, World!";
    close;
}
```

If colors appear on keywords, it's working! ✅

## Build Modes

```bash
./build.sh           # Build everything (default)
./build.sh generate  # Generate parser only
./build.sh test      # Run tests
./build.sh clean     # Clean build artifacts
./build.sh help      # Show all options
```

## Troubleshooting

### Grammar not loading?

```bash
cd ~/.config/zed/extensions/tree-sitter-hercscript
cargo build --release
# Restart Zed
```

### Syntax highlighting not working?

```bash
cd ~/.config/zed/extensions/tree-sitter-hercscript
./build.sh clean
./build.sh
# Restart Zed
```

### Still having issues?

Check detailed guides:
- `README.md` - Full documentation
- `ZED_INTEGRATION.md` - Zed-specific help
- `TOM_TAT.md` - Vietnamese guide

## File Types Supported

- `.hcs` - Hercules Script files (recommended)
- `.txt` - Text files (may conflict with plain text)

## Next Steps

- Read `README.md` for full features
- Check `CHANGELOG.md` for version history
- Customize colors in Zed theme settings
- Join [Hercules Forums](https://herc.ws/board/) for script help

## Common Commands

```bash
# Update grammar
cd ~/.config/zed/extensions/tree-sitter-hercscript
git pull
./build.sh
# Restart Zed

# Check version
cat ~/.config/zed/extensions/tree-sitter-hercscript/package.json | grep version

# View logs (macOS)
tail -f ~/Library/Logs/Zed/Zed.log
```

## Support

- 🐛 Grammar bugs: [GitHub Issues](https://github.com/vietlubu/tree-sitter-hercscript/issues)
- 💬 Zed help: [Zed Community](https://zed.dev/community)
- 📚 Hercules Script: [Hercules Docs](http://herc.ws)

## Summary

1. Clone to `~/.config/zed/extensions/`
2. Run `./build.sh`
3. Restart Zed
4. Done! 🎉

**Time required**: ~2 minutes
**Difficulty**: Easy

---

Made with ❤️ for the Hercules community
