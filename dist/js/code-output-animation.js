$(function() {
    var $codeBlock = $("#code-output"),
        $text = $('#code-output pre'),
        codeLines = [];


    // set fixed height so with empty code lines it's the same
    var h = $codeBlock.height();
    $codeBlock.height(h);


    $text.each(function(i, line) {
        // save code 
        codeLines.push($(line).html());
        // empty code line
        $(line).html('');
    });

    $text.each(function(i, line) {
        var chars = codeLines[i].split('');
        var newText = '';
        chars.forEach(function(char, j) {
            setTimeout(function() {
                newText = newText + char;
                $(line).html(newText);
            }, 100 * j);            
        });
    });

});