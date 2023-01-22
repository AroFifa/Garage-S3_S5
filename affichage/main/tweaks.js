window.addEventListener('load',function () {
    function removeAnimation(card) {
        card.addEventListener('animationend',function () {
            card.classList.remove('animate__animated','animate__fadeInDown');
        })
      
    }
    var card=this.document.querySelectorAll("div.card");
    for (let i = 0; i < card.length; i++) {
        removeAnimation(card[i]);
    }

    function showMe() {
    var card=this.document.querySelectorAll("div.card");
        for (let i = 0; i < card.length; i++) {
            console.log("hshagsa");
            card[i].addEventListener('hover',function () {
                var h4=card[i].firstChild;
                console.log("kakana");
                h4.style.display="block";
            });
        }
    }
    showMe();
});