//= require feelings
document.addEventListener("DOMContentLoaded", () => {
  const textarea = document.getElementById("feeling_dysphoria");
  const counter = document.getElementById("dysphoria_counter");

  if (textarea && counter) {
    textarea.addEventListener("input", () => {
      const remaining = 5000 - textarea.value.length;
      counter.textContent = `${remaining} caractères restants`;
    });
  }
});

document.querySelectorAll('.feeling-item input[type="checkbox"]').forEach(cb => {
  cb.addEventListener('change', (e) => {
    const label = e.target.closest('.feeling-item');
    if (e.target.checked) {
      label.classList.add('selected');
    } else {
      label.classList.remove('selected');
    }
  });
});
