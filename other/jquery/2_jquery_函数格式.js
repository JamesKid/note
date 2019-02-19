(function(){
	
	$(document).ready(function(){
		
		//ensure({js : '/assets/logs/datepicker.js'}, function(){
			__MC.timePickerlogs.bindPicker();
		//});
		
		});
	
	__MC.timePickerlogs = {
		bindPicker : function(){
			var params = {
				js : __MC.Conf.murl + '/uploads/js/datetimepicker/js/jquery-ui-timepicker-addon.js',
				css : __MC.Conf.murl + '/uploads/js/datetimepicker/css/jquery-ui.css'
			};
			
			var config = {
				dateFormat : 'yy-mm-dd',
				closeText: '关闭', 
				prevText: '<', 
				nextText: '>',
				currentText: '今天', 
				monthNames: ['一月','二月','三月','四月','五月','六月',
					'七月','八月','九月','十月','十一月','十二月'], 
				monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'], 
				dayNames: ['周日', '周一', '周二', '周三', '周四', '周五', '周六'], 
				dayNamesShort: ['日', '一', '二', '三', '四', '五', '六'],
				dayNamesMin: ['日', '一', '二', '三', '四', '五', '六'],
				weekHeader: 'Wk', 
				firstDay: 0, 
				isRTL: false, 
				showMonthAfterYear: true,
				format : 'Custom',
				CustomFormat : 'yyyy-MM-dd',
			};
			
			ensure(params, function(){
				$('#time').datepicker(config);
				$('#time2').datepicker(config);
			});
		},
		SetPic : function(){
			var uppic = $('#Busssellergoods_up_goods_pics').val();
			var gpic = $('#Busssellergoods_goods_pics').val();
			var picurl = null;
			
			if(uppic != ''){
				picurl = __MC.Conf.murl + '' + uppic;
				$('#tmppic').attr('src', picurl).show();
				$('.nopic').hide();
			}else if(gpic != ''){
				picurl = __MC.Conf.murl + '/uploads' + gpic;
				$('#tmppic').attr('src', picurl).show();
				$('.nopic').hide();
			}else{}
		},
	
	}
	
})();
