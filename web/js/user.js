/**
 *  USER FUNCTION
 */
document.charset="euc-kr";
$('#user-register').submit((e)=>{
	console.log('user-register start');
    var email = $('input[name=joinEmail]').val();   
	var name = $('input[name=joinName]').val();
	var phone = $('input[name=joinPhone]').val();
	var pwd = $('input[name=joinPwd]').val();
	var repwd = $('input[name=joinPwdRe]').val();
	if (pwd !== repwd) return;
	$.ajax({
		url: 'userregisteraction.mw',
		method: 'POST',
		data: {
			'email':email,
			'name': name,
			'phone':phone,
			'pwd':pwd
		},
		success: (data)=>{
			$("#Register").modal('hide');
			$("#RegisterWelcome").modal('show');
			
			$('input[name=myPhone]').attr('placeholder',data[0].phone);
			console.log(data);
			var str = '';
			str += '<h3><b>' + data[0].name +'</b>님, 가입하신 것을 환영합니다. </h3>';
			str += '<h4>아래와 같은 내용으로 가입하셨습니다.</h4>';
			str += '<h5>로그인 ID: '+data[0].email+'</h5>';
			str += '<h5>휴대폰 번호: '+data[0].phone+'</h5>';
			str += '<h5>가입 날짜: '+data[0].regdate+'</h5>';
			$('#RegisterWelcome .modal-body').html(
				str
			);
		},
		error: (err)=>{
			$('#Register').find('button:eq(-1)').css({
				"background-color": "#FE5F55",
				"border-color": "red"
			});
			setTimeout(function() {
				$('#Register').find('button:eq(-1)').css({
					"background-color": "#28a745",
					"border-color": "#1e7e34"
				});
			}, 500);
		},
		dataType: 'json'
    });
    e.preventDefault(); // avoid to execute the actual submit of the form.
});

$('#user-login').submit((e)=>{
	console.log('user-login start');
	var email = $('#loginEmail').val();
	var pwd = $('#loginPwd').val();
	$.ajax({
		url: 'loginaction.mw',
		method: 'POST',
		data:{
			'email':email,
			'pwd':pwd
		},
		success: (data)=>{
			if (data[0].status === 'fail') {
				$('#Login').find('button:eq(-1)').css({
					"background-color": "#FE5F55",
					"border-color": "red"
				});
				setTimeout(function() {
					$('#Login').find('button:eq(-1)').css({
						"background-color": "#28a745",
						"border-color": "#1e7e34"
					});
				}, 500);
			}
			else if (data[0].status === 'pass') {
	            $("#Login").modal('hide');
	            location.href="main.mw";
			}
		},
		error: (err)=>{
			console.log(err);
		},
		dataType:'json'							
	});
	e.preventDefault(); // avoid to execute the actual submit of the form.
});

$('#user-modify').submit((e)=>{
	console.log('user-modify start');
	var email = state.id;
	var phone = $('input[name=myPhone]').val();
	var pwd = $('input[name=myChnPwd]').val();
	var conpwd = $('input[name=myConPwd]').val();
	if (pwd !== conpwd || pwd === ''){
		$('#MyInfo').find('button:eq(-1)').css({
			"background-color": "#FE5F55",
			"border-color": "red"
		});
		setTimeout(function() {
			$('#MyInfo').find('button:eq(-1)').css({
				"background-color": "#28a745",
				"border-color": "#1e7e34"
			});
		}, 500);
	}
	else {
		$.ajax({
			url: 'usermodify.mw',
			method: 'POST',
			data:{
				'email':email,
				'phone':phone,
				'pwd':pwd
			},
			success: (data)=>{
       	    	$('#MyInfo').modal('hide');
       	    	$('#RegisterWelcome').modal('show');
            	var str = '';
				str += '<h3><b>' + data[0].name +'</b>님,</h3>';
				str += '<h4>아래와 같은 내용으로 변경하셨습니다.</h4>';
				str += '<h5>로그인 ID: '+data[0].email+'</h5>';
				str += '<h5>휴대폰 번호: '+data[0].phone+'</h5>';
				str += '<h5>가입 날짜: '+data[0].regdate+'</h5>';
            	$('#RegisterWelcome .modal-body').html(
						str
				);
			},
			error: (err)=>{
				console.log(err);
				//alert('error');
			},
			dataType:'json'							
		});
	}
	e.preventDefault(); // avoid to execute the actual submit of the form.
});