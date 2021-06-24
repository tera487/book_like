function toggle_password() {
  const checked = $("input#user_password_reset").prop("checked");
  $(".password_fields").toggle(checked);
}


$(document).on("ready turbolinks:load", () => {
  toggle_password();
  $("input#user_password_reset").on("click", () => {
    toggle_password();
  });
});