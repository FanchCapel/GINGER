export const openCategory = (evt) => {

  console.log(evt);

  // Get all elements with class="tabcontent" and hide them
  const tabcontent = document.getElementsByClassName("tabcontent");
  for (let i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
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

// -----------------------------------------------------------------------------

let dragged;

  /* events fired on the draggable target */
  document.addEventListener("drag", (event) => {

  });

  document.addEventListener("dragstart", (event) => {
    // store a ref. on the dragged elem
    dragged = event.target;
    // make it half transparent
    event.target.style.opacity = .5;
  });

  document.addEventListener("dragend", (event) => {
    // reset the transparency
    event.target.style.opacity = "";
  });

  /* events fired on the drop targets */
  document.addEventListener("dragover", (event) => {
    // prevent default to allow drop
    event.preventDefault();
  });

  document.addEventListener("dragenter", (event) => {
    // highlight potential drop target when the draggable element enters it
    if ( event.target.className.includes("dropzone")) {
      event.target.style.background = "purple";
    }
  });

  document.addEventListener("dragleave", (event) => {
    // reset background of potential drop target when the draggable element leaves it
    if ( event.target.className.includes("dropzone")) {
      event.target.style.background = "";
    }
  });

  document.addEventListener("drop", (event) => {
    event.preventDefault();
    // move dragged elem to the selected drop target
    if ( event.target.className.includes("dropzone")) {
      event.target.style.background = "";
      dragged.parentNode.removeChild( dragged );
      event.target.appendChild( dragged );
    }
  });
