$(function () {
	var count = 0;
	$('button#sidebar-toggle-2').click();
	$('button#sidebar-toggle-2').click(function (e) {
		if (count % 2 == 0) {
			$('.fix-sidebar').width('100%');
			count = 1;
		}
		else {
			$('.fix-sidebar').width('calc(100% - 290px)');
			count = 2;
		}
	});

})