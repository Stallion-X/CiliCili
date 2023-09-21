/*global $, document, window, setTimeout, navigator, console, location*/
$(document).ready(function () {

  'use strict';

  var usernameError = true,
  passwordError = true,
  passConfirm = true;

  // Detect browser for css purpose
  if (navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
    $('.form form label').addClass('fontSwitch');
  }

  // Label effect
  $('input').focus(function () {

    $(this).siblings('label').addClass('active');
  });

  // Form validation
  $('input').blur(function () {

    // User Name
    if ($(this).hasClass('name')) {
      if ($(this).val().length === 0) {
        $(this).siblings('span.error').text('请输入您的用户名').fadeIn().parent('.form-group').addClass('hasError');
        usernameError = true;
      }else {
        $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
        usernameError = false;
      }
    }
    // Nick Name
    if ($(this).hasClass('nick')) {
      if ($(this).val().length === 0) {
        $(this).siblings('span.error').text('请输入您的昵称').fadeIn().parent('.form-group').addClass('hasError');
        usernameError = true;
      }else {
        $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
        usernameError = false;
      }
    }
    // Email
    if ($(this).hasClass('email')) {
      if ($(this).val().length == '') {
        $(this).siblings('span.error').text('请输入您的邮箱').fadeIn().parent('.form-group').addClass('hasError');
      } else {
        $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
      }
    }

    // PassWord
    if ($(this).hasClass('pass')) {
      if ($(this).val().length < 8) {
        $(this).siblings('span.error').text('请输入8位以上').fadeIn().parent('.form-group').addClass('hasError');
        passwordError = true;
      } else {
        $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
        passwordError = false;
      }
    }

    // PassWord confirmation
    if ($('.pass').val() !== $('.passConfirm').val()) {
      $('.passConfirm').siblings('.error').text('密码不一致').fadeIn().parent('.form-group').addClass('hasError');
      passConfirm = true;
    } else {
      $('.passConfirm').siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
      passConfirm = false;
    }

    // label effect
    if ($(this).val().length > 0) {
      $(this).siblings('label').addClass('active');
    } else {
      $(this).siblings('label').removeClass('active');
    }
  });


  // form switch
  $('a.switch').click(function (e) {
    $(this).toggleClass('active');
    e.preventDefault();

    if ($('a.switch').hasClass('active')) {
      $(this).parents('.form-peice').addClass('switched').siblings('.form-peice').removeClass('switched');
    } else {
      $(this).parents('.form-peice').removeClass('switched').siblings('.form-peice').addClass('switched');
    }
  });


  // Form submit
  $('form.signup-form').submit(function (event) {
    event.preventDefault();

    if (usernameError == true || passwordError == true || passConfirm == true) {
      $('.name, .email, .pass, .passConfirm').blur();
    } else {
      var formData = new FormData($('form.signup-form')[0]);
      axios.post(
          '/signup',
          formData,
          {
            headers:{'Content-Type':'multipart/form-data'}
          }
      ).then(function(data) {
        return data.data;
      })
      $('.signup, .login').addClass('switched');
      setTimeout(function () {$('.signup, .login').hide();}, 700);
      setTimeout(function () {$('.brand').addClass('active');}, 300);
      setTimeout(function () {$('.heading').addClass('active');}, 600);
      setTimeout(function () {$('.success-msg p').addClass('active');}, 900);
      setTimeout(function () {$('.success-msg a').addClass('active');}, 1050);
      setTimeout(function () {$('.form').hide();}, 700);


    }
  });
  $('a.profile').on('click', function () {
    location.reload(true);
  });
});
//# sourceURL=pen.js
//修改信息
$("#information-1").click(function(){
  var sex= $("#sex1").val();
 /* var nickname= $("#nickname1").val();
  var phone= $("#phone1").val();
  var birth= $("#birth1").val();
  var uid= $("#uid").val();
  var email = $('#email').val();
  var signature = $('#signature').val();
  var avatar = $('#avatar').val();*/
  let info1frmdata = new FormData($('#infomation1frm')[0]);
  if(sex==null||sex==""){
    let vm = new Vue({
      el:"#app",
      mounted() {
        this.$alert('请输入内容！', '提示',{
          confirmButtonText: '确定',
          callback: action => {
          }
        });
      }
    });
  }
  else {
    axios.post(
        "/information1",
        info1frmdata,
        {
          headers:{'Content-Type':'multipart/form-data'}
        }
    ).then(function(){
      location.reload();
    });
  }
});
//修改密码
$("#information-2").click(function(){
  var pwd1=$("#password").val();
  var pwd2=$("#passwordCon").val();
  var formData = new FormData($('#frm')[0]);
  var pwd = $('#pwd').val();
  var oldcheck = new FormData();
  oldcheck.append("uid",$("#uid").val());
  oldcheck.append("oldpwd",pwd);
  if(pwd1!=pwd2){
    let vm = new Vue({
      el:"#app",
      mounted() {
        this.$alert('新旧密码不相等！', '提示',{
          confirmButtonText: '确定',
          callback: action => {
          }
        });
      }
    });
  }else if (pwd1==null||pwd1==""||pwd1.length<8||pwd2.length<8){
    let vm = new Vue({
      el:"#app",
      mounted() {
        this.$alert('密码不能小于8位！', '提示',{
          confirmButtonText: '确定',
          callback: action => {
          }
        });
      }
    });
  }else {
    axios.post(
        '/oldCheck',
        oldcheck,
        {
          headers:{'Content-Type':'multipart/form-data'}
        }
    ).then(function(res) {
      if (res.data == 'success') {
        axios.post(
            '/information2',
            formData,
            {
              headers:{'Content-Type':'multipart/form-data'}
            }
        ).then(function(res2) {
          if (res2.data == 'success') {
            location.reload();
          }
        });
      }
      else {
        let vm = new Vue({
          el:"#app",
          mounted() {
            this.$alert('旧密码验证失败！', '提示',{
              confirmButtonText: '确定',
              callback: action => {
              }
            });
          }
        });
      }
    });
    /*$.ajax({
      url: '/information2',
      type: 'post',
      processData: false,
      contentType: false,
      data: formData,
      success: function () {
        location.reload();
      }
    });*/
  }
});
$('#vinfobtn').click(function() {
  var formData = new FormData($('#frmvinfo')[0]);
  axios.post(
      '/editUploadInfo',
      formData,
      {
        headers:{'Content-Type':'multipart/form-data'}
      }
  ).then(function(res) {
    if (res.data == 'success') {
      location.reload();
    }
  });
});
$('#vfilebtn').click(function() {
  var formData = new FormData($('#frmfile')[0]);
  axios.post(
      '/editUploadFile',
      formData,
      {
        headers:{'Content-Type':'multipart/form-data'}
      }
  ).then(function(res) {
    if (res.data == 'success') {
      location.reload();
    }
    else {
      console.log(res.data);
    }
  });
});