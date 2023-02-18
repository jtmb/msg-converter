function spinner() {
  const spinnerDisplayer = document.querySelector('.spinner-displayer');
  const btn = document.getElementById('search-button');

  btn.addEventListener('click', () => {
  spinnerDisplayer.classList.add('loading');
})
}

spinner();


function toggleText() {
  var text = document.getElementById("demo");
  if (text.style.display === "none") {
    text.style.display = "block";
  } else {
    text.style.display = "none";
  }
}