module.exports = grammar({
    name: 'hercscript',

    // externals: $ => [
    //     $.npc_name
    // ],

    extras: $ => [
        /\s/,
        $.comment,
    ],

    conflicts: $ => [
        [$.function_stmt, $._expression],
    ],

    rules: {
        source_file: $ => repeat(choice(
            $.script_def,
            $.block
        )),

        script_def: $ => seq(
            $.position,
            //'\t',
            'script',
            //'\t',
            $.npc_name,
            //'\t',
            $.npc_sprite,
            optional(seq(',', $.npc_area)),
            ',',
            $.block
        ),

        position: $ => choice(
            seq(
                field('map', $.identifier),
                ',',
                field('x', $.number),
                ',',
                field('y', $.number),
                ',',
                field('direction', $.number)
            ),
            '-'
        ), // TODO : direction is optional for portals

        npc_name: $ => /[^\t\s,]+/,
        
        npc_sprite: $ => /[^\t\s,]+/,

        npc_area: $ => seq(
            $.number, ',', $.number
        ),

        block: $ => seq(
            '{',
            repeat($._statement),
            '}'
        ),

        _statement: $ => choice(
            $.return_statement,
            $.break_stmt,
            $.continue_stmt,
            $.if_stmt,
            $.switch_stmt,
            $.for_stmt,
            $.while_stmt,
            $.do_while_stmt,
            seq($.function_stmt, ';'),
            $.block,
            seq($.assignment_stmt, ';'),
            $.label,
            $.goto_stmt,
            // TODO: other kinds of statements
        ),

        function_stmt: $ => seq(
            $.identifier,
            optional($.parameter_list),
        ),

        parameter_list: $ => seq(
            '(',
            optional($._param),
            ')'
        ),

        _param: $ => seq(
            $._expression,
            optional(seq(',', optional($._param)))
        ),

        if_stmt: $ => prec.right(seq(
            'if',
            '(',
            $._expression,
            ')',
            $._statement,
            optional(seq('else', $._statement))
        )),
        
        for_stmt: $ => seq(
            'for',
            '(',
            optional($.assignment_stmt),
            ';',
            optional($._expression),
            ';',
            optional($.assignment_stmt),
            ')',
            $._statement
        ),
        
        while_stmt: $ => seq(
            'while',
            '(',
            $._expression,
            ')',
            $._statement
        ),
        
        do_while_stmt: $ => seq(
            'do',
            $._statement,
            'while',
            '(',
            $._expression,
            ')',
            ';'
        ),
        
        label: $ => seq(
            choice('OnInit', 'OnInterIfInit', 'OnInterIfInitOnce', $.identifier),
            ':'
        ),
        
        goto_stmt: $ => seq(
            'goto',
            $.identifier,
            ';'
        ),

        switch_stmt: $ => seq(
            'switch',
            '(', $._expression, ')',
            alias($.switch_body, $.block)
        ),

        switch_body: $ => seq(
            '{',
            repeat(choice($.case_stmt, $._statement)),
            '}'
        ),

        case_stmt: $ => prec.right(seq(
            choice(
                seq('case', $._expression),
                'default'
            ),
            ':',
            repeat($._statement)
        )),

        break_stmt: $ => seq(
            'break',
            ';'
        ),
        
        continue_stmt: $ => seq(
            'continue',
            ';'
        ),

        return_statement: $ => seq(
            'return',
            optional($._expression),
            ';'
        ),

        assignment_stmt: $ => prec.right(7, seq($.identifier, choice('=', '+=', '-=', '*=', '**=', '/=', '%=', '<<=', '>>=', '&=', '^=', "|="), $._expression)),

        _expression: $ => choice(
            $.function_stmt,
            $.mulop,
            $.plusop,
            $.compareop,
            $.bitwiseop,
            $.logicalop,
            $.ternary,
            $.number,
            $.identifier,
            $.string,
            seq('(', $._expression, ')')
            // TODO: other kinds of expressions
        ),

        mulop: $ => prec.left(1, seq($._expression, choice('*', '/'), $._expression)),
        plusop: $ => prec.left(2, seq($._expression, choice('+', '-'), $._expression)),
        compareop: $ => prec.left(3, seq($._expression, choice('<', '<=', '>', '>=', '==', '!=', '~=', '~!'), $._expression)),
        bitwiseop: $ => prec.left(4, seq($._expression, choice('&', '^', '|'), $._expression)),
        logicalop: $ => prec.left(5, seq($._expression, choice('&&', '||'), $._expression)),
        ternary: $ => prec.right(6, seq($._expression, '?', $._expression, ':', $._expression)),


        number: $ => /\d+/,
        string: $ => /"[^"]*"/,
        identifier: $ => choice(
            /\$@[a-zA-Z_][a-zA-Z0-9_]*\$?/,
            /\.@[a-zA-Z_][a-zA-Z0-9_]*\$?/,
            /##[a-zA-Z_][a-zA-Z0-9_]*\$?/,
            /\$[a-zA-Z_][a-zA-Z0-9_]*\$?/,
            /@[a-zA-Z_][a-zA-Z0-9_]*\$?/,
            /\.[a-zA-Z_][a-zA-Z0-9_]*\$?/,
            /'[a-zA-Z_][a-zA-Z0-9_]*\$?/,
            /#[a-zA-Z_][a-zA-Z0-9_]*\$?/,
            /[a-zA-Z_][a-zA-Z0-9_]*\$?/
        ),

        // http://stackoverflow.com/questions/13014947/regex-to-match-a-c-style-multiline-comment/36328890#36328890
        comment: $ => token(choice(
            seq('//', /(\\[.\n]|[^\\\n])*/),
            seq(
                '/*',
                /[^*]*\*+([^/*][^*]*\*+)*/,
                '/'
            )
        )),
    }
});