# tree-sitter-hercscript

Tree-sitter grammar for Hercules Script Language (HercScript), the scripting language used in [Hercules Emulator](http://herc.ws).
Based on the original grammar by [Guilherme Menaldo](https://github.com/guilherme-gm/vscode-herc-lang-support/tree/master/server/tree-sitter-hercscript), updated for compatibility with Zed Editor and tree-sitter 0.20.

## Features

- Full syntax highlighting for Hercules Script files
- Parser support for Zed Editor and other tree-sitter compatible editors
- Rust bindings for native integration
- Node.js bindings for JavaScript/TypeScript projects

## Installation

### For Zed Editor

This grammar is designed to work with Zed Editor. To use it:

1. Clone this repository into your Zed extensions directory:

   ```bash
   git clone https://github.com/vietlubu/tree-sitter-hercscript ~/.config/zed/extensions/tree-sitter-hercscript
   ```

2. Build the grammar:

   ```bash
   cd ~/.config/zed/extensions/tree-sitter-hercscript
   ./build.sh
   ```

3. Restart Zed Editor

### For Development

#### Prerequisites

- Node.js (v14 or later)
- npm
- Rust toolchain (cargo) - for Zed integration
- tree-sitter CLI (optional, but recommended)

#### Setup

```bash
# Install dependencies
npm install

# Generate parser
npm run build

# Run tests
npm test
```

## Building

### Using the build script (Recommended)

```bash
# Build everything (parser + Rust bindings)
./build.sh

# Generate parser only
./build.sh generate

# Run tests
./build.sh test

# Clean build artifacts
./build.sh clean

# Show help
./build.sh help
```

### Manual build

```bash
# Generate the parser
tree-sitter generate

# Build Node bindings
node-gyp configure build

# Build Rust bindings (for Zed)
cargo build --release

# Run tests
tree-sitter test
```

## File Types

This grammar recognizes the following file extensions:

- `.hcs` - Hercules Script files
- `.txt` - Text files (when containing HercScript)

## Grammar Features

The grammar supports:

- Script labels and goto statements
- Function definitions and calls
- Variable declarations and assignments
- Control flow (if/else, switch/case, while, for, do-while)
- Built-in commands (mes, close, input, etc.)
- Comments (single-line // and multi-line /\* \*/)
- String literals and escape sequences
- Numeric literals (decimal, hex, octal)
- Operators and expressions
- Arrays and array access

## Example Code

```hercscript
// Simple NPC dialog
prontera,155,181,5	script	Sample NPC	1_M_01,{
OnInit:
    .npc_name$ = "Sample NPC";
    end;

OnPCLoginEvent:
    mes "Hello, " + strcharinfo(0) + "!";
    mes "Welcome to Hercules!";
    next;

    if (BaseLevel >= 99) {
        mes "You are a veteran player!";
    } else {
        mes "Keep leveling up!";
    }
    close;
}
```

## Development

### Project Structure

```
tree-sitter-hercscript/
├── bindings/
│   └── rust/
│       └── lib.rs          # Rust bindings for Zed
├── corpus/                 # Test files
├── src/
│   ├── parser.c           # Generated parser (do not edit)
│   └── node-types.json    # Node type definitions
├── grammar.js             # Grammar definition
├── package.json           # Node package config
├── Cargo.toml            # Rust package config
├── build.rs              # Rust build script
├── build.sh              # Build automation script
└── README.md             # This file
```

### Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes to `grammar.js`
4. Add tests in the `corpus/` directory
5. Run `./build.sh test` to verify
6. Submit a pull request

### Writing Tests

Tests are located in the `corpus/` directory. Each test file should follow this format:

```
====================================
Test Name
====================================
input code here
---
(expected_syntax_tree)
```

Run tests with:

```bash
./build.sh test
# or
tree-sitter test
```

## License

MIT License - see LICENSE file for details

## Credits

- Original grammar by Guilherme Menaldo
- Updated for Zed compatibility by Vietlubu
- Based on the Hercules Emulator project: http://herc.ws

## Links

- [Hercules Emulator](http://herc.ws)
- [Hercules GitHub](https://github.com/HerculesWS/Hercules)
- [Tree-sitter](https://tree-sitter.github.io/)
- [Zed Editor](https://zed.dev/)

## Support

For issues related to:

- Grammar bugs: Open an issue on this repository
- Hercules Script language: Visit [Hercules Forums](https://herc.ws/board/)
- Zed Editor integration: Check [Zed Documentation](https://zed.dev/docs)

## Changelog

### v0.3.0

- Added Rust bindings for Zed Editor support
- Updated to tree-sitter 0.20
- Improved build system with automated build.sh script
- Enhanced package.json with tree-sitter metadata
- Added comprehensive documentation

### Earlier versions

- See git history for previous changes
