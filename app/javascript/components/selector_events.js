export const selectorEvents = () => {
  const activities = document.querySelectorAll('.act');
  activities.forEach((activity) => {
    activity.addEventListener('change', e => priceUpdate(e));
  });
}

export const priceUpdate = (e) => {
  const activity_ids = [];
  document.querySelectorAll('.act').forEach((activity) => {
    if (activity.value !== "") {
      activity_ids.push(activity.value);
    }
  });
  fetch('/activities/calculate_experience', {
    method: "POST",
    headers: { 'X-CSRF-Token': document.querySelector("input[name='authenticity_token']").value, 'Content-type': "application/json" },
    body: JSON.stringify({ activity_ids: activity_ids })
  })
  .then(response => response.json())
  .then((data) => {
    document.querySelector('#prix').innerHTML = data["amount"]
    document.querySelector('#duration').innerText = `${Math.floor(data["duration"] / 60)} h ${data["duration"] % 60} min`
  });
}

selectorEvents();
