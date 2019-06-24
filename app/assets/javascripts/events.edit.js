$(document).on("turbolinks:load", function() {
  $('#eventEdit_form').validate({
      rules: {
          "event[name]": {
              required: true,
          },
          "event[place]": {
              required: true,
          },
          "event[date]": {
              required: true,
          },
          "event[cost]": {
              required: true,
              number: true
          },
          "event[capacity]": {
              required: true,
              number: true
          },
      },

      messages: {
          "event[name]": {
              required: "必須項目です、入力してください",
          },
          "event[place]": {
              required: "必須項目です、入力してください",
          },
          "event[date]": {
              required: "必須項目です、入力してください",
          },
          "event[cost]": {
              required: "必須項目です、入力してください",
              number: "半角の数字を入力してください"
          },
          "event[capacity]": {
              required: "必須項目です、入力してください",
              number: "半角の数字を入力してください"
          },
      },

      errorPlacement: function(error, element) {
          error.insertBefore(element);
      }
  });
});