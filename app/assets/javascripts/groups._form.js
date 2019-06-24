$(document).on("turbolinks:load", function() {
  $('#group_form').validate({
      rules: {
          "group[name]": {
              required: true,
          },
          "group[summary]": {
              required: true,
          },
      },

      messages: {
          "group[name]": {
              required: "必須項目です、入力してください",
          },
          "group[summary]": {
              required: "必須項目です、入力してください",
          },
      },

      errorPlacement: function(error, element) {
          error.insertBefore(element);
      }
  });
});