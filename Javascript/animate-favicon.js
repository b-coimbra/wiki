function animate_favicon () {
    if ($('link[rel$=icon]').attr("href") == 'f1.png') {
        $('link[rel$=icon]').remove();
        $('head').append($('<link rel="shortcut icon" type="image/x-icon"/>').attr( 'href', "f2.png" ) );
    } else {
        $('link[rel$=icon]').remove();
        $('head').append($('<link rel="shortcut icon" type="image/x-icon"/>').attr( 'href', "f1.png" ) );
    }
    
    setTimeout(animate_favicon, 600);
}

setTimeout(animate_favicon, 600);
