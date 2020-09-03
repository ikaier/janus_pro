const loadingEvent = () => {
  const form_input = document.querySelector("#search_form");
  const loading_block = document.querySelector("#loading_block");
  const canvas_screen = document.querySelector("#canvas_screen");

  form_input.addEventListener('submit', (event) => {
      event.preventDefault();
      loading_block.classList.toggle("lds-circle");
      //canvas_screen.classList.toggle("running");

      form_input.submit();
  });
}

export { loadingEvent }
