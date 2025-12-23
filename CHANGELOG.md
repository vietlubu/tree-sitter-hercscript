# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.0] - 2024-12-23

### Added
- **Zed Editor Support**: Full integration with Zed Editor
  - Added Rust bindings (`bindings/rust/lib.rs`)
  - Added `Cargo.toml` for Rust package configuration
  - Added `build.rs` for Rust build automation
  - Added `Cargo.lock` for dependency management
- **Node.js Bindings**: Improved Node.js integration
  - Created `bindings/node/index.js` for proper module exports
  - Updated `package.json` with tree-sitter metadata
- **Build System**: Comprehensive build automation
  - Added `build.sh` script with multiple build modes
  - Support for generating, building, testing, and cleaning
  - Colorized output and dependency checking
  - Automatic Rust and Node.js builds
- **Documentation**: Extensive documentation added
  - Created `README.md` with installation and usage instructions
  - Created `ZED_INTEGRATION.md` with detailed Zed setup guide
  - Added inline documentation in Rust bindings
- **Configuration Files**:
  - Added `tree-sitter.json` for grammar configuration
  - Added `.gitignore` for proper artifact management
- **Syntax Highlighting**:
  - Created `queries/highlights.scm` with comprehensive syntax rules
  - Support for keywords, control flow, functions, operators
  - Special highlighting for built-in Hercules commands
  - Label and NPC definition highlighting

### Changed
- **Package Configuration**: Updated `package.json`
  - Changed main entry point from `index.js` to `bindings/node`
  - Updated tree-sitter dependency from `^0.14.0` to `^0.20.0`
  - Updated tree-sitter-cli from `^0.14.6` to `^0.20.0`
  - Added tree-sitter metadata section with scope and file types
  - Reorganized dependencies and added repository information
- **Build Process**: Updated `build.rs`
  - Enabled external scanner (`scanner.c`) compilation
  - Added proper compiler flags for C code
  - Improved error handling and warnings

### Fixed
- ABI version compatibility issues
- Rust bindings test failures
- Documentation examples now use `no_run` directive

### Technical Details
- Tree-sitter ABI: 14
- Tree-sitter version: 0.20
- Rust edition: 2021
- Supported platforms: macOS, Linux, Windows

## [0.2.0] - 2019-05-03

### Added
- Initial grammar implementation
- Basic NPC script parsing
- Function definitions and calls
- Control flow statements
- Variable declarations

### Changed
- Grammar improvements for Hercules Script syntax

## [0.1.0] - Initial Release

### Added
- Initial tree-sitter grammar for Hercules Script
- Basic syntax support
- Parser generation

---

## Release Notes

### For Users

**v0.3.0** brings full Zed Editor support! You can now use this grammar with Zed for:
- Syntax highlighting
- Code navigation
- Better editing experience

To get started with Zed:
1. Follow the instructions in `ZED_INTEGRATION.md`
2. Run `./build.sh` to build the grammar
3. Restart Zed Editor

### For Developers

**v0.3.0** modernizes the build system:
- Rust bindings for native performance
- Automated build scripts
- Comprehensive test suite
- Better documentation

To contribute:
1. Make changes to `grammar.js`
2. Add tests to `corpus/`
3. Run `./build.sh test`
4. Submit a PR

---

## Upgrade Guide

### From 0.2.0 to 0.3.0

If you were using the old version:

1. **Backup your setup** (if you made custom changes)
2. **Pull the latest changes**:
   ```bash
   git pull origin main
   ```
3. **Install dependencies**:
   ```bash
   npm install
   cargo update
   ```
4. **Rebuild**:
   ```bash
   ./build.sh
   ```

### Breaking Changes

- Main entry point changed from `index.js` to `bindings/node`
- Node.js version requirement updated (recommend v14+)
- Tree-sitter version updated to 0.20

If you use this grammar in your own project:
```javascript
// Old way
const parser = require('tree-sitter-hercscript');

// New way (still works, but recommended to update)
const parser = require('tree-sitter-hercscript');
```

---

## Future Plans

### Planned for 0.4.0
- [ ] LSP (Language Server Protocol) support
- [ ] Improved error recovery
- [ ] More comprehensive syntax highlighting
- [ ] Autocomplete suggestions
- [ ] Code formatting support

### Planned for 0.5.0
- [ ] Semantic highlighting
- [ ] Symbol navigation
- [ ] Refactoring support
- [ ] Integration with more editors

---

## Links

- [Repository](https://github.com/vietlubu/tree-sitter-hercscript)
- [Hercules Emulator](http://herc.ws)
- [Tree-sitter](https://tree-sitter.github.io/)
- [Zed Editor](https://zed.dev/)

## Contributors

- Guilherme Menaldo - Original author
- Vietlubu - Zed integration and modernization

## License

MIT License - See LICENSE file for details
