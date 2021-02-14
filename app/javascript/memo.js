function memo () {
    const iconBtn = document.getElementById('add-btn');
    const memoArea = document.getElementById('memo-area');
    iconBtn.addEventListener('click' , () => {
        memoArea.setAttribute("style", "display:block;");
    });
};

window.addEventListener('load', memo);