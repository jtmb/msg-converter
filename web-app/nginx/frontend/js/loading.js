function spinner() {
    const spinnerDisplayer = document.querySelector('.spinner-displayer');
    const btn = document.getElementById('search-button2');

    btn.addEventListener('click', () => {
    spinnerDisplayer.classList.add('loading');
  })
}

spinner();