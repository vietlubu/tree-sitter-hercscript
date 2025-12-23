#!/usr/bin/env bash
#================= Tree-sitter Grammar Build Script ===========================
#=       _   _                     _
#=      | | | |                   | |
#=      | |_| | ___ _ __ ___ _   _| | ___  ___
#=      |  _  |/ _ \ '__/ __| | | | |/ _ \/ __|
#=      | | | |  __/ | | (__| |_| | |  __/\__ \
#=      \_| |_/\___|_|  \___|\__,_|_|\___||___/
#================= License ====================================================
#= This file is part of Hercules.
#= http://herc.ws - http://github.com/HerculesWS/Hercules
#=
#= Copyright (C) 2014-2025 Hercules Dev Team
#=
#= Hercules is free software: you can redistribute it and/or modify
#= it under the terms of the GNU General Public License as published by
#= the Free Software Foundation, either version 3 of the License, or
#= (at your option) any later version.
#=============================================================================
#= Build script for tree-sitter-hercscript grammar
#=============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ $1${NC}"
}

print_header() {
    echo -e "${BLUE}"
    echo "============================================================"
    echo "  Tree-sitter Hercules Script Grammar Builder"
    echo "============================================================"
    echo -e "${NC}"
}

check_dependencies() {
    print_info "Checking dependencies..."

    if ! command -v node &> /dev/null; then
        print_error "Node.js is not installed"
        echo "Please install Node.js: https://nodejs.org/"
        exit 1
    fi
    print_success "Node.js found: $(node --version)"

    if ! command -v npm &> /dev/null; then
        print_error "npm is not installed"
        echo "Please install npm (comes with Node.js)"
        exit 1
    fi
    print_success "npm found: $(npm --version)"

    if ! command -v cargo &> /dev/null; then
        print_warning "Cargo (Rust) is not installed"
        print_info "Rust build will be skipped (Zed may compile it on demand)"
        print_info "To install Rust: https://rustup.rs/"
    else
        print_success "Cargo found: $(cargo --version)"
    fi
}

install_dependencies() {
    print_info "Installing npm dependencies..."

    cd "$SCRIPT_DIR"

    if [ ! -d "node_modules" ]; then
        npm install
        print_success "Dependencies installed"
    else
        print_info "Dependencies already installed (run 'npm install' to update)"
    fi
}

generate_parser() {
    print_info "Generating parser from grammar.js..."

    cd "$SCRIPT_DIR"

    if ! command -v tree-sitter &> /dev/null; then
        print_warning "tree-sitter CLI not found globally"
        print_info "Using tree-sitter from node_modules..."
        npx tree-sitter generate
    else
        tree-sitter generate
    fi

    if [ -f "src/parser.c" ]; then
        print_success "Parser generated: src/parser.c"
    else
        print_error "Failed to generate parser"
        exit 1
    fi
}

compile_parser() {
    print_info "Compiling parser..."

    cd "$SCRIPT_DIR"

    # This is optional - Zed will compile it when needed
    # But we can check if node-gyp is available
    if command -v node-gyp &> /dev/null; then
        node-gyp configure build
        print_success "Parser compiled"
    else
        print_warning "node-gyp not found - skipping compilation"
        print_info "Zed will compile the parser when needed"
    fi
}

build_rust_bindings() {
    print_info "Building Rust bindings for Zed..."

    cd "$SCRIPT_DIR"

    if ! command -v cargo &> /dev/null; then
        print_warning "Cargo not found - skipping Rust build"
        print_info "Zed will attempt to compile when loading the extension"
        return 0
    fi

    if [ ! -f "Cargo.toml" ]; then
        print_warning "Cargo.toml not found - skipping Rust build"
        return 0
    fi

    print_info "Building release binary (cdylib + rlib)..."
    if cargo build --release; then
        print_success "Rust bindings compiled successfully"

        # Check for the built library
        if [ -f "target/release/libtree_sitter_hercscript.dylib" ] || \
           [ -f "target/release/libtree_sitter_hercscript.so" ] || \
           [ -f "target/release/tree_sitter_hercscript.dll" ]; then
            print_success "Dynamic library created for Zed"
        else
            print_warning "Dynamic library not found in target/release/"
        fi
    else
        print_error "Rust build failed"
        print_info "Zed will attempt to compile when loading the extension"
        return 1
    fi
}

run_tests() {
    print_info "Running grammar tests..."

    cd "$SCRIPT_DIR"

    if [ -d "corpus" ]; then
        if ! command -v tree-sitter &> /dev/null; then
            npx tree-sitter test
        else
            tree-sitter test
        fi
        print_success "Tests passed"
    else
        print_warning "No corpus directory found - skipping tests"
    fi
}

clean() {
    print_info "Cleaning build artifacts..."

    cd "$SCRIPT_DIR"

    rm -rf build/
    rm -rf src/parser.c
    rm -rf src/tree_sitter/
    rm -rf node_modules/
    rm -f *.node

    # Clean Rust build artifacts
    if [ -f "Cargo.toml" ] && command -v cargo &> /dev/null; then
        cargo clean
    else
        rm -rf target/
    fi

    print_success "Clean complete"
}

show_usage() {
    cat << EOF
Usage: $0 [COMMAND]

Build the tree-sitter Hercules Script grammar.

COMMANDS:
    build       Generate and compile the parser (default)
    generate    Generate parser only (no compilation)
    test        Run grammar tests
    clean       Remove build artifacts
    help        Show this help message

EXAMPLES:
    $0              # Build everything
    $0 generate     # Just generate parser
    $0 test         # Run tests
    $0 clean        # Clean build files

For more information about Hercules Script, visit:
http://herc.ws - http://github.com/HerculesWS/Hercules
EOF
}

# Main script
main() {
    local command="${1:-build}"

    case "$command" in
        build)
            print_header
            check_dependencies
            install_dependencies
            generate_parser
            compile_parser || true  # Don't fail if compilation fails
            build_rust_bindings || true  # Don't fail if Rust build fails
            print_success "Build complete!"
            echo ""
            print_info "Parser is ready for use with Zed Editor"
            ;;
        generate)
            print_header
            check_dependencies
            install_dependencies
            generate_parser
            print_success "Parser generation complete!"
            ;;
        test)
            print_header
            check_dependencies
            install_dependencies
            generate_parser
            run_tests
            ;;
        clean)
            print_header
            clean
            ;;
        help|--help|-h)
            show_usage
            ;;
        *)
            print_error "Unknown command: $command"
            echo ""
            show_usage
            exit 1
            ;;
    esac
}

main "$@"
