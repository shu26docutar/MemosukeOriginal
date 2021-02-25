function memo () {
    const iconBtn = document.getElementById('add-btn');
    const memoArea = document.getElementById('memo-area');
    const cancel = document.getElementById('cancel-btn');
    iconBtn.addEventListener('click' , () => {
        memoArea.setAttribute("style", "display:block;");
    });

    cancel.addEventListener('click', () => {
        memoArea.setAttribute("style", "display:none;");
    });
};

window.addEventListener('load', memo);