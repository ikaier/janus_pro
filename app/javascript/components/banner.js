import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Shop and Save on Millions of Products", "From your Favorite Stores"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
