window.onload = () => {
    if(document.getElementById('ans-one')) {


        document.getElementById('ans-one').addEventListener('click', () => {
            document.getElementById('ans-two').checked = false;
            if (document.getElementById('ans-one').checked == false &&
            document.getElementById('ans-two').checked == false) {
                document.querySelector("#select_answer").disabled = true;
                document.querySelector('.error-box').style.display = "block";
            } else {
                document.querySelector("#select_answer").disabled = false;
                document.querySelector('.error-box').style.display = "none";
            }
        });
    
        document.getElementById('ans-two').addEventListener('click', () => {
            document.getElementById('ans-one').checked = false;
            if (document.getElementById('ans-one').checked == false &&
            document.getElementById('ans-two').checked == false) {
                document.querySelector("#select_answer").disabled = true;
                document.querySelector('.error-box').style.display = "block";
            } else {
                document.querySelector("#select_answer").disabled = false;
                document.querySelector('.error-box').style.display = "none";
            }
        });

        
    }


}

