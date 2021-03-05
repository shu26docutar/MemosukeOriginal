function icon () {
    const faceBtn = document.getElementById('face-btn');
    const navBar = document.getElementById('navbar');
    var count = 0;
    
    faceBtn.addEventListener('mouseover', () => {
        navBar.setAttribute("style", "display:block;");
        count += 1;
        if ((count % 2) == 0) {
            navBar.removeAttribute("style", "display:none;")
          } else {
            navBar.setAttribute("style", "display:block;")
          };
    });
};

window.addEventListener('load', icon);