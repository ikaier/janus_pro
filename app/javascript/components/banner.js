import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Shop and Save on Millions of Products", "With just ONE CLICK!"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
