#include <stdlib.h>
#include <string.h>
#include <tree_sitter/parser.h>

// Order must match grammar.js external
enum TokenType
{
    NPC_NAME,
};

#define MAX_NAME_LENGTH 48

struct npc_name_str {
    char name[MAX_NAME_LENGTH];
    unsigned length;
};

void *tree_sitter_hercscript_external_scanner_create()
{
    struct npc_name_str *scanner = malloc(sizeof(struct npc_name_str));
    scanner->length = 0;
    scanner->name[0] = '\0';
    return scanner;
}

void tree_sitter_hercscript_external_scanner_destroy(void *payload)
{
    free(payload);
}

unsigned tree_sitter_hercscript_external_scanner_serialize(
    void *payload,
    char *buffer)
{
    struct npc_name_str *scanner = (struct npc_name_str *) payload;
    
    // Ensure we don't exceed buffer limits (Tree-sitter max is 1024)
    unsigned length = scanner->length;
    if (length > MAX_NAME_LENGTH - 1) {
        length = MAX_NAME_LENGTH - 1;
    }
    
    if (length > 0) {
        memcpy(buffer, scanner->name, length);
    }
    
    return length;
}

void tree_sitter_hercscript_external_scanner_deserialize(
    void *payload,
    const char *buffer,
    unsigned length)
{
    struct npc_name_str *scanner = (struct npc_name_str *) payload;
    
    // Ensure we don't overflow our buffer
    if (length > MAX_NAME_LENGTH - 1) {
        length = MAX_NAME_LENGTH - 1;
    }
    
    if (length > 0) {
        memcpy(scanner->name, buffer, length);
    }
    scanner->name[length] = '\0';
    scanner->length = length;
}

bool tree_sitter_hercscript_external_scanner_scan(
    void *payload,
    TSLexer *lexer,
    const bool *valid_symbols
) {
    struct npc_name_str *scanner = (struct npc_name_str *) payload;
    unsigned i = 0;

    if (valid_symbols[NPC_NAME]) {
        // Reset scanner state
        scanner->length = 0;
        scanner->name[0] = '\0';
        
        // Skip leading whitespace except tabs
        while (lexer->lookahead == ' ' || lexer->lookahead == '\r' || lexer->lookahead == '\n') {
            lexer->advance(lexer, true);
        }
        
        // Scan NPC name until we hit a tab or reach max length
        while (lexer->lookahead && i < MAX_NAME_LENGTH - 1) {
            // Stop at tab (field delimiter) or newline
            if (lexer->lookahead == '\t' || lexer->lookahead == '\n' || lexer->lookahead == '\r') {
                if (i > 0) {
                    scanner->name[i] = '\0';
                    scanner->length = i;
                    lexer->mark_end(lexer);
                    lexer->result_symbol = NPC_NAME;
                    return true;
                }
                break;
            }
            
            scanner->name[i++] = lexer->lookahead;
            lexer->advance(lexer, false);
        }
        
        // If we collected something but hit max length, still return it
        if (i > 0) {
            scanner->name[i] = '\0';
            scanner->length = i;
            lexer->mark_end(lexer);
            lexer->result_symbol = NPC_NAME;
            return true;
        }
    }
    
    return false;
}