function memo () {
    const iconBtn = document.getElementById('mode-btn');
    const memoArea = document.getElementById('memo-area');
    const cancel = document.getElementById('cancel-btn');
    const calendar = document.getElementById('calendar');
    
    iconBtn.addEventListener('click' , () => {
        memoArea.setAttribute("style", "display:block;");
        calendar.setAttribute("style", "display:none;");
    });

    cancel.addEventListener('click', () => {
        memoArea.setAttribute("style", "display:none;");
        calendar.setAttribute("style", "display:block;");
    });
};

window.addEventListener('load', memo);