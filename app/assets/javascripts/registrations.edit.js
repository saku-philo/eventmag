$(document).on("turbolinks:load", function() {
  $('#user_edit').validate({
      rules: {
          "user[email]": {
              required: true,
              email: true,
          },
          "user[password]": {
              minlength: 6
          },
          "user[password_confirmation]": {
              minlength: 6,
              equalTo: "#user_password"
          },
          "user[current_password]": {
            required: true
        },
      },

      messages: {
          "user[email]": {
              required: "必須項目です、入力してください",
              email: "Eメールの形式で入力してね"
          },
          "user[password]": {
              minlength: "パスワードは6文字以上で入力してください"
          },
          "user[password_confirmation]": {
              minlength: "パスワードは6文字以上で入力してください",
              equalTo: "Password欄と同じ値を入力してください"
          },
          "user[current_password]": {
            required: "必須項目です、入力してください"
          }
      },

      errorPlacement: function(error, element) {
          error.insertBefore(element);
      }
  });
});