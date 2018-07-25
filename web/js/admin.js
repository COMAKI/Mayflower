/**
 *  ADMIN FUNCTION
 */
document.charset="euc-kr";
$('.btn-admin').on({
	click: function(e) {
			console.log('requestAPI button clicked');
			var index = $( '.btn-admin' ).index( this );
			console.log('btn-admin index: '+index);
			if(index == 0){
				$('#RequestResult .modal-body').html(
						'<h3> Waiting for a result </h3>'
				);
				$("#RequestResult").modal('show');
				$.ajax({
					url: 'requestAPI.mw',
					method: 'GET',
					success: (data)=>{
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
			}
            e.preventDefault(); // avoid to execute the actual submit of the form.
		},
		mouseenter: function(){
			$(this).css({
				"color":"white",
				"background-color": "#28a745",
				"border-color": "#1e7e34"
			});
			$(this).fadeOut(100);
			$(this).fadeIn(500);
		},
		mouseleave: function(){
			$(this).css({
				"color":"black",
				"background-color": "#dddddd",
				"border-color": "#dddddd"
			});
		}
});
/*,
hover: function(){
	console.log('hover');
}*/
