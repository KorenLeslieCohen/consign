(function($) {
	$.fn.FlowupLabels = function( options ){
	
		var defaults = {
				feature_onLoadInit: false,
				class_focused: 		'focused',
				class_populated: 	'populated'
			},
			settings = $.extend({}, defaults, options);

		return this.each(function(){
			var $scope  = $(this);
	
			$scope.on('focus.flowupLabelsEvt', '.fl_input', function() {
				$(this).closest('.fl_wrap').addClass(settings.class_focused);
			})
			.on('blur.flowupLabelsEvt', '.fl_input', function() {
				var $this = $(this);
				
				if ($this.val().length) {
					$this.closest('.fl_wrap')
						.addClass(settings.class_populated)
						.removeClass(settings.class_focused);
				} 
				else {
					$this.closest('.fl_wrap')
						.removeClass(settings.class_populated + ' ' + settings.class_focused);
				}
			});

			if (settings.feature_onLoadInit) {
				$scope.find('.fl_input').trigger('blur.flowupLabelsEvt');
			}
		});
	};
})( jQuery );