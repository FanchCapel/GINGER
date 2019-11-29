export const sliderValue = () => {
  const slider = document.getElementById("exp-preferences");
  const sliderForm = document.querySelector(".slider-form");
  slider.addEventListener('change', event => {
    Rails.fire(sliderForm, 'submit');
  });
}

sliderValue();
