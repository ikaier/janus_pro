// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

const unsavedLabel = document.querySelectorAll('#unsaved-label ');
  unsavedLabel.addEventListener('click', (event) => {
    unsavedLabel.firstElementChild.style.color = "#FF2021";
    unsavedLabel.lastElementChild.innerText = 'SAVED';
});

const savedLabel = document.querySelectorAll('#saved-label');
  savedLabel.addEventListener('click', (event) => {
    savedLabel.firstElementChild.style.color = "#545252";
    savedLabel.lastElementChild.innerText = 'SAVE';
});
