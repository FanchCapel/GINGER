export const selectorEvents = () => {
  const activities = document.querySelectorAll('.act');
  activities.forEach((activity) => {
    activity.addEventListener('change', e => priceUpdate(e));
  });
}

export const priceUpdate = (e) => {
  const prix = document.querySelector('#prix');
  const activities = document.querySelectorAll('.act');
  const activity_ids = [];
  activities.forEach((activity) => {
    if (activity.value !== "") {
      activity_ids.push(activity.value);
    }
  });
  console.log(activity_ids);
  fetch(`/activities/calculate_price`, {
    method: "POST",
    headers: { 'X-CSRF-Token': document.querySelector("input[name='authenticity_token']").value, 'Content-type': "application/json" },
    body: JSON.stringify({ activity_ids: activity_ids })
  })
  .then(response => response.json())
  .then((data) => {
    prix.innerHTML = data["amount"]
  });
}

selectorEvents();
