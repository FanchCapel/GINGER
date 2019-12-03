export const openCategory = (evt) => {

  // Get all elements with class="tabcontent" and hide them
  const tabcontent = document.getElementsByClassName("tabcontent");
  for (let i = 0; i < tabcontent.length; i++) {
    if (tabcontent[i].parentElement.className.includes("dropzone")) {
      tabcontent[i].style.display = "block";
    } else {
      tabcontent[i].style.display = "none";
    }
  }

  // Get all elements with class="tablinks" and remove the class "active"
  const tablinks = document.getElementsByClassName("tablinks");
  for (let i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }

  // Show the current tab, and add an "active" class to the button that opened the tab
  const elements = document.querySelectorAll(`.${evt.currentTarget.id}`)
  elements.forEach((element) => {
    element.style.display = "block";
  })
  evt.currentTarget.className += " active";
}

export const categoryClick = () => {
  const tablinks = document.querySelectorAll('.tablinks')
  if (tablinks !== null) {
    tablinks.forEach((tablink) => {
    tablink.addEventListener('click', e => openCategory(e));
  });
  }
}

categoryClick();
