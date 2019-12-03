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
    event.target.nextElementSibling.value = dragged.getAttribute('value');
  }
});
