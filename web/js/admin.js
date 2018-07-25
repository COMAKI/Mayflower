/**
 *  ADMIN FUNCTION
 */
document.charset="euc-kr";
$('.btn:eq(0)').on({
		click: function(e){
			console.log('requestAPI button clicked');
			$.ajax({
				url: 'requestAPI.mw',
				method: 'GET',
				success: (data)=>{
					$("#RequestResult").modal('show');
					var str = '';
					if (data.status === 'fail') {
						str += '<h3 style="color:#FE5F55;">'
								+ 'Cannot REQUEST API on data.go.kr'
								+'</h3>';
						
					} else if (data.status === 'pass') {
						str += '<h3>REQUEST RESULT</h3>'
								+'<h4>REQUEST COUNT: '+ data.count+'</h>';
					};
					$('#RequestResult .modal-body').html(
							str
					);
				},
				error: (err)=>{
					console.log(err);
				},
				dataType: 'json'
            });
            e.preventDefault(); // avoid to execute the actual submit of the form.
		}
});
