$(function(){
	$('#dangNhaTroLink').click(function(e){
		e.stopPropagation();
		$('#loginLink').trigger("click");
		$('#showLoginToPostMotel').centerFixed();
		$('#showLoginToPostMotel').fadeIn(100).delay(5000).fadeOut(1000);
		$('#menuLoginForm #username').focus();
		//alert("OK");
	});
	$('#menuLoginForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                validators: {
                    notEmpty: {
                        message: 'Bạn quên chưa nhập tài khoản'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'Mật khẩu không được rỗng'
                    }
                }
            }
        }
    })
    .on('error.field.bv', function(e, data) {
        // Get the tooltip
        var $parent = data.element.parents('.form-group'),
            $icon   = $parent.find('.form-control-feedback[data-bv-icon-for="' + data.field + '"]'),
            title   = $icon.data('bs.tooltip').getTitle();

        // Destroy the old tooltip and create a new one positioned to the right
        $icon.tooltip('destroy').tooltip({
            html: true,
            placement: 'left',
            title: title,
            container: 'body'
        });
    });
	$('#form-dang-ki').bootstrapValidator({
		feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	diaChi: {
                validators: {
                    notEmpty: {
                        message: 'Bạn quên chưa nhập địa chỉ!'
                    }
                }
            },
            soDt: {
                validators: {
                	digits: {
                        message: 'Số điện thoại chỉ chứa các số!'
                    },
                    notEmpty: {
                        message: 'Số điện thoại không được rỗng!'
                    }
                }
            }
        }
	});
})