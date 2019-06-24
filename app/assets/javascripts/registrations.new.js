$(document).on("turbolinks:load", function() {
  $('#user_signUp').validate({
      rules: {
          "user[name]": {
              required: true
          },
          "user[email]": {
              required: true,
              email: true,
          },
          "user[password]": {
              required: true,
              minlength: 6
          },
          "user[password_confirmation]": {
              required: true,
              minlength: 6,
              equalTo: "#user_password"
          },
      },

      messages: {
          "user[name]": {
              required: "必須項目です、入力してください"
          },
          "user[email]": {
              required: "必須項目です、入力してください",
              email: "Eメールの形式で入力してね"
          },
          "user[password]": {
              required: "必須項目です、入力してください",
              minlength: "パスワードは6文字以上で入力してください"
          },
          "user[password_confirmation]": {
              required: "必須項目です、入力してください",
              minlength: "パスワードは6文字以上で入力してください",
              equalTo: "Password欄と同じ値を入力してください"
          },
      },

      errorPlacement: function(error, element) {
          error.insertBefore(element);
      }
  });
});