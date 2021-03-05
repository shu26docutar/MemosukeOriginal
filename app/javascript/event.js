$(function () {
    // comment
    $('.btn-comment').on('click', () => {
        $('#comment, #comment-lavel').show();
    });

    // place
    $('.btn-place').on('click', () => {
        $('#place, #place-lavel').show();
    });

    // url
    $('.btn-url').on('click', () => {
        $('#url, #url-lavel').show();
    });

    // search
    $('#search-btn').on('click', () => {
        $('.search-form').show();
    });
});
