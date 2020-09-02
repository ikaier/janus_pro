// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

const counter = document.querySelector('#count');
  const saveProduct = document.querySelectorAll('#unsaved-label');
  saveProduct.forEach((item) => {
    item.addEventListener('click', (event) => {
      counter.innerText = parseInt(counter.textContent) + 1;
      item.firstElementChild.style.color = "#FF2021";
    })
});

const navbar = document.querySelector(".navbar");
window.onscroll = () => {
    if (window.scrollY > 300) {
        navbar.classList.add('navbar-active');
        navbar.classList.remove('navbar-inactive');
    } else {
        navbar.classList.remove('navbar-active');
        navbar.classList.add('navbar-inactive');
    }
};
