function admins_toggle_password() {
  const admins_checked = $("input#admin_password_reset").prop("checked");
  $(".admins_password_fields").toggle(admins_checked);
}


$(document).on("ready turbolinks:load", () => {
  admins_toggle_password();
  $("input#admin_password_reset").on("click", () => {
    admins_toggle_password();
  });
});