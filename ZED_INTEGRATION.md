# Zed Editor Integration Guide

This guide explains how to integrate the tree-sitter-hercscript grammar with Zed Editor.

## Prerequisites

- Zed Editor installed
- Rust toolchain (cargo) - [Install from rustup.rs](https://rustup.rs/)
- Node.js and npm (for development)

## Installation Methods

### Method 1: Via Zed Extensions Directory (Recommended)

1. **Clone the grammar into Zed's extensions directory:**
   ```bash
   mkdir -p ~/.config/zed/extensions
   cd ~/.config/zed/extensions
   git clone https://github.com/vietlubu/tree-sitter-hercscript
   ```

2. **Build the grammar:**
   ```bash
   cd tree-sitter-hercscript
   ./build.sh
   ```

3. **Restart Zed Editor**

### Method 2: As a Zed Extension

To create a proper Zed extension that includes this grammar:

1. **Create an extension directory structure:**
   ```bash
   mkdir -p ~/.config/zed/extensions/hercscript-extension
   cd ~/.config/zed/extensions/hercscript-extension
   ```

2. **Create extension manifest (`extension.toml`):**
   ```toml
   id = "hercscript"
   name = "Hercules Script"
   description = "Syntax highlighting and language support for Hercules Script"
   version = "0.3.0"
   schema_version = 1
   authors = ["Guilherme Menaldo", "Vietlubu"]
   repository = "https://github.com/vietlubu/tree-sitter-hercscript"

   [grammars.hercscript]
   repository = "https://github.com/vietlubu/tree-sitter-hercscript"
   commit = "main"
   ```

3. **Create language configuration (`languages.toml`):**
   ```toml
   [[language]]
   name = "Hercules Script"
   grammar = "hercscript"
   scope = "source.hercscript"
   file_types = ["hcs", "txt"]
   comment_token = "//"
   block_comment = ["/*", "*/"]
   ```

4. **Copy the grammar to the extension:**
   ```bash
   cp -r path/to/tree-sitter-hercscript grammars/hercscript
   ```

5. **Restart Zed**

## Build from Source

If you want to build the grammar manually:

```bash
cd tree-sitter-hercscript

# Generate parser
tree-sitter generate

# Build Rust bindings for Zed
cargo build --release

# Optional: Build Node bindings
npm install
npm run build
```

## Verification

After installation, verify that the grammar is working:

1. **Open a `.hcs` file in Zed**
2. **Check syntax highlighting** - Keywords, strings, and comments should be colored
3. **Check the language indicator** - Bottom-right corner should show "Hercules Script" or "hercscript"

## File Associations

Zed will automatically recognize these file extensions:
- `.hcs` - Hercules Script files
- `.txt` - Text files (may conflict with plain text)

To manually set the language for a file:
1. Click the language indicator in the bottom-right
2. Type "hercscript" or "Hercules Script"
3. Press Enter

## Syntax Highlighting Features

The grammar provides highlighting for:

- **Keywords**: `script`, `function`, `if`, `else`, `while`, `for`, etc.
- **Control flow**: `break`, `continue`, `return`, `goto`
- **Built-in commands**: `mes`, `next`, `close`, `end`, `input`, etc.
- **Comments**: Single-line (`//`) and multi-line (`/* */`)
- **Strings**: Double-quoted strings with escape sequences
- **Numbers**: Decimal, hexadecimal, and octal literals
- **Operators**: Arithmetic, logical, bitwise, and assignment operators
- **Labels**: Script labels (e.g., `OnInit:`, `OnPCLoginEvent:`)
- **NPC definitions**: Map positions, sprites, and names

## Customizing Syntax Highlighting

To customize colors, edit your Zed theme or create a custom theme in:
```
~/.config/zed/themes/your-theme.json
```

Example scope mappings:
```json
{
  "syntax": {
    "keyword": { "color": "#C678DD" },
    "function": { "color": "#61AFEF" },
    "string": { "color": "#98C379" },
    "comment": { "color": "#5C6370", "font_style": "italic" },
    "number": { "color": "#D19A66" },
    "operator": { "color": "#56B6C2" }
  }
}
```

## Troubleshooting

### Grammar not loading

1. **Check Zed logs:**
   ```bash
   tail -f ~/Library/Logs/Zed/Zed.log  # macOS
   tail -f ~/.local/share/zed/logs/Zed.log  # Linux
   ```

2. **Verify the build:**
   ```bash
   cd tree-sitter-hercscript
   cargo build --release
   ls target/release/libtree_sitter_hercscript.*
   ```

3. **Ensure Rust bindings exist:**
   The file `bindings/rust/lib.rs` should exist and contain the language function.

### Syntax highlighting not working

1. **Check the queries file:**
   ```bash
   cat queries/highlights.scm
   ```

2. **Verify file type association:**
   Open a `.hcs` file and check if Zed recognizes it.

3. **Regenerate parser:**
   ```bash
   tree-sitter generate
   cargo build --release
   ```

### Build errors

1. **Update dependencies:**
   ```bash
   cargo update
   npm update
   ```

2. **Clean and rebuild:**
   ```bash
   ./build.sh clean
   ./build.sh
   ```

3. **Check Rust version:**
   ```bash
   rustc --version  # Should be 1.70.0 or later
   ```

## Development

### Testing Changes

1. **Modify `grammar.js`** - Make your grammar changes
2. **Generate parser** - Run `tree-sitter generate`
3. **Test parsing** - Run `tree-sitter test`
4. **Build Rust bindings** - Run `cargo build --release`
5. **Reload Zed** - Cmd/Ctrl+Shift+P → "Reload Window"

### Adding Test Cases

Add test files to the `corpus/` directory:

```
====================================
Test description
====================================
input code
---
(expected_syntax_tree)
```

Run tests:
```bash
tree-sitter test
```

### Query Development

Edit `queries/highlights.scm` to customize syntax highlighting:

```scheme
; Example: Highlight custom functions
(function_call
  function: (identifier) @function.custom
  (#match? @function.custom "^my_"))
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with Zed Editor
5. Submit a pull request

## Resources

- [Zed Documentation](https://zed.dev/docs)
- [Tree-sitter Documentation](https://tree-sitter.github.io/)
- [Hercules Emulator](http://herc.ws)
- [Hercules GitHub](https://github.com/HerculesWS/Hercules)

## Support

For issues:
- Grammar bugs: [GitHub Issues](https://github.com/vietlubu/tree-sitter-hercscript/issues)
- Zed-specific issues: [Zed Community](https://zed.dev/community)
- Hercules Script help: [Hercules Forums](https://herc.ws/board/)

## License

MIT License - See LICENSE file for details
