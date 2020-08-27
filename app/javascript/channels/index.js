// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

const saveProduct = document.querySelectorAll('#unsaved-label');
  saveProduct.forEach((item) => {
    item.addEventListener('click', (event) => {
      item.firstElementChild.style.color = "#FF2021";
      item.lastElementChild.innerText = 'SAVED';
  })
});

const unsaveProduct = document.querySelectorAll('#saved-label');
  unsaveProduct.forEach((item) => {
    item.addEventListener('click', (event) => {
      item.firstElementChild.style.color = "#545252";
      item.lastElementChild.innerText = 'SAVE';
  })
});
