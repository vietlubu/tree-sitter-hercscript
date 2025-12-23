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

### Core Language Features

- **Comments** - Single-line (`//`) and multi-line (`/* */`) comments exposed as queryable nodes
- **Keywords** - All control flow keywords (`if`, `else`, `switch`, `case`, `for`, `while`, etc.) are captured
- **Variables** - Support for all variable types (`.@local`, `$global`, `@temp`, `#account`, `.npc`)
- **String literals** - Double-quoted strings with escape sequences
- **Numeric literals** - Decimal numbers (hex and octal planned)

### Control Flow

- **If/Else statements** - With proper keyword highlighting
- **Switch/Case statements** - Case expressions support any expression type
- **For loops** - With initialization, condition, and increment
- **While loops** - Standard while loops
- **Do-While loops** - Do-while loop support
- **Labels** - Script labels including special labels (`OnInit`, `OnInterIfInit`, etc.)
- **Goto statements** - Jump to labels
- **Break/Continue** - Loop control statements
- **Return statements** - With optional return values

### NPC Features

- **Script definitions** - Full NPC script syntax with position, sprite, and area
- **Function calls** - Built-in and user-defined function calls
- **Parameter lists** - Function parameters and arguments

### Operators

- **Arithmetic** - `+`, `-`, `*`, `/`, `%`
- **Comparison** - `==`, `!=`, `<`, `>`, `<=`, `>=`, `~=`, `~!`
- **Logical** - `&&`, `||`
- **Bitwise** - `&`, `|`, `^`
- **Assignment** - `=`, `+=`, `-=`, `*=`, `/=`, `%=`, `<<=`, `>>=`, `&=`, `^=`, `|=`
- **Ternary** - `condition ? true_val : false_val`

## Example Code

```hercscript
// Simple NPC dialog with comments highlighted
prontera,155,181,5	script	Sample NPC	1_M_01,{
    /*
     * Multi-line comment
     * Initialization code
     */
OnInit:
    .npc_name$ = "Sample NPC";
    end;

OnPCLoginEvent:
    // Local variables
    .@level = BaseLevel;
    .@name$ = strcharinfo(0);

    // Greeting message
    mes "Hello, " + .@name$ + "!";
    mes "Welcome to Hercules!";
    next;

    // If-else with keyword highlighting
    if (.@level >= 99) {
        mes "You are a veteran player!";
    } else {
        mes "Keep leveling up!";
    }

    // For loop example
    for (.@i = 0; .@i < 3; .@i += 1) {
        mes "Loop iteration: " + .@i;
    }

    // Switch statement
    switch (.@level) {
        case 99:
            mes "Max level reached!";
            break;
        case 50:
            mes "Halfway there!";
            break;
        default:
            mes "Level " + .@level;
            break;
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

### v0.4.0 (Latest)

- **Comments now exposed as nodes** - single-line (`//`) and multi-line (`/* */`) comments are now properly highlighted
- **Keywords exposed** - `if`, `else`, `switch`, `case`, `default`, `for`, `while`, `do`, `break`, `continue`, `goto`, `return` are now captured as keyword nodes
- **New control flow support**:
  - `for` loops with initialization, condition, and increment
  - `while` loops
  - `do-while` loops
  - `continue` statements
  - `goto` statements with labels
- **Label support** - Script labels (including `OnInit`, `OnInterIfInit`, etc.) are now properly recognized
- **Improved switch/case** - Case expressions now support any expression, not just numbers
- **Better operator handling** - All operators properly exposed for syntax highlighting
- **Enhanced punctuation** - Semicolons, commas, braces, and colons now queryable
- Built WASM grammar for Zed Editor integration
- Updated tree-sitter.json to modern schema format
- Comprehensive test files added

### v0.3.0

- Added Rust bindings for Zed Editor support
- Updated to tree-sitter 0.20
- Improved build system with automated build.sh script
- Enhanced package.json with tree-sitter metadata
- Added comprehensive documentation

### Earlier versions

- See git history for previous changes
